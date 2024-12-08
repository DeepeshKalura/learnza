import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../../../../model/books/books_model.dart';

class BookDownloadCard extends StatefulWidget {
  final String bookUrl;
  final String bookTitle;

  const BookDownloadCard(
      {super.key, required this.bookUrl, required this.bookTitle});

  @override
  _BookDownloadCardState createState() => _BookDownloadCardState();
}

class _BookDownloadCardState extends State<BookDownloadCard> {
  double _downloadProgress = 0.0;
  bool _isDownloading = false;
  bool _downloadComplete = false;
  String _downloadStatus = 'Ready to Download';

  Future<void> _downloadBook() async {
    setState(() {
      _isDownloading = true;
      _downloadStatus = 'Downloading...';
    });

    try {
      // Get the download URL
      final response = await http.get(Uri.parse(widget.bookUrl));

      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${widget.bookTitle}.pdf';

      // Create the file
      final file = File(filePath);

      // Write the file with progress tracking
      await file.writeAsBytes(response.bodyBytes);

      setState(() {
        _downloadProgress = 1.0;
        _isDownloading = false;
        _downloadComplete = true;
        _downloadStatus = 'Download Complete';
      });
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _downloadStatus = 'Download Failed';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  }

  void _openBook() {
    // Implement book opening logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening ${widget.bookTitle}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.bookTitle,
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
                  _downloadComplete ? Colors.green : Colors.blue),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _isDownloading || _downloadComplete
                      ? null
                      : _downloadBook,
                  child: const Text('Download'),
                ),
                if (_downloadComplete)
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
}

class BookDownloadPage extends StatelessWidget {
  const BookDownloadPage({
    super.key,
    required this.bookUrl,
    required this.booksModel,
  });

  final String bookUrl;
  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Download')),
      body: BookDownloadCard(
        bookUrl: bookUrl,
        bookTitle: booksModel.bookTitle ?? "Batman",
      ),
    );
  }
}
