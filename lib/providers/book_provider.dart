import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
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

      final query = snapShot.where('courseId', isEqualTo: user.courseId);

      final snapshots = query.snapshots();

      await for (final snapshot in snapshots) {
        if (snapshot.docs.isNotEmpty) {
          books = snapshot.docs
              .map((doc) => BooksModel.fromJson(doc.data()))
              .toList();
        } else {
          books = [];
        }
      }
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }

  Stream<List<BooksModel>> getBooksWithPagination(
      {required int limit, DocumentSnapshot? startAfter}) async* {
    try {
      Query query = firebaseService.database.collection("books").limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshots = query.snapshots();

      await for (final snapshot in snapshots) {
        if (snapshot.docs.isNotEmpty) {
          // for (var doc in snapshot.docs) {
          //   developer.log(doc.data().toString());
          // }
          books = snapshot.docs
              .map((doc) =>
                  BooksModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
        } else {
          books = [];
        }

        yield books;
      }
    } catch (e, s) {
      developer.log('Error fetching books with pagination',
          error: e, stackTrace: s);
      yield [];
    }
  }
}
