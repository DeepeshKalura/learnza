import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/books/books_model.dart';
import '../../../providers/state/libary/download_books_libary_state_provider.dart';
import '../../../router/app_urls.dart';
import '../../../utils/theme.dart';

class BookDownloadScreen extends StatefulWidget {
  final String bookUrl;
  final BooksModel booksModel;

  const BookDownloadScreen({
    super.key,
    required this.bookUrl,
    required this.booksModel,
  });

  @override
  State<BookDownloadScreen> createState() => _BookDownloadScreenState();
}

class _BookDownloadScreenState extends State<BookDownloadScreen> {
  @override
  void initState() {
    super.initState();
    _checkIfBookDownloaded();
  }

  Future<void> _checkIfBookDownloaded() async {
    final provider = context.read<DownloadBooksLibaryStateProvider>();
    print('${widget.booksModel.id}.pdf');
    await provider.hasBookBeenDownloaded('${widget.booksModel.id}.pdf');
  }

  void _openBook() {
    context.pushReplacementNamed(AppUrls.offlineLibarayCommonScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.booksModel.bookTitle.toString(),
          style: ShadTheme.of(context).textTheme.h4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<DownloadBooksLibaryStateProvider>(
        builder: (context, provider, child) {
          String downloadStatus = 'Ready to Download';
          if (provider.isDownloading) {
            downloadStatus =
                'Downloading: ${(provider.downloadProgress * 100).toStringAsFixed(0)}%';
          } else if (provider.status == DownloadStatus.completed) {
            downloadStatus = 'Download Complete';
          } else if (provider.status == DownloadStatus.failed) {
            downloadStatus = provider.errorMessage;
          }

          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: 250,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image:
                              widget.booksModel.thumbnail?.isNotEmpty ?? false
                                  ? DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        widget.booksModel.thumbnail!,
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                        ),
                        child: widget.booksModel.thumbnail?.isEmpty ?? true
                            ? Center(
                                child: Text(
                                  widget.booksModel.bookTitle ?? 'No Image',
                                  textAlign: TextAlign.center,
                                  style: ShadTheme.of(context).textTheme.h4,
                                ),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ShadCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.booksModel.bookTitle.toString(),
                              style: ShadTheme.of(context).textTheme.h3,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            if (provider.isDownloading)
                              Text(
                                "Book is downloading, please wait",
                                style:
                                    ShadTheme.of(context).textTheme.p.copyWith(
                                          color: dangerColor,
                                        ),
                              ),
                            const SizedBox(height: 12),
                            Text(
                              downloadStatus,
                              style: ShadTheme.of(context).textTheme.list,
                            ),
                            const SizedBox(height: 12),
                            ShadProgress(
                              value: provider.downloadProgress,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                provider.status == DownloadStatus.completed
                                    ? successColor
                                    : primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (provider.isDownloading)
                                  Expanded(
                                    child: ShadButton(
                                      onPressed: provider.cancelDownload,
                                      child: Text(
                                        'Cancel Download',
                                        style: ShadTheme.of(context)
                                            .textTheme
                                            .list,
                                      ),
                                    ),
                                  ),
                                if (!provider.isDownloading &&
                                    provider.status != DownloadStatus.completed)
                                  Expanded(
                                    child: ShadButton(
                                      onPressed: () => provider.downloadBook(
                                        widget.booksModel,
                                        widget.bookUrl,
                                      ),
                                      child: Text(
                                        'Download Book',
                                        style: ShadTheme.of(context)
                                            .textTheme
                                            .list,
                                      ),
                                    ),
                                  ),
                                if (provider.status == DownloadStatus.completed)
                                  Expanded(
                                    child: ShadButton(
                                      backgroundColor: successColor,
                                      onPressed: _openBook,
                                      child: const Text('Read Book'),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
