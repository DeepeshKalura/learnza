import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../model/books/books_model.dart';
import '../../model/books_provider.dart';

class LiteratureBookLibraryStateProvider extends ChangeNotifier {
  List<BooksModel> _books = [];

  var isLoadingBooks = false;

  List<BooksModel> get books => _books;

  Future<void> getLiteratureBooks() async {
    isLoadingBooks = true;
    notifyListeners();
    try {
      if (_books.isEmpty) {
        _books = await di.injector.get<BooksProvider>().getLiteratureBooks();
      }
    } catch (e, s) {
      developer.log('getBooksWithSpecificCourseAndYear',
          error: e, stackTrace: s);
      rethrow;
    } finally {
      isLoadingBooks = false;
      notifyListeners();
    }
  }
}
