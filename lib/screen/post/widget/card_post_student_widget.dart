import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/posts/posts_model.dart';
import '../../../model/users/users_model.dart';
import '../../../utils/resource_util.dart';
import '../../../utils/theme.dart';

class CardPostStudentWidget extends StatefulWidget {
  final PostsModel post;
  final UsersModel user;

  const CardPostStudentWidget(
      {super.key, required this.post, required this.user});

  @override
  CardPostStudentWidgetState createState() => CardPostStudentWidgetState();
}

class CardPostStudentWidgetState extends State<CardPostStudentWidget> {
  bool _isLiked = false;
  // TODO: Create the bookmark feature to save post
  // final bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: OpenContainer(
        closedBuilder: (context, action) => _buildPostCardTile(),
        openBuilder: (context, action) => _buildPostDetailPage(),
        transitionType: ContainerTransitionType.fade,
      ),
    );
  }

  Widget _buildPostCardTile() {
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
          // User Info and Interactions
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // User Profile
                Row(
                  children: [
                    ShadAvatar(
                      widget.user.profileImageURL ??
                          ResourceUtil.defaultProfileImage,
                      placeholder: Text(
                        widget.user.fullName.substring(0, 2),
                      ),
                      size: const Size(50, 50),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.fullName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Created on ${DateFormat('MMM d, yyyy').format(widget.post.createdAt)}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Interaction Buttons
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          // TODO: rather creating entire state again you should create a postManagementUiProvider and manage state throguht that [PR#26]
                          _isLiked = !_isLiked;
                          // context.provider<PostProvider>().likePost(widget.post.id);
                        });
                      },
                    ),
                    // TODO: In future create bookmak feature to save post[PR#25]
                    // IconButton(
                    //   icon: Icon(
                    //     _isBookmarked
                    //         ? Icons.bookmark
                    //         : Icons.bookmark_border,
                    //     color: _isBookmarked ? Colors.blue : Colors.grey,
                    //   ),
                    //   onPressed: () {
                    //     setState(() {
                    //       _isBookmarked = !_isBookmarked;
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),

          // Post Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.post.content,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                // Thumbnail Image
                if (widget.post.thumbnailUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Hero(
                      tag: 'post_image_${widget.post.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: widget.post.thumbnailUrl!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey.shade200,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue.shade200,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey.shade200,
                            child: Icon(
                              Icons.error_outline,
                              size: 50,
                              color: Colors.grey.shade500,
                            ),
                          ),
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

  Widget _buildPostDetailPage() {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Detailed Post App Bar
          SliverAppBar(
            leading: InkWell(
              onTap: () => context.pop(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            actions: const [
              // IconButton(
              //   icon: const CircleAvatar(
              //     backgroundColor: Colors.black54,
              //     child: Icon(
              //       Icons.share,
              //       color: Colors.white,
              //     ),
              //   ),
              //   onPressed: () {
              //     // Implement share functionality
              //   },
              // ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'post_image_${widget.post.id}',
                child: widget.post.thumbnailUrl != null
                    ? CachedNetworkImage(
                        imageUrl: widget.post.thumbnailUrl!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(color: Colors.grey.shade200),
              ),
            ),
          ),

          // Post Details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post Title
                  Text(
                    widget.post.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  // User Information
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: widget.user.profileImageURL != null
                            ? NetworkImage(widget.user.profileImageURL!)
                            : null,
                        child: widget.user.profileImageURL == null
                            ? Text(widget.user.fullName.substring(0, 2))
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.fullName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Published on ${DateFormat('MMMM d, yyyy').format(widget.post.createdAt)}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Post Content
                  const SizedBox(height: 20),
                  Text(
                    widget.post.content,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Action Bar
      // TODO: In Future Complete the Post Navigation Bar with More Features [PR#]
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //         icon: Icon(
      //           _isLiked ? Icons.favorite : Icons.favorite_border,
      //           color: _isLiked ? Colors.red : Colors.grey,
      //         ),
      //         onPressed: () {
      //           setState(() {
      //             _isLiked = !_isLiked;
      //           });
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(
      //           _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
      //           color: _isBookmarked ? Colors.blue : Colors.grey,
      //         ),
      //         onPressed: () {
      //           setState(() {
      //             _isBookmarked = !_isBookmarked;
      //           });
      //         },
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.share),
      //         onPressed: () {
      //           // Implement share functionality
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
