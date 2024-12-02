import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animations/animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../model/books/books_model.dart';

class BooksCardLibraryStudentWidget extends StatefulWidget {
  const BooksCardLibraryStudentWidget({
    super.key,
    required this.booksModel,
  });

  final BooksModel booksModel;

  @override
  BooksCardLibraryStudentWidgetState createState() =>
      BooksCardLibraryStudentWidgetState();
}

class BooksCardLibraryStudentWidgetState
    extends State<BooksCardLibraryStudentWidget> {
  bool _isLiked = false;
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) => _buildBookTile(),
      openBuilder: (context, action) => _buildBookDetailsPage(),
      transitionType: ContainerTransitionType.fade,
    );
  }

  Widget _buildBookTile() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Book Image
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 8,
                      offset: Offset(0, 0.2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Hero(
                  tag: 'book_cover_${widget.booksModel.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: widget.booksModel.coverImageUrl ?? "",
                      width: 150,
                      height: 250,
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
                          Icons.book_outlined,
                          size: 50,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Book Title
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.booksModel.bookTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          // Positioned Interaction Buttons
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              children: [
                // Like Button
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.7),
                  child: IconButton(
                    icon: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.red : Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                  ),
                ),

                const SizedBox(width: 8),

                // Bookmark Button
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.7),
                  child: IconButton(
                    icon: Icon(
                      _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: _isBookmarked ? Colors.blue : Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isBookmarked = !_isBookmarked;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookDetailsPage() {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(
                    LucideIcons.arrowLeft,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            expandedHeight: 500,
            pinned: true,
            actions: [
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // Implement share functionality
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'book_cover_${widget.booksModel.id}',
                child: CachedNetworkImage(
                  imageUrl: widget.booksModel.coverImageUrl ?? "",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Book Details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.booksModel.bookTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "by ${widget.booksModel.author}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
                  const SizedBox(height: 16),

                  // Book Description
                  Text(
                    widget.booksModel.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Action Bar
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              },
            ),
            IconButton(
              icon: Icon(
                _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: _isBookmarked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isBookmarked = !_isBookmarked;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // Implement share functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
