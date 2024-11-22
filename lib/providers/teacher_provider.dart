import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/users/users_model.dart';
import '../service/firebase_service.dart';

class TeacherProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  TeacherProvider({required this.firebaseService});

  List<UsersModel> _teachers = [];
  final bool _isLoading = false;
  String? _error;

  List<UsersModel> get teachers => _teachers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  DocumentSnapshot? lastDoc;

  Stream<List<UsersModel>> getTeachersWithPagination({
    required int limit,
    DocumentSnapshot? startAfter,
    String? departmentId,
  }) async* {
    try {
      Query query = firebaseService.database
          .collection("users")
          .where('role', isEqualTo: 'teacher')
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
          _teachers = snapshot.docs
              .map((doc) =>
                  UsersModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          lastDoc = snapshot.docs.last;
        } else {
          lastDoc = null;
        }

        yield _teachers;
      }
    } catch (e, s) {
      developer.log('Error fetching teachers', error: e, stackTrace: s);
      _error = e.toString();
      yield [];
    }
  }

  Future<void> updateTeacher({required UsersModel updatedTeacher}) async {
    try {
      final documentRef =
          firebaseService.database.collection('users').doc(updatedTeacher.uid);

      await documentRef.update(updatedTeacher.toJson());
      notifyListeners();
    } catch (e, s) {
      developer.log('Teacher Update Error', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }

  Future<void> deleteTeacher(String teacherId) async {
    try {
      await firebaseService.database
          .collection("users")
          .doc(teacherId)
          .delete();
      _teachers.removeWhere((t) => t.uid == teacherId);
      notifyListeners();
    } catch (e, s) {
      developer.log('Teacher Deletion Error', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }
}
