import 'dart:developer' as developer;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../model/metrics/post_metrics.dart';
import '../../model/posts/posts_model.dart';
import '../../model/users/users_model.dart';
import '../../service/firebase_service.dart';

class PostProvider {
  final FirebaseService firebaseService;

  PostProvider({required this.firebaseService});

  QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  Future<Map<PostsModel, UsersModel>> getPosts({int limit = 25}) async {
    try {
      final Query<Map<String, dynamic>> postsQuery = _getPostsQuery(limit);

      final QuerySnapshot<Map<String, dynamic>> postSnapshots =
          await postsQuery.get();

      if (postSnapshots.docs.isEmpty) {
        developer.log('No posts found');
        return {};
      }

      lastVisible = postSnapshots.docs.last;

      final List<PostsModel> posts = postSnapshots.docs.map((doc) {
        return PostsModel.fromJson(doc.data());
      }).toList();

      developer.log('Posts: $posts');

      final List<String> uniqueUserIds =
          posts.map((post) => post.authorId).toSet().toList();
      final Map<String, UsersModel> usersByIdMap =
          await _fetchUsersByIds(uniqueUserIds);

      final Map<PostsModel, UsersModel> postsWithUsers = {};
      for (final post in posts) {
        final user = usersByIdMap[post.authorId];
        if (user != null) {
          postsWithUsers[post] = user;
        } else {
          developer.log('Warning: User not found for post ${post.id}');
        }
      }

      return postsWithUsers;
    } catch (e, stackTrace) {
      developer.log(
        'Error fetching posts and users',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Query<Map<String, dynamic>> _getPostsQuery(int limit) {
    final baseQuery = firebaseService.database
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(limit);

    return lastVisible != null
        ? baseQuery.startAfterDocument(lastVisible!)
        : baseQuery;
  }

  Future<Map<String, UsersModel>> _fetchUsersByIds(List<String> userIds) async {
    try {
      // Batch get all users
      final userDocs = await Future.wait(userIds.map((userId) =>
          firebaseService.database.collection('users').doc(userId).get()));

      return Map.fromEntries(
        userDocs.where((doc) => doc.exists && doc.data() != null).map(
              (doc) => MapEntry(
                doc.id,
                UsersModel.fromJson(
                  {
                    ...doc.data()!,
                    'id': doc.id,
                  },
                ),
              ),
            ),
      );
    } catch (e, s) {
      developer.log(
        'Error fetching users',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  void resetPagination() {
    lastVisible = null;
  }

  Future<String> uploadImage(XFile image) async {
    try {
      var authorId = firebaseService.auth.currentUser!.uid;
      final storageRef = firebaseService.storage.ref(
        'users/posts/$authorId/${image.name}',
      );

      File file = File(image.path);
      final snapShot = await storageRef.putFile(file);
      return await snapShot.ref.getDownloadURL();
    } catch (e, s) {
      developer.log('Error uploading image', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> createPost(
      {required String title,
      required String description,
      XFile? thumbnail}) async {
    try {
      String? thumbnailUrl;
      if (thumbnail != null) {
        thumbnailUrl = await uploadImage(thumbnail);
      }

      final post = PostsModel(
        id: const Uuid().v4(),
        title: title,
        content: description,
        authorId: firebaseService.auth.currentUser!.uid,
        thumbnailUrl: thumbnailUrl,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        engagementMetrics: const PostEngagementMetrics(),
      );

      final postDocRef =
          firebaseService.database.collection('posts').doc(post.id);

      final globalPostMertricsDocRef = firebaseService.database
          .collection('global-post-metrics')
          .doc("LwOyb4Ffxn9Kj1122mqg");

      await firebaseService.database.runTransaction((transaction) async {
        final postData = post.toJson();

        postData['engagementMetrics'] = post.engagementMetrics.toJson();

        final metricsData = await transaction.get(globalPostMertricsDocRef);

        var newMetricsData = metricsData.data();

        newMetricsData!['totalPosts'] = newMetricsData['totalPosts'] + 1;
        newMetricsData['activePosts'] = newMetricsData['activePosts'] + 1;

        transaction.set(postDocRef, postData);
        transaction.update(globalPostMertricsDocRef, newMetricsData);
      }).catchError(
        (error) {
          developer.log('Transaction failed: $error');
          throw error;
        },
      );
    } catch (e, s) {
      developer.log('Error creating post', error: e, stackTrace: s);
      rethrow;
    }
  }

  void updatePost() {}

  void deletePost() {}
}
