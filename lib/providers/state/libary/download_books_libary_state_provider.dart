import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../model/books/books_model.dart';
import '../../../service/local_database_service.dart';

enum DownloadStatus { idle, downloading, completed, failed }

class DownloadBooksLibaryStateProvider extends ChangeNotifier {
  double _downloadProgress = 0.0;
  bool _isDownloading = false;
  DownloadStatus _status = DownloadStatus.idle;
  String _errorMessage = '';
  CancelToken? _cancelToken;
  final Dio _dio = Dio();
  // Getters

  double get downloadProgress => _downloadProgress;
  bool get isDownloading => _isDownloading;
  DownloadStatus get status => _status;
  String get errorMessage => _errorMessage;

  // Reset state
  void resetState() {
    _downloadProgress = 0.0;
    _isDownloading = false;
    _status = DownloadStatus.idle;
    _errorMessage = '';
    notifyListeners();
  }

  // Get file path
  Future<String> _getFilePath(String filename) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}/$filename';
    } catch (e) {
      throw Exception('Failed to get file path: ${e.toString()}');
    }
  }

  // Check if book exists locally
  Future<void> hasBookBeenDownloaded(String filename) async {
    try {
      final dbService = LocalDatabaseService.instance;
      final bookId = filename.replaceAll('.pdf', '');

      try {
        await dbService.getBookById(bookId);
        final localPath = await _getFilePath(filename);
        final file = File(localPath);

        if (await file.exists()) {
          _status = DownloadStatus.completed;
        } else {
          _status = DownloadStatus.idle;
        }
      } catch (e) {
        _status = DownloadStatus.idle;
      }

      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error checking file existence: ${e.toString()}';
      _status = DownloadStatus.idle;
      notifyListeners();
    }
  }

  // Cancel ongoing download

  void cancelDownload() {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken?.cancel('Download cancelled by user');
      _isDownloading = false;
      _status = DownloadStatus.failed;
      _errorMessage = 'Download cancelled';
      notifyListeners();
    }
  }

  // Main download function
  Future<void> downloadBook(BooksModel booksModel, String bookUrl) async {
    if (_isDownloading) return;

    try {
      _isDownloading = true;
      _status = DownloadStatus.downloading;
      _downloadProgress = 0.0;
      _errorMessage = '';
      _cancelToken = CancelToken();
      notifyListeners();

      final filePath = await _getFilePath('${booksModel.id}.pdf');
      final picturePath = await _getFilePath('${booksModel.id}.jpg');

      // Download PDF
      await _dio.download(
        bookUrl,
        filePath,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            _downloadProgress = (received / total) * 0.8; // 80% for PDF
            notifyListeners();
          }
        },
      );

      print(booksModel.thumbnail);
      // Download thumbnail if available
      if (booksModel.thumbnail?.isNotEmpty ?? false) {
        await _dio.download(
          booksModel.thumbnail!,
          picturePath,
          cancelToken: _cancelToken,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              _downloadProgress = 0.8 + (received / total) * 0.2;
              notifyListeners();
            }
          },
        );
      }

      final updatedBookModel = booksModel.copyWith(
        bookUrl: filePath,
        thumbnail:
            booksModel.thumbnail?.isNotEmpty ?? false ? picturePath : null,
        updatedAt: DateTime.now(),
      );

      await _saveBookToLocalStorage(updatedBookModel);

      _status = DownloadStatus.completed;
      _isDownloading = false;
      _downloadProgress = 1.0;
      notifyListeners();
    } on DioException catch (e) {
      _handleError('Download failed: ${e.message}');
      _cleanupFailedDownload(booksModel.id);
    } catch (e) {
      _handleError('Error during download: ${e.toString()}');
      _cleanupFailedDownload(booksModel.id);
    }
  }

  Future<void> _cleanupFailedDownload(String bookId) async {
    try {
      final pdfPath = await _getFilePath('$bookId.pdf');
      final imagePath = await _getFilePath('$bookId.jpg');

      final pdfFile = File(pdfPath);
      final imageFile = File(imagePath);

      if (await pdfFile.exists()) await pdfFile.delete();
      if (await imageFile.exists()) await imageFile.delete();
    } catch (e) {
      developer.log('Error cleaning up failed download: $e');
    }
  }

  void _handleError(String message) {
    _status = DownloadStatus.failed;
    _isDownloading = false;
    _errorMessage = message;
    notifyListeners();
  }

  // Save book to local storage
  Future<void> _saveBookToLocalStorage(BooksModel book) async {
    try {
      print(book);
      await LocalDatabaseService.instance.insert(book);
    } catch (e) {
      throw Exception('Failed to save book to local storage: ${e.toString()}');
    }
  }

  // Handle errors
  void handleError(String message) {
    _status = DownloadStatus.failed;
    _isDownloading = false;
    _errorMessage = message;
    notifyListeners();
  }

  // Check if book exists in Molle (implement your logic)
  Future<void> doesBookExistInMolle(String id) async {
    // Implement your Molle check logic here
  }

  @override
  void dispose() {
    _cancelToken?.cancel();
    super.dispose();
  }
}
