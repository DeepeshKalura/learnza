import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/users/users_model.dart';
import '../service/firebase_service.dart';

class AdminProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  AdminProvider({required this.firebaseService});

  List<UsersModel> _admins = [];
  final bool _isLoading = false;
  String? _error;

  // Admins

  List<UsersModel> get admins => _admins;
  bool get isLoading => _isLoading;
  String? get error => _error;

  DocumentSnapshot? lastAdminDocs;

  Stream<List<UsersModel>> getAdminsWithPagination(
      {required int limit, DocumentSnapshot? startAfter}) async* {
    try {
      Query query = firebaseService.database
          .collection("users")
          .where("role", isEqualTo: "admin")
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshots = query.snapshots();

      await for (final snapshot in snapshots) {
        if (snapshot.docs.isNotEmpty) {
          _admins = snapshot.docs
              .map((doc) =>
                  UsersModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          lastAdminDocs = snapshot.docs.last;
        } else {
          lastAdminDocs = null;
        }

        yield _admins;
      }
    } catch (e, s) {
      developer.log('Error fetching admins with pagination',
          error: e, stackTrace: s);
      _error = e.toString();
      yield [];
    }
  }

  Future<void> updateAdmin(UsersModel admin) async {
    try {
      await firebaseService.database
          .collection("users")
          .doc(admin.uid)
          .update(admin.toJson());

      final index = _admins.indexWhere((a) => a.uid == admin.uid);
      if (index != -1) {
        _admins[index] = admin;
        notifyListeners();
      }
    } catch (e, s) {
      developer.log('Error updating admin', error: e, stackTrace: s);
      rethrow;
    }
  }
}
