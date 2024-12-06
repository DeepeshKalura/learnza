import 'package:flutter/foundation.dart';

class LibaryStudentStateProvider extends ChangeNotifier {
  List<String> typesOfLibary = [
    "Lernza Library",
    "Anna Library",
    "Offline Library",
  ];

  int _currentLibary = 0;

  void chnageLibary(int index) {
    _currentLibary = index;
    notifyListeners();
  }

  String get currentLibary => typesOfLibary[_currentLibary];
}
