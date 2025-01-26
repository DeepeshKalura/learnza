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

  Future<List<BooksModel>> getLiteratureBooks() async {
    try {
      final snapShot = await firebaseService.database
          .collection('books')
          .where("code", isGreaterThan: "NN-")
          .get();

      if (snapShot.docs.isNotEmpty) {
        var a =
            snapShot.docs.map((e) => BooksModel.fromJson(e.data())).toList();
        developer.log("Literature Books: $a");
        return a;
      } else {
        return [];
      }
    } catch (e, s) {
      developer.log("getLiteratureBooks", error: e, stackTrace: s);
      rethrow;
    }
  }
}
