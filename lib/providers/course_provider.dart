import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/course/courses_model.dart';
import '../service/firebase_service.dart';

class CourseProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  CourseProvider({required this.firebaseService});

  List<CoursesModel> _courses = [];
  final bool _isLoading = false;
  String? _error;

  // Getters
  List<CoursesModel> get courses => _courses;
  bool get isLoading => _isLoading;
  String? get error => _error;

  DocumentSnapshot? lastDoc;

  // Create a new course
  Future<void> createCourse({
    required String name,
    required String year,
    Map<String, dynamic>? courseSettings,
  }) async {
    try {
      final docRef = firebaseService.database.collection("courses").doc();

      final course = CoursesModel(
        id: docRef.id,
        name: name,
        year: year,
        isActive: true,
        createdAt: DateTime.now(),
      );

      await docRef.set(course.toJson());
      notifyListeners();
    } catch (e, s) {
      developer.log('Error creating course', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }

  // Get courses with pagination
  Stream<List<CoursesModel>> getCoursesWithPagination({
    required int limit,
    DocumentSnapshot? startAfter,
    String? departmentId,
  }) async* {
    try {
      Query query = firebaseService.database
          .collection("courses")
          .orderBy('createdAt', descending: true)
          .limit(limit);

      // Optional filtering by department
      if (departmentId != null) {
        query = query.where('departmentId', isEqualTo: departmentId);
      }

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshots = query.snapshots();

      await for (final snapshot in snapshots) {
        if (snapshot.docs.isNotEmpty) {
          _courses = snapshot.docs
              .map((doc) =>
                  CoursesModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          lastDoc = snapshot.docs.last;
        } else {
          lastDoc = null;
        }

        yield _courses;
      }
    } catch (e, s) {
      developer.log('Error fetching courses with pagination',
          error: e, stackTrace: s);
      _error = e.toString();
      yield [];
    }
  }

  // Search courses
  Future<List<CoursesModel>> searchCourses(String query,
      {String? departmentId}) async {
    try {
      Query queryRef = firebaseService.database
          .collection("courses")
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff');

      // Optional filtering by department
      if (departmentId != null) {
        queryRef = queryRef.where('departmentId', isEqualTo: departmentId);
      }

      final querySnapshot = await queryRef.get();

      return querySnapshot.docs
          .map((doc) =>
              CoursesModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e, s) {
      developer.log('Error searching courses', error: e, stackTrace: s);
      return [];
    }
  }

  // Update an existing course
  Future<void> updateCourse({required CoursesModel updatedCourse}) async {
    try {
      final documentRef =
          firebaseService.database.collection('courses').doc(updatedCourse.id);

      final docSnapshot = await documentRef.get();

      if (!docSnapshot.exists) {
        throw Exception('Course with ID ${updatedCourse.id} does not exist.');
      }

      await documentRef.update(updatedCourse.toJson());

      developer.log(
        'Course updated successfully: ${updatedCourse.id} ',
        name: 'updateCourse',
      );
    } catch (e) {
      developer.log(
        'An unexpected error occurred while updating course: ${updatedCourse.id}',
        error: e,
        name: 'updateCourse',
      );
      rethrow;
    }
  }

  // Delete a course
  Future<void> deleteCourse(String courseId) async {
    try {
      await firebaseService.database
          .collection("courses")
          .doc(courseId)
          .delete();

      // Remove from local list
      _courses.removeWhere((c) => c.id == courseId);
      notifyListeners();
    } catch (e, s) {
      developer.log('Error deleting course', error: e, stackTrace: s);
      _error = e.toString();
      rethrow;
    }
  }

  Future<List<CoursesModel>> getCoursesByDepartment(String departmentId) async {
    try {
      final query = firebaseService.database
          .collection("courses")
          .where('departmentId', isEqualTo: departmentId);

      final snapshots = await query.get();

      _courses = snapshots.docs
          .map((doc) => CoursesModel.fromJson(doc.data()))
          .toList();

      return _courses;
    } catch (e, s) {
      developer.log('Error fetching courses', error: e, stackTrace: s);
      _error = e.toString();

      rethrow;
    }
  }
}
