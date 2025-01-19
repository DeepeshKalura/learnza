import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../model/books/books_model.dart';

enum DownloadStatus { idle, downloading, completed, failed }

class DownloadBooksLibaryStateProvider extends ChangeNotifier {
  // State variables
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
  Future<String> _getFilePath(String id) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}/$id';
    } catch (e) {
      throw Exception('Failed to get file path: ${e.toString()}');
    }
  }

  // Check if book exists locally
  Future<bool> hasBookBeenDownloaded(String filename) async {
    try {
      final localPath = await _getFilePath(filename);
      final file = File(localPath);
      return await file.exists();
    } catch (e) {
      _errorMessage = 'Error checking file existence: ${e.toString()}';
      notifyListeners();
      return false;
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
      // Initialize download state
      _isDownloading = true;
      _status = DownloadStatus.downloading;
      _downloadProgress = 0.0;
      _errorMessage = '';
      _cancelToken = CancelToken();
      notifyListeners();

      // Get file paths
      final filePath = await _getFilePath('${booksModel.id}.pdf');
      final picturePath = await _getFilePath('${booksModel.id}.jpg');

      // Prepare downloads
      List<Future<void>> downloads = [];

      // Add main book download
      downloads.add(
        _dio.download(
          bookUrl,
          filePath,
          cancelToken: _cancelToken,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              _downloadProgress = received / total - 0.001;
              notifyListeners();
            }
          },
        ),
      );

      // Add thumbnail download if available
      if (booksModel.thumbnail != null && booksModel.thumbnail!.isNotEmpty) {
        downloads.add(
          _dio.download(
            booksModel.thumbnail!,
            picturePath,
            cancelToken: _cancelToken,
          ),
        );
      }

      // Execute downloads
      await Future.wait(downloads);

      // Update book model with local paths
      final updatedBookModel = booksModel.copyWith(
        bookUrl: filePath,
        thumbnail: picturePath,
        updatedAt: DateTime.now(),
      );

      // Save to local database
      await _saveBookToLocalStorage(updatedBookModel);

      // Update state on success
      _status = DownloadStatus.completed;
      _isDownloading = false;
      _downloadProgress = 1.0;
      notifyListeners();
    } on DioException catch (e) {
      _handleError('Download failed: ${e.message}');
    } catch (e) {
      _handleError('Error during download: ${e.toString()}');
    }
  }

  // Save book to local storage
  Future<void> _saveBookToLocalStorage(BooksModel book) async {
    try {
      // Implement your local storage logic here
      // For example:
      // await LocalDatabaseService.instance.insert(book);
    } catch (e) {
      throw Exception('Failed to save book to local storage: ${e.toString()}');
    }
  }

  // Handle errors
  void _handleError(String message) {
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
