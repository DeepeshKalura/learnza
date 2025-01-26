import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/state/libary/literature_book_library_state_provider.dart';
import 'widget/books_card_library_student_widget.dart';
import 'widget/error/no_books_found_error_widget.dart';

class LiteratureBookScreen extends StatefulWidget {
  const LiteratureBookScreen({super.key});

  @override
  State<LiteratureBookScreen> createState() => _LiteratureBookScreenState();
}

class _LiteratureBookScreenState extends State<LiteratureBookScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LiteratureBookLibraryStateProvider>().getLiteratureBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LiteratureBookLibraryStateProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingBooks) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.books.isEmpty) {
            return const NoBooksFoundErrorWidget();
          } else {
            return ListView.builder(
              itemCount: provider.books.length,
              itemBuilder: (context, index) {
                return BooksCardLibraryStudentWidget(
                  booksModel: provider.books[index],
                  isDownloading: true,
                );
              },
            );
          }
        },
      ),
    );
  }
}
