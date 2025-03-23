// TODO: Add sentry in this application

import 'dart:developer' as developer;
import 'dart:developer';

import '../../model/app_enums.dart';
import '../../model/users/users_model.dart';
import '../../service/firebase_service.dart';

class UsersProvider {
  final FirebaseService firebaseService;

  UsersProvider({required this.firebaseService});

  Future<List<UsersModel>> searchUsersByName(String query,
      {int limit = 20}) async {
    if (query.isEmpty) return [];

    try {
      final allPeople = await _fetchAllUsers();

      return allPeople
          .where((group) => group.fullName.toLowerCase().contains(query))
          .take(limit)
          .toList();
    } catch (e) {
      log('Error searching users: $e');
      return [];
    }
  }

  // Method to prepare user for searchable indexing
  Future<void> updateUserSearchIndex(String userId, String fullName) async {
    // Prepare search-friendly name variations
    String searchName = fullName.toLowerCase().trim();
    List<String> searchNameParts = _generateSearchParts(searchName);

    await firebaseService.database.collection('users').doc(userId).update({
      'searchName': searchName,
      'searchNameParts': searchNameParts,
    });
  }

  // Generate searchable name parts
  List<String> _generateSearchParts(String name) {
    // Split name into individual words
    List<String> parts = name.split(' ');

    // Generate all possible substring combinations
    Set<String> searchParts = {};

    for (String part in parts) {
      // Add full words
      searchParts.add(part);

      // Add progressive substrings
      for (int i = 1; i <= part.length; i++) {
        searchParts.add(part.substring(0, i).toLowerCase());
      }
    }

    return searchParts.toList();
  }

  Future<UserRole> whichUser() async {
    final user = await getUser();
    return user.role;
  }

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

  Future<List<UsersModel>> _fetchAllUsers() async {
    final snapshot =
        await firebaseService.database.collection("users").limit(100).get();

    return snapshot.docs.map((doc) => UsersModel.fromJson(doc.data())).toList();
  }
}
