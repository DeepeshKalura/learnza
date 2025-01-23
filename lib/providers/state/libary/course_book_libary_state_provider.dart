import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../model/books/books_model.dart';
import '../../../model/course/courses_model.dart';
import '../../../model/users/users_model.dart';
import '../../model/books_provider.dart';
import '../../model/courses_provider.dart';
import '../../model/users_provider.dart';

class CourseBookLibaryStateProvider extends ChangeNotifier {
  List<CoursesModel> _courses = [];
  String? _courseId;

  List<BooksModel> _books = [];

  var isLoadingCourses = false;
  var isLoadingBooks = false;
  List<CoursesModel> get courses => _courses;
  String? get courseId => _courseId;

  List<BooksModel> get books => _books;

  Future<void> getCourse() async {
    isLoadingCourses = true;
    notifyListeners();
    try {
      final userFuture = di.injector.get<UsersProvider>().getUser();
      final courseFuture = di.injector.get<CourseProvider>().getCourse();
      final results = await Future.wait([userFuture, courseFuture]);
      final user = results[0] as UsersModel;
      final course = results[1] as List<CoursesModel>;

      _courses = course;
      _courseId = user.courseId;
    } catch (e, s) {
      // TODO: Add Sentry here
      developer.log('setCourses', error: e, stackTrace: s);
    } finally {
      isLoadingCourses = false;
      notifyListeners();
    }
  }

  Future<void> getBooksWithSpecificCourseAndYear(
      String courseId, int year) async {
    isLoadingBooks = true;
    notifyListeners();

    try {
      _books.clear();
      _books = await di.injector
          .get<BooksProvider>()
          .getBooksFromTheLernzaLibary(courseId, year);
    } catch (e, s) {
      developer.log('getBooksWithSpecificCourseAndYear',
          error: e, stackTrace: s);
      rethrow;
    } finally {
      isLoadingBooks = false;
      notifyListeners();
    }
  }
}
