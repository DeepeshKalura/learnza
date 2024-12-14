import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/state/student/libary_student_state_provider.dart';
import '../../student/library/widget/books_card_library_student_widget.dart';
import '../../student/library/widget/error/no_books_found_error_widget.dart';

class OfflineLibraryCommonScreen extends StatefulWidget {
  const OfflineLibraryCommonScreen({super.key});

  @override
  OfflineLibraryCommonScreenState createState() =>
      OfflineLibraryCommonScreenState();
}

class OfflineLibraryCommonScreenState
    extends State<OfflineLibraryCommonScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch offline books when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LibaryStudentStateProvider>().getBooksFromLocalDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context
                  .read<LibaryStudentStateProvider>()
                  .getBooksFromLocalDatabase();
            },
          ),
        ],
      ),
      body: Consumer<LibaryStudentStateProvider>(
        builder: (context, provider, child) {
          // Check if books are null (initial state)
          if (provider.offlineBooks == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Check if books list is empty
          if (provider.offlineBooks!.isEmpty) {
            return const NoBooksFoundErrorWidget();
          }

          // Render the list of offline books
          return ListView.builder(
            itemCount: provider.offlineBooks!.length,
            itemBuilder: (context, index) {
              return BooksCardLibraryStudentWidget(
                booksModel: provider.offlineBooks![index],
                isDownloading: false,
              );
            },
          );
        },
      ),
    );
  }
}
