import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/logger.dart';

class MigrationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // A unique key for this specific migration. If you add more migrations
  // in the future, you'll use a different key.
  static const String _userSearchKeywordsMigrationKey =
      'v1_user_search_keywords';

  // Helper function to generate all possible substrings for searching.
  List<String> _generateSearchKeywords(String text) {
    final keywords = <String>{};
    final lowercaseText = text.toLowerCase().trim();

    final nameParts = lowercaseText.split(' ').where((part) => part.isNotEmpty);

    for (final part in nameParts) {
      for (int i = 0; i < part.length; i++) {
        for (int j = i + 1; j <= part.length; j++) {
          keywords.add(part.substring(i, j));
        }
      }
    }
    return keywords.toList();
  }

  /// Checks if the migration is needed and runs it.
  /// This should be called once during app startup.
  Future<void> runUserSearchMigration() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Check if this specific migration has already been completed.
      final bool hasRun =
          prefs.getBool(_userSearchKeywordsMigrationKey) ?? false;

      if (hasRun) {
        log.i(
            "Migration '$_userSearchKeywordsMigrationKey' has already been run. Skipping.");
        return;
      }

      log.i(
          "Starting one-time user data migration to add 'searchableKeywords'...");

      // Fetch all users that do NOT have the 'searchableKeywords' field.
      final usersSnapshot = await _db
          .collection('users')
          .where('searchableKeywords', isEqualTo: null)
          .get();

      if (usersSnapshot.docs.isEmpty) {
        log.i("No users found requiring migration. All good!");
        // Mark as run even if no users were found, to prevent re-checking.
        await prefs.setBool(_userSearchKeywordsMigrationKey, true);
        return;
      }

      log.w(
          "Found ${usersSnapshot.docs.length} users to migrate. This may take a moment...");

      // Use a WriteBatch for efficiency. It performs all writes in a single request.
      final batch = _db.batch();
      int updatedCount = 0;

      for (final doc in usersSnapshot.docs) {
        final data = doc.data();
        final fullName = data['fullName'] as String?;

        if (fullName != null && fullName.isNotEmpty) {
          final keywords = _generateSearchKeywords(fullName);
          batch.update(doc.reference, {'searchableKeywords': keywords});
          updatedCount++;
        }
      }

      if (updatedCount > 0) {
        await batch.commit();
        log.i("✅ Successfully migrated $updatedCount users.");
      } else {
        log.i("No users with a valid 'fullName' needed migration.");
      }

      // Mark the migration as complete to prevent it from running again.
      await prefs.setBool(_userSearchKeywordsMigrationKey, true);
      log.i(
          "Migration '$_userSearchKeywordsMigrationKey' is now marked as complete.");
    } catch (e, s) {
      log.e("FATAL: User data migration failed!", error: e, stackTrace: s);
      // We don't mark as complete if it fails, so it can try again on next launch.
    }
  }
}
