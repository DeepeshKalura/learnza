import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

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
      );

      await firebaseService.database.collection('posts').doc(newPost.id).set(
            newPost.toJson(),
          );
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

  Stream<Map<PostsModel, UsersModel>> getPostsAndUsersWithPagination(
      int limit) {
    return firebaseService.database
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .asyncMap((snapshot) async {
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
