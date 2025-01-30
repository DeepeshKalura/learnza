import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../model/users_provider.dart';

class SettingsStateProvider extends ChangeNotifier {
  var isLoading = false;

  Future<void> logout() async {
    isLoading = true;
    notifyListeners();
    try {
      await di.injector<UsersProvider>().logout();
    } catch (e, s) {
      developer.log("setting logout", error: e, stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
