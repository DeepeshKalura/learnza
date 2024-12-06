import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../model/books/books_model.dart';
import '../../../service/anna_archieve_service.dart';
import '../../book_provider.dart';

class LibaryStudentStateProvider extends ChangeNotifier {
  List<String> typesOfLibary = [
    "Lernza Library",
    "Anna Library",
    "Offline Library",
  ];

  int currentLibary = 0;

  var searched = false;

  void chnageLibary(int index) {
    currentLibary = index;
    notifyListeners();
  }

  String get currentLibaryBook => typesOfLibary[currentLibary];

  var isSearch = false;

  void toggleSearch() {
    isSearch = !isSearch;
    notifyListeners();
  }

  void setSelectedLibraryType(String value) {
    currentLibary = typesOfLibary.indexOf(value);
    notifyListeners();
  }

  Future<List<BooksModel>> search(
      String searchQuery, BuildContext context) async {
    developer.log("does i reach search search: $searchQuery");
    List<BooksModel> books = [];
    searched = true;
    notifyListeners();

    try {
      if (currentLibary == 0) {
        // search in leanza library
        developer.log("I am searching in a lernza");
        books = await context.read<BookProvider>().searchBooks(searchQuery);
      } else if (currentLibary == 1) {
        // search in anna library
        developer.log("I am searching in a anna");
        books = await di.injector<AnnasArchieveService>().searchBooks(
              searchQuery: searchQuery,
            );
      } else {
        // search in offline library
        developer.log("I am searching in a offline");
      }
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
