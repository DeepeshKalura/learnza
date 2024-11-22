import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/users/users_model.dart';
import '../service/firebase_service.dart';

class StudentProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  StudentProvider({required this.firebaseService});

  List<UsersModel> _students = [];
  final bool _isLoading = false;
  String? _error;

  List<UsersModel> get students => _students;
  bool get isLoading => _isLoading;
  String? get error => _error;

  DocumentSnapshot? lastDoc;

  Stream<List<UsersModel>> getStudentsWithPagination({
    required int limit,
    DocumentSnapshot? startAfter,
    String? departmentId,
  }) async* {
    try {
      Query query = firebaseService.database
          .collection("users")
          .where('role', isEqualTo: 'student')
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (departmentId != null) {
        query = query.where('departmentId', isEqualTo: departmentId);
      }

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshots = query.snapshots();

      await for (final snapshot in snapshots) {
        if (snapshot.docs.isNotEmpty) {
          _students = snapshot.docs
              .map((doc) =>
                  UsersModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          lastDoc = snapshot.docs.last;
        } else {
          lastDoc = null;
        }

        yield _students;
      }
    } catch (e, s) {
      developer.log('Error fetching students', error: e, stackTrace: s);
      _error = e.toString();
      yield [];
    }
  }

  Future<void> updateStudent({required UsersModel updatedStudent}) async {
    try {
      final documentRef =
          firebaseService.database.collection('users').doc(updatedStudent.uid);

      await documentRef.update(updatedStudent.toJson());
      notifyListeners();
    } catch (e, s) {
      developer.log('Student Update Error', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }

  Future<void> deleteStudent(String studentId) async {
    try {
      await firebaseService.database
          .collection("users")
          .doc(studentId)
          .delete();
      _students.removeWhere((s) => s.uid == studentId);
      notifyListeners();
    } catch (e, s) {
      developer.log('Student Deletion Error', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }
}
