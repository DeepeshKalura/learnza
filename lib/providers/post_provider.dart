// lib/providers/post_provider.dart
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

import '../model/metrics/post_metrics.dart';
import '../model/posts/posts_model.dart';
import '../model/users/users_model.dart';
import '../service/firebase_service.dart';

class PostProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  var isLoading = false;
  XFile? thumbnail;
  PostProvider({required this.firebaseService});

  Future<void> createPost({
    required String title,
    required String content,
    // --- CHANGE 2: ACCEPT the thumbnail as an optional parameter.
    XFile? thumbnail,
  }) async {
    isLoading = true;
    notifyListeners();
    var authorId = firebaseService.auth.currentUser!.uid;
    String? thumbnailUrl;

    // --- CHANGE 3: USE the passed-in thumbnail parameter.
    if (thumbnail != null) {
      try {
        final storageRef = firebaseService.storage
            .ref('users/posts/$authorId/${thumbnail.name}');

        if (kIsWeb) {
          Uint8List imageData = await thumbnail.readAsBytes();
          final snapShot = await storageRef.putData(imageData);
          thumbnailUrl = await snapShot.ref.getDownloadURL();
        } else {
          File file = File(thumbnail.path);
          developer.log(thumbnail.path);
          final snapShot = await storageRef.putFile(file);
          thumbnailUrl = await snapShot.ref.getDownloadURL();
        }
      } catch (e, s) {
        developer.log('Error uploading thumbnail: $e');
        developer.log('Stacktrace: $s');
        rethrow;
      }
    }

    try {
      final newPost = PostsModel(
        id: const Uuid().v4(),
        title: title,
        content: content,
        thumbnailUrl: thumbnailUrl,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        authorId: authorId,
        engagementMetrics:
            const PostEngagementMetrics(likes: [], totalComments: 0),
      );

      final postDocRef =
          firebaseService.database.collection('posts').doc(newPost.id);

      final globalPostMertricsDocRef = firebaseService.database
          .collection('global-post-metrics')
          .doc("LwOyb4Ffxn9Kj1122mqg");

      await firebaseService.database
          .runTransaction(
            (transaction) async {
              final postData = newPost.toJson();
              postData['engagementMetrics'] =
                  newPost.engagementMetrics.toJson();

              final metricsSnapshot =
                  await transaction.get(globalPostMertricsDocRef);

              if (metricsSnapshot.exists) {
                transaction.set(postDocRef, postData);
                transaction.update(globalPostMertricsDocRef, {
                  'totalPosts': FieldValue.increment(1),
                  'activePosts': FieldValue.increment(1),
                });
              } else {
                // Handle case where metrics doc doesn't exist if necessary
                developer.log('Global metrics document not found!');
              }
            },
          )
          .then(
            (value) => developer.log('Transaction completed'),
          )
          .catchError((error) {
            developer.log('Transaction failed: $error');
            throw error;
          });
    } catch (e, s) {
      developer.log('Error creating post: $e');
      developer.log('Stacktrace: $s');
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );

      thumbnail = image;
    } catch (e, s) {
      developer.log('Error picking image: $e');
      developer.log('Stacktrace: $s');
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeImage() async {
    thumbnail = null;
    notifyListeners();
  }

  Future<void> toggleLike(String postId, String userId) async {
    final postRef = firebaseService.database.collection('posts').doc(postId);
    try {
      final doc = await postRef.get();
      if (doc.exists) {
        final post = PostsModel.fromJson(doc.data()!);
        final likes = post.engagementMetrics.likes;
        if (likes.contains(userId)) {
          // Unlike
          await postRef.update({
            'engagementMetrics.likes': FieldValue.arrayRemove([userId])
          });
        } else {
          // Like
          await postRef.update({
            'engagementMetrics.likes': FieldValue.arrayUnion([userId])
          });
        }
      }
    } catch (e) {
      developer.log('Error toggling like: $e');
      rethrow;
    }
  }

  Future<void> updatePost({
    required PostsModel post,
    required String newTitle,
    required String newContent,
    XFile? newThumbnail,
    bool removeThumbnail = false,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      String? updatedThumbnailUrl = post.thumbnailUrl;

      if (removeThumbnail && post.thumbnailUrl != null) {
        await firebaseService.storage.refFromURL(post.thumbnailUrl!).delete();
        updatedThumbnailUrl = null;
      } else if (newThumbnail != null) {
        if (post.thumbnailUrl != null) {
          await firebaseService.storage.refFromURL(post.thumbnailUrl!).delete();
        }
        updatedThumbnailUrl = await _uploadImage(newThumbnail);
      }

      final updatedPost = post.copyWith(
        title: newTitle,
        content: newContent,
        thumbnailUrl: updatedThumbnailUrl,
        updatedAt: DateTime.now(),
      );

      final Map<String, dynamic> postJson = updatedPost.toJson();
      postJson['engagementMetrics'] = updatedPost.engagementMetrics.toJson();

      await firebaseService.database
          .collection('posts')
          .doc(post.id)
          .update(postJson);
    } catch (e) {
      developer.log('Error updating post: $e');
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String> _uploadImage(XFile image) async {
    final authorId = firebaseService.auth.currentUser!.uid;
    final storageRef =
        firebaseService.storage.ref('users/posts/$authorId/${image.name}');
    File file = File(image.path);
    final snapShot = await storageRef.putFile(file);
    return await snapShot.ref.getDownloadURL();
  }

  Future<void> deletePost(String postId) async {
    try {
      final postDoc =
          await firebaseService.database.collection('posts').doc(postId).get();
      if (!postDoc.exists) return;

      final post = PostsModel.fromJson(postDoc.data()!);
      if (post.thumbnailUrl != null && post.thumbnailUrl!.isNotEmpty) {
        try {
          await firebaseService.storage.refFromURL(post.thumbnailUrl!).delete();
        } catch (e) {
          developer.log('Error deleting thumbnail: $e');
        }
      }

      await firebaseService.database.runTransaction((transaction) async {
        final postRef =
            firebaseService.database.collection('posts').doc(postId);
        final globalMetricsRef = firebaseService.database
            .collection('global-post-metrics')
            .doc("LwOyb4Ffxn9Kj1122mqg");

        transaction.delete(postRef);
        transaction.update(globalMetricsRef, {
          'totalPosts': FieldValue.increment(-1),
          'activePosts': FieldValue.increment(-1),
        });
      });
    } catch (e) {
      developer.log('Error deleting post: $e');
      rethrow;
    }
  }

  Stream<List<PostsModel>> getPostsWithPagination(int limit) {
    return firebaseService.database
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => PostsModel.fromJson(doc.data()))
          .toList();
    });
  }

  Stream<Map<PostsModel, UsersModel>> getPostsAndUsersWithPagination(
      int limit) {
    return firebaseService.database
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .asyncMap((snapshot) async {
      if (snapshot.docs.isEmpty) {
        return <PostsModel, UsersModel>{};
      }

      final posts =
          snapshot.docs.map((doc) => PostsModel.fromJson(doc.data())).toList();
      final userIds = posts.map((post) => post.authorId).toSet().toList();

      if (userIds.isEmpty) {
        return <PostsModel, UsersModel>{};
      }

      final usersSnapshot = await firebaseService.database
          .collection('users')
          .where('uid', whereIn: userIds)
          .get();

      final usersMap = {
        for (var doc in usersSnapshot.docs)
          doc.id: UsersModel.fromJson(doc.data())
      };

      final postsWithUsers = <PostsModel, UsersModel>{};
      for (var post in posts) {
        if (usersMap.containsKey(post.authorId)) {
          postsWithUsers[post] = usersMap[post.authorId]!;
        }
      }
      return postsWithUsers;
    });
  }
}
