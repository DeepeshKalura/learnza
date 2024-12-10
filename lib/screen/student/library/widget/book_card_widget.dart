import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/utils/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../model/books/books_model.dart';
import '../../../../router/app_urls.dart';
import '../../../../service/local_database_service.dart';

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

@override
class _BookDownloadScreenState extends State<BookDownloadScreen> {
  double _downloadProgress = 0.0;
  bool _isDownloading = false;
  String _downloadStatus = 'Ready to Download';
  CancelToken? _cancelToken;

  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();

    _checkIfBookDownloaded();
  }

  Future<void> _checkIfBookDownloaded() async {
    final localPath = await _getFilePath('${widget.booksModel.id}.pdf');
    final file = File(localPath);

    if (await file.exists()) {
      setState(() {
        _downloadProgress = 1.0;
        _downloadStatus = 'Download Complete';
      });
    }
  }

  Future<String> _getFilePath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$filename';
  }

  Future<void> _downloadBook() async {
    setState(() {
      _isDownloading = true;
      _downloadStatus = 'Downloading...';
      _cancelToken = CancelToken();
    });

    try {
      final filePath = await _getFilePath('${widget.booksModel.id}.pdf');

      await _dio.download(
        widget.bookUrl,
        filePath,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress = received / total;
              _downloadStatus =
                  'Downloading: ${(_downloadProgress * 100).toStringAsFixed(0)}%';
            });
          }
        },
      );

      await LocalDatabaseService.instance.insert(BooksModel(
        id: widget.booksModel.id,
        bookTitle: widget.booksModel.bookTitle,
        bookUrl: filePath,
        language: 'en',
        categories: ['default'],
        isActive: true,
        createdAt: DateTime.now(),
        founded: true,
        moreImageUrl: [],
        author: [],
      ));

      setState(() {
        _downloadProgress = 1.0;
        _isDownloading = false;
        _downloadStatus = 'Download Complete';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('${widget.booksModel.bookTitle} downloaded successfully')),
      );
    } on DioException catch (e) {
      setState(() {
        _isDownloading = false;
        _downloadStatus = 'Download Failed: ${e.message}';
      });

      const ShadAlert.destructive(
        iconSrc: LucideIcons.circleAlert,
        title: Text('Error'),
        description: Text('Your session has expired. Please log in again.'),
      );
    }
  }

  void _cancelDownload() {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken?.cancel();
      setState(() {
        _isDownloading = false;
        _downloadStatus = 'Download Cancelled';
      });
    }
  }

  void _openBook() {
    context.pushReplacementNamed(AppUrls.offlineLibarayCommonScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.booksModel.bookTitle.toString()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
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
                      image: widget.booksModel.thumbnail?.isNotEmpty ?? false
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
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        : null,
                  ),
                ),

                const SizedBox(height: 24),

                // Download Information Card
                ShadCard(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.booksModel.bookTitle.toString(),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _downloadStatus,
                          style: TextStyle(
                            color: _downloadProgress == 1.0
                                ? Colors.green
                                : Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShadProgress(
                          value: _downloadProgress,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _downloadProgress == 1.0
                                ? successColor
                                : primaryColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isDownloading)
                              ElevatedButton(
                                onPressed: _cancelDownload,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: dangerColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Cancel Download'),
                              ),
                            if (!_isDownloading && _downloadProgress < 1.0)
                              ElevatedButton(
                                onPressed: _downloadBook,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Download Book'),
                              ),
                            if (_downloadProgress == 1.0)
                              ElevatedButton(
                                onPressed: _openBook,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: successColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Read Book'),
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
      ),
    );
  }
}
