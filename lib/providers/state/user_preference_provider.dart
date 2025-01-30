import 'package:flutter/widgets.dart';

import '../../service/local_database_service.dart';

class UserPreferenceProvider extends ChangeNotifier {
  final localDatabase = LocalDatabaseService.instance;
  bool _isDarkMode = false;
  String _currentLanguage = 'en';
  bool _isInitialized = false;

  final List<String> languages = ['en', 'ne'];

  bool get isDarkMode => _isDarkMode;
  String get currentLanguage => _currentLanguage;
  bool get isInitialized => _isInitialized;

  UserPreferenceProvider() {
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    try {
      await localDatabase
          .initializePreferences(); // Make sure table exists with default values
      _isDarkMode = await localDatabase.isDarkTheme();
      _currentLanguage = await localDatabase.currentLanguage();
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing preferences: $e');
      _isDarkMode = false;
      _currentLanguage = 'en';
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<void> setDarkMode(bool isDark) async {
    if (_isDarkMode == isDark) return; // Avoid unnecessary updates
    try {
      await localDatabase.setDarkTheme(isDark);
      _isDarkMode = isDark;
      notifyListeners();
    } catch (e) {
      debugPrint('Error setting dark mode: $e');
    }
  }

  Future<void> setLanguage(String language) async {
    if (!languages.contains(language)) return; // Validate language
    if (_currentLanguage == language) return; // Avoid unnecessary updates

    try {
      await localDatabase.setLanguage(language);
      _currentLanguage = language;
      notifyListeners();
    } catch (e) {
      debugPrint('Error setting language: $e');
    }
  }
}
