import 'package:flutter/material.dart';

import '../../../model/comment/comments_model.dart';
import '../../../model/posts/posts_model.dart';
import '../../post_provider.dart';

class PostStudentStateProvider extends ChangeNotifier {
  final PostProvider postProvider;

  PostStudentStateProvider({required this.postProvider});

  List<CommentsModel>? comment;

  bool isLiked = false;

  void isPostLiked(PostsModel post) {
    isLiked = post.engagementMetrics.likes
        .contains(postProvider.firebaseService.auth.currentUser!.uid);
    notifyListeners();
  }

  // TODO: [PR#25]
  void isPostSaved() {}
}
