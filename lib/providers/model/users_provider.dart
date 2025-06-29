import '../../model/app_enums.dart';
import '../../model/users/users_model.dart';
import '../../service/firebase_service.dart';
import '../../utils/logger.dart';

class UsersProvider {
  final FirebaseService firebaseService;

  UsersProvider({required this.firebaseService});

  Future<List<UsersModel>> searchUsersByName(String query,
      {int limit = 20}) async {
    if (query.isEmpty) return [];

    log.i("Searching for users with query: '$query'");
    try {
      final snapshot = await firebaseService.database
          .collection('users')
          .where('searchableKeywords', arrayContains: query.toLowerCase())
          .limit(limit)
          .get();

      log.i("Found ${snapshot.docs.length} users matching query.");
      return snapshot.docs
          .map((doc) => UsersModel.fromJson(doc.data()))
          .toList();
    } catch (e, s) {
      log.e("Error searching users", error: e, stackTrace: s);
      return [];
    }
  }

  Future<UserRole> whichUser() async {
    final user = await getUser();
    return user.role;
  }

  Future<List<UsersModel>> getAllUser() async {
    try {
      if (firebaseService.auth.currentUser == null) {
        throw Exception('User not found');
      }

      final queryShort = await firebaseService.database
          .collection('users')
          .orderBy('createdAt', descending: true)
          .limit(300)
          .get();

      if (queryShort.docs.isEmpty) {
        throw Exception('No User found');
      }

      return queryShort.docs.map((e) {
        return UsersModel.fromJson(e.data());
      }).toList();
    } catch (e, s) {
      log.e('getAllUser failed', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<UsersModel> getUser() async {
    try {
      if (firebaseService.auth.currentUser == null) {
        throw Exception('User not logged in');
      }
      final String uid = firebaseService.auth.currentUser!.uid;

      final queryShort = await firebaseService.database
          .collection('users')
          .where("uid", isEqualTo: uid)
          .limit(1)
          .get();

      if (queryShort.docs.isEmpty) {
        throw Exception('User not found in database');
      }
      return UsersModel.fromJson(queryShort.docs.first.data());
    } catch (e, s) {
      log.e('getUser failed', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await firebaseService.auth.signOut();
    } catch (e, s) {
      log.e('logout failed', error: e, stackTrace: s);
      rethrow;
    }
  }
}
