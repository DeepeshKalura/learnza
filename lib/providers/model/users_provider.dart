// TODO: Add sentry in this application

import 'dart:developer' as developer;

import '../../model/users/users_model.dart';
import '../../service/firebase_service.dart';

class UsersProvider {
  final FirebaseService firebaseService;

  UsersProvider({required this.firebaseService});

  Future<UsersModel> getUser() async {
    try {
      if (firebaseService.auth.currentUser == null) {
        throw Exception('User not found');
      }
      final String uid = firebaseService.auth.currentUser!.uid;

      final queryShort = await firebaseService.database
          .collection('users')
          .where("uid", isEqualTo: uid)
          .limit(1)
          .get();

      if (queryShort.docs.isEmpty) {
        throw Exception('User not found');
      }
      return UsersModel.fromJson(queryShort.docs.first.data());
    } catch (e, s) {
      developer.log('getUser', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await firebaseService.auth.signOut();
    } catch (e, s) {
      developer.log('logout', error: e, stackTrace: s);
      rethrow;
    }
  }
}
