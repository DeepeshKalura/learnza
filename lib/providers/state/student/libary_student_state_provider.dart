import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../model/books/books_model.dart';
import '../../../service/anna_archieve_service.dart';
import '../../../service/local_database_service.dart';

class LibaryStudentStateProvider extends ChangeNotifier {
  // Library types
  List<String> typesOfLibary = [
    "Lernza Library",
    "Anna Library",
    "Offline Library",
  ];

  // Current library index
  int currentLibary = 0;

  final localDatabase = LocalDatabaseService.instance;

  // Search-related state
  bool searched = false;
  bool isSearch = false;

  // Anna Archive books state
  List<BooksModel> _annaArchiveBooks = [];
  bool _isAnnaArchiveBooksLoading = false;
  String _annaArchiveErrorMessage = '';

  // Getters
  String get currentLibaryBook => typesOfLibary[currentLibary];
  List<BooksModel> get annaArchiveBooks => _annaArchiveBooks;
  bool get isAnnaArchiveBooksLoading => _isAnnaArchiveBooksLoading;
  String get annaArchiveErrorMessage => _annaArchiveErrorMessage;

  String? downloadingBookMirrorLink;

  // offline library books

  List<BooksModel>? offlineBooks;
  var loadingOfflineBooks = false;
  void getBooksFromLocalDatabase() async {
    loadingOfflineBooks = true;
    notifyListeners();
    try {
      offlineBooks = await localDatabase.getAll();
    } catch (e, s) {
      developer.log(
        "error has occur: ${e.toString()}",
        error: e,
        stackTrace: s,
      );
    }
    loadingOfflineBooks = false;
    notifyListeners();
  }

  // Change library
  void chnageLibary(int index) {
    currentLibary = index;
    notifyListeners();
  }

  // Toggle search
  void toggleSearch() {
    isSearch = !isSearch;
    notifyListeners();
  }

  // Set selected library type
  void setSelectedLibraryType(String value) {
    currentLibary = typesOfLibary.indexOf(value);
    notifyListeners();
  }

  // Fetch Anna Archive books
  Future<void> fetchAnnaArchiveBooks({String searchQuery = ''}) async {
    try {
      // Set loading state
      _isAnnaArchiveBooksLoading = true;
      _annaArchiveErrorMessage = '';
      notifyListeners();

      // Fetch books
      final annaArchive = di.injector<AnnasArchieveService>();
      _annaArchiveBooks = await annaArchive.searchBooks(
        searchQuery: searchQuery,
        fileType: 'pdf', // Configurable if needed
      );

      // Clear loading state
      _isAnnaArchiveBooksLoading = false;
      notifyListeners();
    } catch (e) {
      // Handle error
      _isAnnaArchiveBooksLoading = false;
      _annaArchiveErrorMessage = e.toString();
      developer.log('Error fetching Anna Archive Books: $e');
      notifyListeners();
    }
  }

  // Search method
  Future<List<BooksModel>> search(
      String searchQuery, BuildContext context) async {
    developer.log("Search query: $searchQuery");
    List<BooksModel> books = [];
    searched = true;
    notifyListeners();

    try {
      // if (currentLibary == 0) {
      // Search in Lernza library
      developer.log("Searching in Lernza Library");
      // books = await context.read<BookProvider>().searchBooks(searchQuery);
      // } else if (currentLibary == 1) {
      // Search in Anna library
      developer.log("Searching in Anna Library");
      books = await di.injector<AnnasArchieveService>().searchBooks(
            searchQuery: searchQuery,
          );
      // } else {
      // Search in offline library
      developer.log("Searching in Offline Library");
      // }
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    } finally {
      searched = false;
      notifyListeners();
    }
    return books;
  }
}
