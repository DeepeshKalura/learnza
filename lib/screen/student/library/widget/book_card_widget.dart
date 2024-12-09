import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

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
  BookDownloadScreenState createState() => BookDownloadScreenState();
}

class BookDownloadScreenState extends State<BookDownloadScreen> {
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

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: ${e.message}')),
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
      appBar: AppBar(title: Text(widget.booksModel.bookTitle.toString())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.booksModel.bookTitle.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(_downloadStatus),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: _downloadProgress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                  _downloadProgress == 1.0 ? Colors.green : Colors.blue),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_isDownloading)
                  ElevatedButton(
                    onPressed: _cancelDownload,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Cancel'),
                  ),
                if (!_isDownloading && _downloadProgress < 1.0)
                  ElevatedButton(
                    onPressed: _downloadBook,
                    child: const Text('Download'),
                  ),
                if (_downloadProgress == 1.0)
                  ElevatedButton(
                    onPressed: _openBook,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Read Book'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cancelToken?.cancel();
    super.dispose();
  }
}
