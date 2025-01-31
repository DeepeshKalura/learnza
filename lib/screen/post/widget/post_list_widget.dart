import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/state/posts/posts_state_provider.dart';
import '../../../utils/theme.dart';
import 'card_post_student_widget.dart';

class PostsListWidget extends StatefulWidget {
  const PostsListWidget({super.key});

  @override
  State<PostsListWidget> createState() => _PostsListWidgetState();
}

class _PostsListWidgetState extends State<PostsListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostsStateProvider>().getPaginationPosts();
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<PostsStateProvider>().getPaginationPosts();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsStateProvider>(
      builder: (context, postsProvider, _) {
        if (postsProvider.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${postsProvider.error}'),
                ShadButton(
                  onPressed: () {
                    postsProvider.reset();
                    postsProvider.getPaginationPosts();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (postsProvider.posts.isEmpty && postsProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: primaryColor),
          );
        }

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: postsProvider.posts.length +
                  (postsProvider.isLoading || !postsProvider.hasMorePosts
                      ? 1
                      : 0),
              itemBuilder: (context, index) {
                if (index >= postsProvider.posts.length) {
                  if (postsProvider.isLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(color: primaryColor),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No more posts'),
                      ),
                    );
                  }
                }

                final post = postsProvider.posts.keys.elementAt(index);
                final user = postsProvider.posts[post]!;

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
