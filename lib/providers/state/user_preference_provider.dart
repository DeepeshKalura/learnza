import 'package:flutter/widgets.dart';

import '../../service/local_database_service.dart';

class UserPreferenceProvider extends ChangeNotifier {
  final localDatabase = LocalDatabaseService.instance;

  bool isDarkMode = false;
  String currentLanguage = 'en';
  final List<String> languages = ['en', 'ne'];

  UserPreferenceProvider() {
    _init();
  }

  Future<void> _init() async {
    isDarkMode = await localDatabase.isDarkTheme();
    currentLanguage = await localDatabase.currentLanguage();
  }

  Future<void> setDarkMode(bool isDark) async {
    await localDatabase.setDarkTheme(isDark);
    isDarkMode = isDark;
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    await localDatabase.setLanguage(language);
    currentLanguage = language;
    notifyListeners();
  }
}
