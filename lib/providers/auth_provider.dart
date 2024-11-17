import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:learnza/service/firebase_service.dart';

import '../model/users/users_model.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  AuthProvider(this.firebaseService);

  Future<UsersModel> login(String email, String password) async {
    final firebaseService = FirebaseService();

    try {
      final UserCredential userCredential = await firebaseService.auth
          .signInWithEmailAndPassword(email: email, password: password);

      final User? user = userCredential.user;

      if (user == null) {
        throw FirebaseAuthException(
          code: 'USER_NOT_FOUND',
          message: 'Unable to fetch user information.',
        );
      }

      // Retrieve user data from Realtime Database
      final userRef = firebaseService.database.ref('users/${user.uid}');
      final event = await userRef.once();

      if (event.snapshot.value == null) {
        throw Exception('User data not found in the database.');
      }

      final Map<String, dynamic> userData =
          Map<String, dynamic>.from(event.snapshot.value as Map);

      // Convert to UsersModel
      return UsersModel.fromJson(userData);
    } catch (e) {
      rethrow;
    }
  }
}
