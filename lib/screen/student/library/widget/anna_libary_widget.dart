import 'package:flutter/material.dart';
import 'package:learnza/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../../../providers/state/student/libary_student_state_provider.dart';
import 'books_card_library_student_widget.dart';
import 'error/books_snapshot_error_widget.dart';
import 'error/no_books_found_error_widget.dart';

class AnnaArchiveBookWidget extends StatefulWidget {
  const AnnaArchiveBookWidget({super.key});

  @override
  State<AnnaArchiveBookWidget> createState() => _AnnaArchiveBookWidgetState();
}

class _AnnaArchiveBookWidgetState extends State<AnnaArchiveBookWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch books when widget is first created

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<LibaryStudentStateProvider>().annaArchiveBooks.isEmpty) {
        context
            .read<LibaryStudentStateProvider>()
            .fetchAnnaArchiveBooks(searchQuery: "Bussiness");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LibaryStudentStateProvider>(
      builder: (context, libraryProvider, child) {
        // Check if loading
        if (libraryProvider.isAnnaArchiveBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          );
        }

        // Check for error
        if (libraryProvider.annaArchiveErrorMessage.isNotEmpty) {
          return BooksSnapshotErrorWidget(
            errorMessage: libraryProvider.annaArchiveErrorMessage,
          );
        }

        // Check if books are empty
        final books = libraryProvider.annaArchiveBooks;
        if (books.isEmpty) {
          return const NoBooksFoundErrorWidget();
        }

        // Display books
        return ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BooksCardLibraryStudentWidget(
              booksModel: books[index],
              isAnnaBook: true,
              isDownloading: true,
            );
          },
        );
      },
    );
  }
}
