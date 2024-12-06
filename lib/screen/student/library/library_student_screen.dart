import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/screen/student/library/widget/books_card_library_student_widget.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/books/books_model.dart';
import '../../../providers/book_provider.dart';
import '../../../providers/state/student/libary_student_state_provider.dart';
import '../../../router/app_urls.dart';
import '../../common/widget/drawer_widget.dart';
import 'widget/anna_libary_widget.dart';
import 'widget/error/books_snapshot_error_widget.dart';
import 'widget/error/no_books_found_error_widget.dart';

class LibraryStudentScreen extends StatefulWidget {
  const LibraryStudentScreen({super.key});

  @override
  State<LibraryStudentScreen> createState() => _LibraryStudentScreenState();
}

class _LibraryStudentScreenState extends State<LibraryStudentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _shadPopoverController = ShadPopoverController();

  @override
  void dispose() {
    super.dispose();
    _shadPopoverController.dispose();
    _searchController.dispose();
  }

  List<Widget>? bookWidget;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    bookWidget = [
      const BookListWidget(),
      const AnnaArchiveBookWidget(),
      offlineBookWidget(),
    ];
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Consumer<LibaryStudentStateProvider>(
              builder: (context, value, child) {
                if (value.isSearch && !value.searched) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Library',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 12.0,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(LucideIcons.send),
                        onPressed: () async {
                          if (_searchController.text.isNotEmpty) {
                            await search(_searchController.text);
                          }
                        },
                      ),
                    ],
                  );
                } else if (value.isSearch && value.searched) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return DropdownButton<String>(
                    elevation: 0,
                    focusColor: Colors.transparent,
                    value: value.currentLibaryBook,
                    items: value.typesOfLibary.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(
                          type,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        value.setSelectedLibraryType(newValue);
                      }
                    },
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
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
              Consumer<LibaryStudentStateProvider>(
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
          Consumer<LibaryStudentStateProvider>(
            builder: (context, value, child) {
              return SliverFillRemaining(
                child: bookWidget == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : bookWidget![value.currentLibary],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget annaBookWidget() {
    return const Center(
      child: Text("Anna Archieve Book"),
    );
  }

  Widget offlineBookWidget() {
    return const NoBooksFoundErrorWidget();
  }

  Future<void> search(String searchQuery) async {
    developer.log('Search method called with query: $searchQuery');
    try {
      var bookProvider = context.read<LibaryStudentStateProvider>();

      final books = await bookProvider.search(searchQuery, context);

      developer.log("Not going to reach here ayee");
      _searchController.clear();
      if (mounted) {
        context.pushNamed(AppUrls.searchBooksStudentScreen, extra: {
          "searchQuery": searchQuery,
          "books": books,
        });
      }
    } catch (e) {
      ShadAlert.destructive(
        iconSrc: LucideIcons.circleAlert,
        title: const Text('Error'),
        description: Text(
          e.toString(),
        ),
      );
    }
  }
}

// Separate widget to manage the stream
class BookListWidget extends StatelessWidget {
  const BookListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<BookProvider>().getBooksWithPagination(limit: 20),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return BooksSnapshotErrorWidget(
            errorMessage: snapshot.error.toString(),
          );
        }

        final List<BooksModel>? books = snapshot.data;

        if (books == null) {
          return const BooksSnapshotErrorWidget(
            errorMessage: "Can't find any books right now",
          );
        }

        if (books.isEmpty) {
          return const NoBooksFoundErrorWidget();
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
    );
  }
}
