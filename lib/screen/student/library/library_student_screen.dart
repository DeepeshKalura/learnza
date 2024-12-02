import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learnza/screen/student/library/widget/books_card_library_student_widget.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/books/books_model.dart';
import '../../../providers/student_provider.dart';
import '../../common/widget/drawer_widget.dart';

class LibraryStudentScreen extends StatefulWidget {
  const LibraryStudentScreen({super.key});

  @override
  State<LibraryStudentScreen> createState() => _LibraryStudentScreenState();
}

class _LibraryStudentScreenState extends State<LibraryStudentScreen> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
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

  final booksModel = BooksModel(
    id: '1',
    bookTitle: "The Great Gatsby",
    author: ["F. Scott Fitzgerald"],
    coverImageUrl: "https://covers.openlibrary.org/b/id/14825735-L.jpg",
    createdAt: DateTime.now(),
    description:
        "The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway's interactions with mysterious millionaire Jay Gatsby and Gatsby's obsession to reunite with his former lover, Daisy Buchanan.",
    isActive: true,
    isbm: "9780743273565",
    language: "en",
    updatedAt: DateTime.now(),
    founded: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: Consumer<StudentProvider>(
          builder: (context, value, child) {
            if (value.isSearch) {
              return
                  // const Row(
                  // children: [
                  // ShadSelect<String>(
                  //   controller: _shadPopoverController,
                  //   options: [
                  //     ...get.map(
                  //       (dept) => ShadOption(
                  //         value: dept,
                  //         child: Text(dept),
                  //       ),
                  //     ),
                  //   ],
                  //   selectedOptionBuilder: (context, value) {
                  //     context.read<StudentProvider>()
                  //   },
                  // ),
                  const ShadInput(
                decoration: ShadDecoration(
                  color: Colors.white,
                ),
                placeholder: Text(
                  'Search Library',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            } else {
              return const Text(
                'Personlized Library',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
        ),
        leading: IconButton(
          icon: const Icon(LucideIcons.menu),
          onPressed: () {
            _scafoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Consumer<StudentProvider>(
            builder: (context, value, child) {
              if (value.isSearch) {
                return IconButton(
                  icon: const Icon(LucideIcons.searchX),
                  onPressed: () {
                    value.toggleSearch();
                  },
                );
              } else {
                return IconButton(
                  icon: const Icon(LucideIcons.search),
                  onPressed: () {
                    value.toggleSearch();
                  },
                );
              }
            },
            child: IconButton(
              icon: const Icon(LucideIcons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: kIsWeb
          ? null
          : const DrawerWidget(
              currentIndex: 1,
            ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Course Books",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // TODO: Add a button to view all books when clicked
                // InkWell(
                //   onTap: () {},
                //   child: const Icon(
                //     Icons.arrow_forward_ios_outlined,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 310,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                BooksCardLibraryStudentWidget(booksModel: booksModel),
                BooksCardLibraryStudentWidget(booksModel: booksModel),
                BooksCardLibraryStudentWidget(booksModel: booksModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
