import 'dart:io';

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:learnza/service/anna_archieve_service.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/books/books_model.dart';
import '../../../providers/book_provider.dart';
import '../../../router/app_urls.dart';
import '../../../utils/theme.dart';

class BooksCardLibraryStudentWidget extends StatefulWidget {
  const BooksCardLibraryStudentWidget({
    super.key,
    required this.booksModel,
    required this.isDownloading,
    this.isAnnaBook = false,
  });

  final BooksModel booksModel;
  final bool isAnnaBook;
  final bool isDownloading;

  @override
  BooksCardLibraryStudentWidgetState createState() =>
      BooksCardLibraryStudentWidgetState();
}

class BooksCardLibraryStudentWidgetState
    extends State<BooksCardLibraryStudentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: OpenContainer(
        closedBuilder: (context, action) => _buildBookTile(),
        openBuilder: (context, action) => widget.booksModel.founded
            ? _buildBookDetailsPage()
            : _showNotAvailableDialog(),
        transitionType: ContainerTransitionType.fade,
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 150,
      height: 250,
      color:
          widget.booksModel.founded ? Colors.grey.shade200 : Colors.red.shade50,
      child: Icon(
        Icons.book_outlined,
        size: 50,
        color: widget.booksModel.founded
            ? Colors.grey.shade500
            : Colors.red.shade300,
      ),
    );
  }

  Widget _buildImage(String? imagePath) {
    if (imagePath == null) {
      return _buildPlaceholder();
    }

    if (imagePath.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        width: 150,
        height: 250,
        fit: BoxFit.cover,
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildPlaceholder(),
      );
    }

    final file = File(imagePath);
    return Image.file(
      file,
      width: 150,
      height: 250,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
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
    return ShadCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'book_cover_${widget.booksModel.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildImage(widget.booksModel.thumbnail),
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
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 - 10,
                  child: Text(
                    widget.booksModel.description ?? "No description available",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: ShadTheme.of(context).textTheme.p.copyWith(),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "by ${widget.booksModel.author?.first ?? "Anonymous"}",
                  style: ShadTheme.of(context).textTheme.p.copyWith(),
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
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'book_cover_${widget.booksModel.id}',
                child: _buildImage(widget.booksModel.thumbnail),
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
        child: Consumer<BookProvider>(
          builder: (context, bookProvider, child) {
            return ShadButton(
              backgroundColor: primaryColor,
              onPressed: bookProvider.isDancingBook
                  ? null
                  : !widget.isDownloading
                      ? () {
                          context.pushNamed(
                            AppUrls.readBookReadScreen,
                            extra: {
                              'book': widget.booksModel,
                            },
                          );
                        }
                      : widget.booksModel.founded
                          ? () async {
                              if (!widget.isAnnaBook) {
                                if (mounted) {
                                  context.pushReplacementNamed(
                                    AppUrls.downloadBookScreen,
                                    extra: {
                                      'bookUrl': widget.booksModel.bookUrl,
                                      'book': widget.booksModel,
                                    },
                                  );
                                }
                              } else {
                                var book = await context
                                    .read<BookProvider>()
                                    .checkAnnaBookInLernzaLibary(
                                      widget.booksModel.id,
                                    );

                                if (book == null) {
                                  di.injector
                                      .get<AnnasArchieveService>()
                                      .getDownloadUrl(widget.booksModel.bookUrl)
                                      .then((value) async {
                                    if (value['url'] != null) {
                                      if (mounted) {
                                        context.pushReplacementNamed(
                                          AppUrls.annaWebViewScreen,
                                          extra: {
                                            'url': value['url'],
                                            'book': widget.booksModel.copyWith(
                                              description: value['description'],
                                            ),
                                          },
                                        );
                                      }
                                    } else {
                                      ShadToaster.of(context).show(
                                        ShadToast.destructive(
                                          title:
                                              const Text('Book Not Available'),
                                          description: const Text(
                                              'Sorry, this book is currently not available in the library.'),
                                          action: ShadButton.outline(
                                            child: const Text(
                                              'Ok',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () =>
                                                ShadToaster.of(context).hide(),
                                          ),
                                        ),
                                      );
                                    }
                                  });
                                } else {
                                  if (mounted) {
                                    context.pushReplacementNamed(
                                      AppUrls.downloadBookScreen,
                                      extra: {
                                        'bookUrl': widget.booksModel.bookUrl,
                                        'book': widget.booksModel,
                                      },
                                    );
                                  }
                                }
                              }
                            }
                          : null,
              child: bookProvider.isDancingBook
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : widget.isDownloading
                      ? const Text("Download Book")
                      : const Text('Read Now'),
            );
          },
        ),
      ),
    );
  }

  // TODO: Improve readability of this function and also understandbility of this code[PR#31]
  void _handleReadNow(BuildContext context) async {
    if (!widget.isAnnaBook) {
      if (mounted) {
        context.pushReplacementNamed(
          AppUrls.downloadBookScreen,
          extra: {
            'bookUrl': widget.booksModel.bookUrl,
            'book': widget.booksModel,
          },
        );
      }
    } else {
      await _handleAnnaBook(context);
    }
  }

  Future<void> _handleAnnaBook(BuildContext context) async {
    var book = await context
        .read<BookProvider>()
        .checkAnnaBookInLernzaLibary(widget.booksModel.id);
    if (book != null) {
      if (mounted) {
        // context.pushReplacementNamed(AppUrls.downloadBookScreen, extra: { ... });
      }
    } else {
      var value = await di.injector
          .get<AnnasArchieveService>()
          .getDownloadUrl(widget.booksModel.bookUrl);
      // context.pushReplacementNamed(AppUrls.annaWebViewScreen, extra: { ... });
    }
  }

  void _showBookNotAvailableToast(context) {
    ShadToaster.of(context).show(
      ShadToast.destructive(
        title: const Text('Book Not Available'),
        description: const Text(
            'Sorry, this book is currently not available in the library.'),
        action: ShadButton.outline(
          child: Text('Ok', style: ShadTheme.of(context).textTheme.p),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  }
}
