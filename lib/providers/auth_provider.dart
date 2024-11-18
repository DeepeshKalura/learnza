import 'dart:developer' as developer;
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:learnza/model/app_enums.dart';
import 'package:learnza/service/firebase_service.dart';

import '../model/users/users_model.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  AuthProvider(this.firebaseService);

  User? _user;

  User? get user => _user;

  Future<User?> login(String email, String password) async {
    final firebaseService = FirebaseService();

    try {
      final UserCredential userCredential = await firebaseService.auth
          .signInWithEmailAndPassword(email: email, password: password);

      _user = userCredential.user;

      if (user == null) {
        throw FirebaseAuthException(
          code: 'USER_NOT_FOUND',
          message: 'Unable to fetch user information.',
        );
      }

      return _user;

      // Retrieve user data from Realtime Database
      // final userRef = firebaseService.database.ref('users/${user.uid}');
      // final event = await userRef.once();

      // if (event.snapshot.value == null) {
      //   throw Exception('User data not found in the database.');
      // }

      // final Map<String, dynamic> userData =
      //     Map<String, dynamic>.from(event.snapshot.value as Map);

      // // Convert to UsersModel
      // return UsersModel.fromJson(userData);
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
    String? whoCreatedYou,
  }) async {
    try {
      final password = _generateRandomPassword();

      final newUser = await firebaseService.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (newUser.user == null) {
        throw FirebaseAuthException(
          code: 'USER_NOT_CREATED',
          message: 'Unable to create this $username account.',
        );
      }

      newUser.user!.updateDisplayName(username);

      final userRef =
          firebaseService.database.ref('users/${newUser.user!.uid}');

      final newUserModel = UsersModel(
        uid: newUser.user!.uid,
        email: email,
        fullName: username,
        role: UserRole.admin,
        isActive: true,
        // Admin fields
        isSuperAdmin: true,
        createdAt: DateTime.now(),
      );

      await userRef.set(newUserModel.toJson());

      // Send email to the user
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }

  Future<void> _sendFirstTimeEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: 'https://your-app.com/welcome?first_time=true',
        handleCodeInApp: true,
        androidPackageName: 'xyz.deepeshkalura.learnza',
        iOSBundleId: 'xyz.deepeshkalura.learnza',
      ),
    );
  }
}
