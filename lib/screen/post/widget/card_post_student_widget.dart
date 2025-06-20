// lib/screen/post/widget/card_post_student_widget.dart
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/providers/auth_provider.dart';
import 'package:learnza/providers/post_provider.dart';
import 'package:learnza/screen/post/edit_post_screen.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/posts/posts_model.dart';
import '../../../model/users/users_model.dart';
import '../../../utils/resource_util.dart';
import '../../../utils/theme.dart';

class CardPostStudentWidget extends StatelessWidget {
  final PostsModel post;
  final UsersModel user;

  const CardPostStudentWidget(
      {super.key, required this.post, required this.user});

  void _deletePost(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: const Text('Delete Post'),
        description: const Text(
            'Are you sure you want to delete this post? This action cannot be undone.'),
        actions: [
          ShadButton.outline(
            child: const Text('Cancel'),
            onPressed: () => context.pop(),
          ),
          ShadButton.destructive(
            child: const Text('Delete'),
            onPressed: () {
              context.read<PostProvider>().deletePost(post.id);
              context.pop();
            },
          ),
        ],
      ),
    );
  }

  void _editPost(BuildContext context) {
    showShadSheet(
      context: context,
      side: ShadSheetSide.bottom,
      builder: (context) => EditPostScreen(post: post),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: OpenContainer(
        closedBuilder: (context, action) => _buildPostCardTile(context),
        openBuilder: (context, action) => _buildPostDetailPage(context),
        transitionType: ContainerTransitionType.fade,
      ),
    );
  }

  Widget _buildPostCardTile(BuildContext context) {
    final currentUser = context.watch<AuthProvider>().user;
    final isAuthor = currentUser?.uid == post.authorId;
    final isLiked = post.engagementMetrics.likes.contains(currentUser?.uid);

    return ShadCard(
      border: const Border(
        top: BorderSide(
          color: primaryColor,
          width: 4,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ShadAvatar(
                      user.profileImageURL ?? ResourceUtil.defaultProfileImage,
                      placeholder: Text(user.fullName.substring(0, 2)),
                      size: const Size(50, 50),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.fullName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          'Created on ${DateFormat('MMM d, yyyy').format(post.createdAt)}',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        if (currentUser != null) {
                          context
                              .read<PostProvider>()
                              .toggleLike(post.id, currentUser.uid);
                        }
                      },
                    ),
                    if (isAuthor)
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _editPost(context);
                          } else if (value == 'delete') {
                            _deletePost(context);
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  post.content,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                if (post.thumbnailUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Hero(
                      tag: 'post_image_${post.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: post.thumbnailUrl!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                              color: Colors.grey.shade200,
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.blue.shade200))),
                          errorWidget: (context, url, error) => Container(
                              color: Colors.grey.shade200,
                              child: Icon(Icons.error_outline,
                                  size: 50, color: Colors.grey.shade500)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildPostDetailPage(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () => context.pop(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'post_image_${post.id}',
                child: post.thumbnailUrl != null
                    ? CachedNetworkImage(
                        imageUrl: post.thumbnailUrl!,
                        width: double.infinity,
                        fit: BoxFit.cover)
                    : Container(color: Colors.grey.shade200),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: user.profileImageURL != null
                            ? NetworkImage(user.profileImageURL!)
                            : null,
                        child: user.profileImageURL == null
                            ? Text(user.fullName.substring(0, 2))
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.fullName,
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                              'Published on ${DateFormat('MMMM d, yyyy').format(post.createdAt)}',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(post.content,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
