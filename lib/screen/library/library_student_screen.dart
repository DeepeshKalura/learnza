import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/screen/library/widget/books_card_library_student_widget.dart';
import 'package:learnza/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/book_provider.dart';
import '../../providers/state/student/libary_student_state_provider.dart';
import '../../router/app_urls.dart';
import 'course_book_library_screen.dart';
import 'literature_book_screen.dart';
import 'widget/anna_libary_widget.dart';
import 'widget/error/no_books_found_error_widget.dart';

class LibraryStudentScreen extends StatefulWidget {
  const LibraryStudentScreen({super.key});

  @override
  State<LibraryStudentScreen> createState() => _LibraryStudentScreenState();
}

class _LibraryStudentScreenState extends State<LibraryStudentScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _shadPopoverController = ShadPopoverController();
  final _searchController = TextEditingController();
  late TabController _tabController;

  // Define the library types as a constant list

  final List<String> _libraryTypes = [
    'Lernza Library',
    'Anna Archive',
    'Course Books',
    "Literature",
  ];

  @override
  void initState() {
    super.initState();
    // Initialize TabController with the number of tabs
    _tabController = TabController(length: _libraryTypes.length, vsync: this);

    // Add listener to sync tab changes with provider state
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context
            .read<LibaryStudentStateProvider>()
            .setSelectedLibraryType(_libraryTypes[_tabController.index]);
      }
    });
  }

  @override
  void dispose() {
    _shadPopoverController.dispose();
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              title: _buildTitle(),
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
              bottom: TabBar(
                controller: _tabController,
                tabs: _libraryTypes.map((type) => Tab(text: type)).toList(),
                indicatorColor: primaryColor,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            BookListWidget(),
            AnnaArchiveBookWidget(),
            CourseBookLibraryScreen(),
            LiteratureBookScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Consumer<LibaryStudentStateProvider>(
      builder: (context, value, child) {
        if (value.isSearch && !value.searched) {
          return Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Search Library',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
          return const Text(
            'Personalized Library',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          );
        }
      },
    );
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

// The BookListWidget remains the same as in the original code
class BookListWidget extends StatefulWidget {
  const BookListWidget({super.key});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BookProvider>().getBooksFromTheLernzaLibary();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, value, child) {
        if (value.loodingBook) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (value.books.isEmpty) {
          return const NoBooksFoundErrorWidget();
        } else {
          return ListView.builder(
            itemCount: value.books.length,
            itemBuilder: (context, index) {
              return BooksCardLibraryStudentWidget(
                booksModel: value.books[index],
                isDownloading: true,
              );
            },
          );
        }
      },
    );
  }
}
