import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnza/model/app_enums.dart';
import 'package:learnza/service/firebase_service.dart';
import 'package:uuid/uuid.dart';

import '../model/users/users_model.dart';
import '../service/firebase_cloud_function_service.dart';
import '../utils/logger.dart';

List<String> _generateSearchKeywords(String text) {
  final keywords = <String>{};
  final lowercaseText = text.toLowerCase();
  for (int i = 0; i < lowercaseText.length; i++) {
    for (int j = i + 1; j <= lowercaseText.length; j++) {
      keywords.add(lowercaseText.substring(i, j));
    }
  }
  return keywords.toList();
}

class AuthProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  AuthProvider(this.firebaseService);

  UsersModel? _user;

  UsersModel? get user => _user;

  bool obscure = true;

  bool isLoading = false;

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void updateLocalUser(UsersModel updatedUser) {
    if (firebaseService.auth.currentUser?.uid != updatedUser.uid) {
      log.w("Attempted to update user with mismatched UID");
      return;
    }
    _user = updatedUser;
    notifyListeners();
  }

  Future<void> getUser(String uid) async {
    log.i("Fetching user data for UID: $uid");
    try {
      final userFromCollection =
          await firebaseService.database.collection('users').doc(uid).get();

      if (!userFromCollection.exists) {
        log.w("User document not found in Firestore for UID: $uid");
        throw Exception("User data not found in database.");
      }

      _user = UsersModel.fromJson(
        userFromCollection.data() as Map<String, dynamic>,
      );
      log.i(
          "Successfully fetched user: ${_user?.fullName} | Role: ${_user?.role.name}");
    } catch (e, s) {
      log.e("Failed to get user data for UID: $uid", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<UsersModel?> login(String email, String password) async {
    log.i("Login attempt for email: $email");
    try {
      isLoading = true;
      notifyListeners();
      final UserCredential userCredential = await firebaseService.auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        throw FirebaseAuthException(
          code: 'USER_NOT_FOUND',
          message: 'Unable to fetch user information.',
        );
      }

      log.i("Firebase Auth successful for UID: ${userCredential.user!.uid}");

      await getUser(userCredential.user!.uid);

      return _user;
    } catch (e, s) {
      log.e("Login failed for email: $email", error: e, stackTrace: s);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    log.i("User logging out: ${_user?.email}");
    await firebaseService.auth.signOut();
    _user = null;
    notifyListeners();
    log.i("Logout successful.");
  }

  String _generateRandomPassword() {
    const chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#\$%&*";
    Random random = Random();
    return List.generate(12, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  Future<void> createAdminRegistration({
    required String email,
    required String username,
  }) async {
    log.i("Attempting to create new ADMIN: $username ($email)");
    try {
      final password = _generateRandomPassword();
      final id = const Uuid().v4();
      final newAdminModel = UsersModel(
        uid: id,
        email: email,
        fullName: username,
        role: UserRole.admin,
        isActive: true,
        isOnline: false,
        createdAt: DateTime.now(),
        searchableKeywords:
            _generateSearchKeywords(username), // Generate keywords
      );
      var response = await http.post(
        headers: {
          'Content-Type': 'application/json',
        },
        Uri.parse(
          FirebaseCloudFunctionService.createUser,
        ),
        body: jsonEncode({
          'user': newAdminModel.toJson(),
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create user: ${response.body}');
      }
      log.i("Successfully created new ADMIN via cloud function.");
      return;
    } catch (e, s) {
      log.e("Failed to create admin", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> createTeacherRegistration({
    required String email,
    required String fullName,
    required String courseId,
  }) async {
    log.i("Attempting to create new TEACHER: $fullName ($email)");
    try {
      final password = _generateRandomPassword();
      final id = const Uuid().v4();

      final newTeacherModel = UsersModel(
        uid: id,
        email: email,
        fullName: fullName,
        role: UserRole.teacher,
        isActive: true,
        courseId: courseId,
        createdAt: DateTime.now(),
        isOnline: false,
        searchableKeywords:
            _generateSearchKeywords(fullName), // Generate keywords
      );

      var response = await http.post(
        headers: {
          'Content-Type': 'application/json',
        },
        Uri.parse(
          FirebaseCloudFunctionService.createUser,
        ),
        body: jsonEncode({
          'user': newTeacherModel.toJson(),
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create user: ${response.body}');
      }
      log.i("Successfully created new TEACHER via cloud function.");
      return;
    } catch (e, s) {
      log.e("Failed to create teacher", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> createStudentRegistration({
    required String email,
    required String fullName,
    List<String>? enrolledCourseIds,
    required String batch,
  }) async {
    log.i("Attempting to create new STUDENT: $fullName ($email)");
    try {
      final password = _generateRandomPassword();
      final id = const Uuid().v4();

      final newStudentModel = UsersModel(
        uid: id,
        email: email,
        fullName: fullName,
        role: UserRole.student,
        isOnline: false,
        isActive: true,
        batch: batch,
        createdAt: DateTime.now(),
        searchableKeywords:
            _generateSearchKeywords(fullName), // Generate keywords
      );

      var response = await http.post(
        headers: {
          'Content-Type': 'application/json',
        },
        Uri.parse(
          FirebaseCloudFunctionService.createUser,
        ),
        body: jsonEncode({
          'user': newStudentModel.toJson(),
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create student: ${response.body}');
      }
      log.i("Successfully created new STUDENT via cloud function.");
      return;
    } catch (e, s) {
      log.e('Student Registration Error', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> forgotPassword(String email) async {
    log.i("Sending password reset email to: $email");
    try {
      await firebaseService.auth.sendPasswordResetEmail(email: email);
      log.i("Password reset email sent successfully.");
    } catch (e, s) {
      log.e("Failed to send password reset email", error: e, stackTrace: s);
      rethrow;
    }
  }
}
