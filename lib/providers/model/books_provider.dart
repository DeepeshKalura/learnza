import 'dart:developer' as developer;

import '../../model/books/books_model.dart';
import '../../service/firebase_service.dart';

class BooksProvider {
  final FirebaseService firebaseService;

  BooksProvider({
    required this.firebaseService,
  });

  Future<List<BooksModel>> getBooksFromTheLernzaLibary(
      String courseId, int year) async {
    try {
      final snapShot = await firebaseService.database
          .collection('books')
          .where('courseId', isEqualTo: courseId)
          .where('year', isEqualTo: year)
          .get();

      if (snapShot.docs.isNotEmpty) {
        return snapShot.docs.map((e) => BooksModel.fromJson(e.data())).toList();
      } else {
        return [];
      }
    } catch (e, s) {
      developer.log("getBooksFromTheLernzaLibary", error: e, stackTrace: s);
      rethrow;
    }
  }
}
