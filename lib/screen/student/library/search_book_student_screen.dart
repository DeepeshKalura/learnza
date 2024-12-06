import 'package:flutter/material.dart';

import '../../../model/books/books_model.dart';
import 'widget/books_card_library_student_widget.dart';
import 'widget/error/no_books_found_error_widget.dart';

class SearchBookStudentScreen extends StatelessWidget {
  const SearchBookStudentScreen(
      {super.key, required this.searchQuery, required this.books});
  final String searchQuery;
  final List<BooksModel> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchQuery),
      ),
      body: books.isEmpty
          ? const NoBooksFoundErrorWidget()
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BooksCardLibraryStudentWidget(
                  booksModel: books[index],
                );
              },
            ),
    );
  }
}
