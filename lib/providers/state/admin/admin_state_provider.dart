import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../../../locator/injector.dart' as di;
import '../../../model/users/users_model.dart';
import '../../model/users_provider.dart';

class AdminStateProvider extends ChangeNotifier {
  var isLoading = false;

  List<UsersModel> user = [];

  Future<void> getAllUser() async {
    isLoading = true;
    notifyListeners();
    try {
      user = await di.injector.get<UsersProvider>().getAllUser();
    } catch (e, s) {
      developer.log('getAllUser', error: e, stackTrace: s);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
