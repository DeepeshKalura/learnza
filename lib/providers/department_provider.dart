import 'dart:developer' as developer;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../model/departments/departments_model.dart';
import '../service/firebase_service.dart';

class DepartmentProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  DepartmentProvider({required this.firebaseService});

  List<DepartmentsModel> _departments = [];
  final bool _isLoading = false;
  String? _error;

  // Getters
  List<DepartmentsModel> get departments => _departments;
  bool get isLoading => _isLoading;
  String? get error => _error;

  DocumentSnapshot? lastDoc;

  // Create a new department
  Future<void> createDepartment({
    required String name,
    String? headOfDepartment,
    required String description,
  }) async {
    try {
      // Generate a unique ID for the department
      final docRef = firebaseService.database.collection("departments").doc();

      final department = DepartmentsModel(
        id: docRef.id,
        name: name,
        headTeacherId: null,
        description: description,
        isActive: true,
        teacherIds: [],
        createdAt: DateTime.now(),
      );

      await docRef.set(department.toJson());

      notifyListeners();
    } catch (e, s) {
      developer.log('Error creating department', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }

  // Get departments with pagination

  Future<List<DepartmentsModel>> getDepartmentsAsFuture() async {
    try {
      // Query to fetch departments, limited to 15
      Query query = firebaseService.database
          .collection("departments")
          .orderBy('createdAt', descending: true)
          .limit(15); // Limits to 15 departments

      // Fetch data once using get()
      final snapshot = await query.get(); // Fetches the data only once

      // Map documents to your DepartmentsModel
      List<DepartmentsModel> departments = snapshot.docs
          .map((doc) =>
              DepartmentsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return departments; // Return the departments list
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow; // Propagate the error if needed
    }
  }

  Stream<List<DepartmentsModel>> getDepartmentsWithPagination(
      {required int limit, DocumentSnapshot? startAfter}) async* {
    try {
      Query query = firebaseService.database
          .collection("departments")
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshots = query.snapshots();

      await for (final snapshot in snapshots) {
        if (snapshot.docs.isNotEmpty) {
          _departments = snapshot.docs
              .map((doc) =>
                  DepartmentsModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          lastDoc = snapshot.docs.last;
        } else {
          lastDoc = null;
        }

        yield _departments;
      }
    } catch (e, s) {
      developer.log('Error fetching departments with pagination',
          error: e, stackTrace: s);
      _error = e.toString();
      yield [];
    }
  }

  // Update an existing department

  Future<void> updateDepartment(
      {required DepartmentsModel updatedDepartment,
      PlatformFile? profilePictureFile}) async {
    try {
      final documentRef = firebaseService.database
          .collection('departments')
          .doc(updatedDepartment.id);

      final docSnapShot = await documentRef.get();

      if (!docSnapShot.exists) {
        throw Exception(
            'Department with ID ${updatedDepartment.id} does not exist.');
      }

      String? profilePictureUrl;

      if (profilePictureFile != null) {
        final storageRef = firebaseService.storage.ref().child(
            'departments/${updatedDepartment.id}/profile_picture_${DateTime.now().millisecondsSinceEpoch}}');

        if (profilePictureFile.bytes != null) {
          final uploadTask =
              await storageRef.putData(profilePictureFile.bytes!);
          profilePictureUrl = await uploadTask.ref.getDownloadURL();
        } else if (profilePictureFile.path != null) {
          final uploadTask =
              await storageRef.putFile(File(profilePictureFile.path!));
          profilePictureUrl = await uploadTask.ref.getDownloadURL();
        }
      }

      final updatedFields = updatedDepartment.copyWith(
          departmentProfilePictureUrl: profilePictureUrl);

      await documentRef.update(updatedFields.toJson());

      developer.log(
        'Department updated successfully: ${updatedDepartment.id} ',
        name: 'updateDepartment',
      );
    } on FirebaseException catch (e) {
      developer.log(
        'Failed to update department: ${updatedDepartment.id} ',
        error: e.message,
        name: 'updateDepartment',
      );
      rethrow;
    } catch (e) {
      developer.log(
        'An unexpected error occurred while updating department: ${updatedDepartment.id}',
        error: e,
        name: 'updateDepartment',
      );
      rethrow;
    }
  }

  Future<List<DepartmentsModel>> searchDepartmentsByName(String query) async {
    try {
      // Perform case-insensitive search on department name
      final querySnapshot = await firebaseService.database
          .collection("departments")
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      return querySnapshot.docs
          .map((doc) => DepartmentsModel.fromJson(doc.data()))
          .toList();
    } catch (e, s) {
      developer.log('Error searching departments', error: e, stackTrace: s);
      return [];
    }
  }

  // Delete a department
  Future<void> deleteDepartment(String uid) async {
    try {
      await firebaseService.database
          .collection("departments")
          .doc(uid)
          .delete();

      // Remove from local list
      _departments.removeWhere((d) => d.id == uid);
      notifyListeners();
    } catch (e, s) {
      developer.log('Error deleting department', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }

  // Make a department inactive
  // Future<void> makeDepartmentInactive(String uid) async {
  //   try {
  //     await firebaseService.database
  //         .collection("departments")
  //         .doc(uid)
  //         .update({'isActive': false});

  //     // Update local list
  //     final index = _departments.indexWhere((d) => d.id == uid);
  //     if (index != -1) {
  //       _departments[index] = _departments[index].copyWith(isActive: false);
  //       notifyListeners();
  //     }
  //   } catch (e, s) {
  //     developer.log('Error making department inactive',
  //         error: e, stackTrace: s);
  //     _error = e.toString();
  //     rethrow;
  //   }
  // }
}
