import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learnza/screen/student/library/widget/books_card_library_student_widget.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/books/books_model.dart';
import '../../../providers/book_provider.dart';
import '../../../providers/student_provider.dart';
import '../../common/widget/drawer_widget.dart';

class LibraryStudentScreen extends StatefulWidget {
  const LibraryStudentScreen({super.key});

  @override
  State<LibraryStudentScreen> createState() => _LibraryStudentScreenState();
}

class _LibraryStudentScreenState extends State<LibraryStudentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _shadPopoverController = ShadPopoverController();

  final List<String> get = [
    'Open Library',
    'Our Library',
  ];

  @override
  void dispose() {
    super.dispose();
    _shadPopoverController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: kIsWeb
          ? null
          : const DrawerWidget(
              currentIndex: 1,
            ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: false,
          title: Consumer<StudentProvider>(
            builder: (context, value, child) {
              if (value.isSearch) {
                return const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search Library',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12.0,
                    ),
                  ),
                );
              } else {
                return const Text(
                  'Personalized Library',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            },
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            Consumer<StudentProvider>(
              builder: (context, value, child) {
                return IconButton(
                  icon: Icon(
                    value.isSearch ? Icons.close : Icons.search,
                  ),
                  onPressed: () {
                    value.toggleSearch();
                  },
                );
              },
            ),
          ],
        ),
        SliverFillRemaining(
          child: StreamBuilder(
            stream:
                context.read<BookProvider>().getBooksWithPagination(limit: 20),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              final List<BooksModel>? books = snapshot.data;

              if (books == null) {
                return const Center(
                  child: Text('Ah Null Why?'),
                );
              }

              if (books.isEmpty) {
                return const Center(
                  child: Text('No books found'),
                );
              }
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BooksCardLibraryStudentWidget(
                    booksModel: books[index],
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
