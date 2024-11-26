import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/books/books_model.dart';
import '../model/users/users_model.dart';
import '../service/firebase_service.dart';
import 'auth_provider.dart';

class BookProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  BookProvider({
    required this.firebaseService,
  });

  List<BooksModel> books = [];

  Future<void> getBooksFromTheCourse(BuildContext context) async {
    try {
      final UsersModel user = context.read<AuthProvider>().user!;

      final snapShot = firebaseService.database.collection('books');

      if (user.enrolledCourseIds != null) {
        final heroPerson = await snapShot
            .where('courseId', whereIn: user.enrolledCourseIds)
            .get();

        books = heroPerson.docs
            .map(
              (doc) => BooksModel.fromJson(
                doc.data(),
              ),
            )
            .toList();
      } else {
        final heroPerson = await snapShot.limit(20).get();

        books = heroPerson.docs
            .map(
              (doc) => BooksModel.fromJson(
                doc.data(),
              ),
            )
            .toList();
      }
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }
}
