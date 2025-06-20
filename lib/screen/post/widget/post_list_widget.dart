// lib/screen/post/widget/post_list_widget.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/posts/posts_model.dart';
import '../../../model/users/users_model.dart';
import '../../../providers/post_provider.dart';
import '../../../utils/theme.dart';
import 'card_post_student_widget.dart';

class PostsListWidget extends StatefulWidget {
  const PostsListWidget({super.key});

  @override
  State<PostsListWidget> createState() => _PostsListWidgetState();
}

class _PostsListWidgetState extends State<PostsListWidget> {
  @override
  Widget build(BuildContext context) {
    // We listen to the stream from PostProvider directly.
    return StreamBuilder<Map<PostsModel, UsersModel>>(
      stream: context.read<PostProvider>().getPostsAndUsersWithPagination(20),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: primaryColor),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No posts yet. Be the first to post!'),
          );
        }

        final postsMap = snapshot.data!;
        final posts = postsMap.keys.toList();

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final user = postsMap[post]!;
                return CardPostStudentWidget(
                  post: post,
                  user: user,
                  key: Key(post.id),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
