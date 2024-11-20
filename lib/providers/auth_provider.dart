import 'dart:developer' as developer;
import 'dart:math';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:learnza/model/app_enums.dart';
import 'package:learnza/service/firebase_service.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../model/users/users_model.dart';
import '../service/firebase_cloud_function_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  AuthProvider(this.firebaseService);

  UsersModel? _user;

  UsersModel? get user => _user;

  Future<UsersModel?> login(String email, String password) async {
    final firebaseService = FirebaseService();

    try {
      final UserCredential userCredential = await firebaseService.auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        throw FirebaseAuthException(
          code: 'USER_NOT_FOUND',
          message: 'Unable to fetch user information.',
        );
      }

      final userFromCollection = await firebaseService.database
          .collection('users')
          .doc('${userCredential.user}')
          .get();

      _user = UsersModel.fromJson(
        userFromCollection.data() as Map<String, dynamic>,
      );

      return _user;
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }

  Future<void> logout() async {
    await firebaseService.auth.signOut();
    _user = null;
    notifyListeners();
  }

  String _generateRandomPassword() {
    const chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#\$%&*";
    Random random = Random();
    return List.generate(12, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  Future<void> createAdminRegisteration({
    required String email,
    required String username,
  }) async {
    try {
      final password = _generateRandomPassword();
      final id = const Uuid().v4();
      final newUserModel = UsersModel(
        uid: id,
        email: email,
        fullName: username,
        role: UserRole.admin,
        isActive: true,
        // Admin fields
        isSuperAdmin: true,
        createdAt: DateTime.now(),
      );
      var response = await http.post(
        headers: {
          'Content-Type': 'application/json',
        },
        Uri.parse(
          FirebaseCloudFunctionService.createAdminUser,
        ),
        body: jsonEncode({
          'user': newUserModel.toJson(),
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create user');
      }

      return;
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }
}
