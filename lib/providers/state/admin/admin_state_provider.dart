import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../../../locator/injector.dart' as di;
import '../../../model/users/users_model.dart';
import '../../../service/cloud_functions_service.dart';
import '../../model/users_provider.dart';

class AdminStateProvider extends ChangeNotifier {
  var isLoading = false;

  var createNewUserLoading = false;
  List<UsersModel> user = [];
  String selectedRole = 'student';

  String get getSelectedRole => selectedRole;

  void setSelectedRole(String role) {
    selectedRole = role;
    notifyListeners();
  }

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

  Future<void> createNewUser({
    required String email,
    required String role,
    required String fullName,
  }) async {
    createNewUserLoading = true;
    notifyListeners();
    try {
      await di.injector.get<CloudFunctionsService>().createUserByAdmin(
            email: email,
            role: role,
            fullName: fullName,
          );
      user = await di.injector.get<UsersProvider>().getAllUser();
    } catch (e, s) {
      developer.log('createNewUser', error: e, stackTrace: s);
      rethrow;
    } finally {
      createNewUserLoading = false;
      notifyListeners();
    }
  }
}
