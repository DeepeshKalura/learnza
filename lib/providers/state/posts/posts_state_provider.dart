import 'package:flutter/material.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../model/posts/posts_model.dart';
import '../../../model/users/users_model.dart';
import '../../model/post_provider.dart';

class PostsStateProvider extends ChangeNotifier {
  Map<PostsModel, UsersModel> posts = {};
  bool isLoading = false;
  bool hasMorePosts = true;
  String? error;

  Future<void> getPaginationPosts() async {
    await di.injector<PostProvider>().getPosts();
    try {
      isLoading = true;
      notifyListeners();

      final newPosts = await di.injector<PostProvider>().getPosts();
      if (newPosts.isEmpty) {
        hasMorePosts = false;
      } else {
        for (var entry in newPosts.entries) {
          posts[entry.key] = entry.value;
        }
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> reset() async {
    posts.clear();
    hasMorePosts = true;
    error = null;
    notifyListeners();
  }
}
