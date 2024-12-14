import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_io/io.dart';

import '../model/books/books_model.dart';
import '../model/users/users_model.dart';
import '../service/firebase_service.dart';
import 'auth_provider.dart';

class BookProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  BookProvider({
    required this.firebaseService,
  });

  var loodingBook = false;
  List<BooksModel> books = [];

  var isDancingBook = false;

  Future<BooksModel?> checkAnnaBookInLernzaLibary(String id) async {
    try {
      isDancingBook = true;
      notifyListeners();

      // Await the Firebase query
      var querySnapshot = await firebaseService.database
          .collection('books')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return BooksModel.fromJson(querySnapshot.docs.first.data());
      } else {
        return null;
      }
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    } finally {
      // Set loading state back to false after the operation completes
      isDancingBook = false;
      notifyListeners();
    }
  }

  Future<void> getBooksFromTheLernzaLibary() async {
    loodingBook = true;
    notifyListeners();
    try {
      final QuerySnapshot a = await firebaseService.database
          .collection('books')
          .where("code", isEqualTo: null)
          .limit(40)
          .get();

      for (var element in a.docs) {
        books.add(BooksModel.fromJson(element.data() as Map<String, dynamic>));
      }
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    } finally {
      loodingBook = false;
      notifyListeners();
    }
  }

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

  Future<List<BooksModel>> searchBooks(String searchQuery) async {
    final List<BooksModel> searchResults = [];

    try {
      // Convert the searchQuery to lowercase for case-insensitive matching
      final queryLower = searchQuery.toLowerCase();

      // Use Firestore's "startAt" and "endAt" for prefix-based search
      QuerySnapshot<Map<String, dynamic>> booksSnapshot = await FirebaseFirestore
          .instance
          .collection('books')
          .orderBy(
              'bookTitleLower') // Ensure a lowercase version of the title exists in the database
          .startAt([queryLower]).endAt(
              ['$queryLower\uf8ff']) // Matches anything starting with the query
          .get();

      // Map the query results to the BooksModel list
      searchResults.addAll(
        booksSnapshot.docs
            .map((doc) => BooksModel.fromJson(doc.data()))
            .toList(),
      );
    } catch (e, s) {
      developer.log('Error fetching books: $e\nStacktrace: $s');
    }

    return searchResults;
  }

  Future<void> addBookToLernzaLibary(
      BooksModel book, File bookFile, File pictureFile) async {
    try {
      final uploadTasks = await Future.wait([
        firebaseService.storage.ref('books/${book.id}.pdf').putFile(bookFile),
        firebaseService.storage
            .ref('thumbnails/${book.id}.jpg')
            .putFile(pictureFile),
      ]);

      final bookUrl = await uploadTasks[0].ref.getDownloadURL();
      final pictureUrl = await uploadTasks[1].ref.getDownloadURL();

      book = book.copyWith(bookUrl: bookUrl, thumbnail: pictureUrl);

      await firebaseService.database.collection('books').add(book.toJson());
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }
}
