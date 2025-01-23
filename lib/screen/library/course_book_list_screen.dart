import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/course/courses_model.dart';
import '../../providers/state/libary/course_book_libary_state_provider.dart';
import 'widget/books_card_library_student_widget.dart';

class CourseBookListScreen extends StatefulWidget {
  final CoursesModel course;
  final int year;

  const CourseBookListScreen({
    super.key,
    required this.course,
    required this.year,
  });

  @override
  State<CourseBookListScreen> createState() => _CourseBookListScreenState();
}

class _CourseBookListScreenState extends State<CourseBookListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CourseBookLibaryStateProvider>()
          .getBooksWithSpecificCourseAndYear(
            widget.course.id,
            widget.year,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Year ${widget.year} Books'),
        centerTitle: true,
      ),
      body: Consumer<CourseBookLibaryStateProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingBooks) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.books.isEmpty) {
            return const Center(
              child: Text('No books available for this year'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: provider.books.length,
            itemBuilder: (context, index) {
              final book = provider.books[index];
              return BooksCardLibraryStudentWidget(
                booksModel: book,
                isDownloading: true,
                isAnnaBook: false,
              );
            },
          );
        },
      ),
    );
  }
}
