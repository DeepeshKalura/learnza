import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animations/animations.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/service/anna_archieve_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../model/books/books_model.dart';
import '../../../../router/app_urls.dart';
import '../../../../utils/theme.dart';
import 'package:learnza/locator/injector.dart' as di;

class BooksCardLibraryStudentWidget extends StatefulWidget {
  const BooksCardLibraryStudentWidget({
    super.key,
    required this.booksModel,
    this.isAnnaBook = false,
  });

  final BooksModel booksModel;
  final bool isAnnaBook;

  @override
  BooksCardLibraryStudentWidgetState createState() =>
      BooksCardLibraryStudentWidgetState();
}

class BooksCardLibraryStudentWidgetState
    extends State<BooksCardLibraryStudentWidget> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) => _buildBookTile(),
      openBuilder: (context, action) => widget.booksModel.founded
          ? _buildBookDetailsPage()
          : _showNotAvailableDialog(),
      transitionType: ContainerTransitionType.fade,
    );
  }

  Widget _showNotAvailableDialog() {
    return ShadDialog(
      title: const Text('Book Not Available'),
      description: const Text(
        'Sorry, this book is currently not available in the library.',
      ),
      actions: [
        ShadButton(
          backgroundColor: primaryColor,
          onPressed: () => context.pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildBookTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShadCard(
        backgroundColor:
            widget.booksModel.founded ? Colors.white : Colors.red.shade200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'book_cover_${widget.booksModel.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: widget.booksModel.thumbnail ??
                      "https://covers.openlibrary.org/b/id/14825735-L.jpg",
                  width: 150,
                  height: 250,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: widget.booksModel.founded
                        ? Colors.grey.shade200
                        : Colors.red.shade50,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: widget.booksModel.founded
                            ? Colors.blue.shade200
                            : Colors.red.shade200,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: widget.booksModel.founded
                        ? Colors.grey.shade200
                        : Colors.red.shade50,
                    child: Icon(
                      Icons.book_outlined,
                      size: 50,
                      color: widget.booksModel.founded
                          ? Colors.grey.shade500
                          : Colors.red.shade300,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5 - 10,
                    child: Text(
                      widget.booksModel.bookTitle ?? "No title available",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ShadTheme.of(context).textTheme.h4.copyWith(
                            fontWeight: FontWeight.bold,
                            color: widget.booksModel.founded
                                ? Colors.black
                                : Colors.red.shade900,
                          ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5 - 10,
                    child: Text(
                      widget.booksModel.description ??
                          "No description available",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: ShadTheme.of(context).textTheme.p.copyWith(
                            color: widget.booksModel.founded
                                ? Colors.grey
                                : Colors.red.shade700,
                          ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "by ${widget.booksModel.author?.first ?? "Anonymous"}",
                    style: ShadTheme.of(context).textTheme.p.copyWith(
                          color: widget.booksModel.founded
                              ? Colors.black
                              : Colors.red.shade800,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'book_cover_${widget.booksModel.id}',
                child: CachedNetworkImage(
                  imageUrl: widget.booksModel.thumbnail ??
                      "https://covers.openlibrary.org/b/id/14825735-L.jpg",
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
                    widget.booksModel.bookTitle ?? "No title available",
                    style: ShadTheme.of(context).textTheme.p.copyWith(
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
                    widget.booksModel.description ?? "No description available",
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
        child: ShadButton(
          backgroundColor: primaryColor,
          onPressed: widget.booksModel.founded
              ? () {
                  if (!widget.isAnnaBook) {
                    context.pushReplacementNamed(
                      AppUrls.downloadBookScreen,
                      extra: {
                        'bookUrl': widget.booksModel.bookUrl,
                        'book': widget.booksModel,
                      },
                    );
                  } else {
                    // logic web view
                    // TODO: Implement web view for Anna books

                    di.injector
                        .get<AnnasArchieveService>()
                        .getDownloadUrl(widget.booksModel.bookUrl)
                        .then((value) async {
                      if (value != null) {
                        context.pushReplacementNamed(
                          AppUrls.annaWebViewScreen,
                          extra: {
                            'url': value,
                            'book': widget.booksModel,
                          },
                        );
                      } else {
                        ShadToaster.of(context).show(
                          ShadToast.destructive(
                            title: const Text('Book Not Available'),
                            description: const Text(
                                'Sorry, this book is currently not available in the library.'),
                            action: ShadButton.outline(
                              child: const Text(
                                'Ok',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => ShadToaster.of(context).hide(),
                            ),
                          ),
                        );
                      }
                    });

                    // context.pushNamed(
                    //   AppUrls.annaWebViewScreen,
                    //   extra: {
                    //     'url': widget.booksModel.bookUrl,
                    //   },
                    // );
                  }
                }
              : null,
          child: const Text('Read Now'),
        ),
      ),
    );
  }
}
