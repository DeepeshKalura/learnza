import 'package:flutter/material.dart';
import 'dart:developer' as developer;
// import 'package:provider/provider.dart';
import '../../../../model/books/books_model.dart';
// import '../../../../providers/course_provider.dart';
import '../../../../service/anna_archieve_service.dart';
import 'books_card_library_student_widget.dart';
import 'error/books_snapshot_error_widget.dart';
import 'error/no_books_found_error_widget.dart';
import 'package:learnza/locator/injector.dart' as di;

class AnnaArchiveBookWidget extends StatefulWidget {
  const AnnaArchiveBookWidget({super.key});

  @override
  State<AnnaArchiveBookWidget> createState() => _AnnaArchiveBookWidgetState();
}

class _AnnaArchiveBookWidgetState extends State<AnnaArchiveBookWidget> {
  List<BooksModel> _books = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _searchBooksByCourse();
  }

  void _searchBooksByCourse() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      // Get the current course name from CourseProvider
      const courseProvider =
          null; // Provider.of<CourseProvider>(context, listen: false);
      const courseName =
          courseProvider ?? 'Economics'; // courseProvider.currentCourse;

      if (courseName.isEmpty) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'No course selected';
        });
        return;
      }

      developer.log('Searching books for $courseName');
      final annaArchive = di.injector<AnnasArchieveService>();
      final results = await annaArchive.searchBooks(
        searchQuery: courseName,
        fileType: 'pdf', // You can make this configurable
      );

      setState(() {
        _books = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _errorMessage.isNotEmpty
            ? BooksSnapshotErrorWidget(errorMessage: _errorMessage)
            : _books.isEmpty
                ? const NoBooksFoundErrorWidget()
                : ListView.builder(
                    itemCount: _books.length,
                    itemBuilder: (context, index) {
                      return BooksCardLibraryStudentWidget(
                        booksModel: _books[index],
                      );
                    },
                  );
  }
}
