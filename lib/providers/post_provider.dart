import 'dart:developer' as developer;

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
  }) async {
    isLoading = true;
    notifyListeners();
    var authorId = firebaseService.auth.currentUser!.uid;
    String? thumbnailUrl;
    if (thumbnail != null) {
      try {
        final storageRef = firebaseService.storage
            .ref('users/posts/$authorId/${thumbnail!.name}');

        if (kIsWeb) {
          Uint8List imageData = await thumbnail!.readAsBytes();

          final snapShot = await storageRef.putData(imageData);

          thumbnailUrl = await snapShot.ref.getDownloadURL();
        } else {
          File file = File(thumbnail!.path);
          developer.log(thumbnail!.path);
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
        engagementMetrics: const PostEngagementMetrics(),
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
              // ? We have to manually convert the `engagementMetrics` to JSON because the `frezze` package is not supporting
              postData['engagementMetrics'] =
                  newPost.engagementMetrics.toJson();

              // Convert `newGlobalPostMetrics` to JSON
              final metricsData =
                  await transaction.get(globalPostMertricsDocRef);

              // Increment the totalPosts by 1
              var newMetricsData = metricsData.data();

              developer.log('Metrics data: $newMetricsData');

              newMetricsData!['totalPosts'] = newMetricsData['totalPosts'] + 1;
              newMetricsData['activePosts'] = newMetricsData['activePosts'] + 1;

              developer.log('Metrics data: $newMetricsData');

              // Write the new post
              transaction.set(postDocRef, postData);
              transaction.update(globalPostMertricsDocRef, newMetricsData);
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

  List<Map<PostsModel, UsersModel>> getPostsAndUsers(nextPosts) {
    // TODO: Implement this method and switch from the `getPostsAndUsersWithPagination` method [PR#35]
    return [];
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
        developer.log("I am just chiling");
        return <PostsModel, UsersModel>{};
      }

      final posts =
          snapshot.docs.map((doc) => PostsModel.fromJson(doc.data())).toList();
      final users = await Future.wait(posts.map((post) async {
        final userDoc = await firebaseService.database
            .collection('users')
            .doc(post.authorId)
            .get();

        return UsersModel.fromJson(userDoc.data()!);
      }));

      final postsWithUsers = <PostsModel, UsersModel>{};
      for (var i = 0; i < posts.length; i++) {
        postsWithUsers[posts[i]] = users[i];
      }
      return postsWithUsers;
    });
  }
}
