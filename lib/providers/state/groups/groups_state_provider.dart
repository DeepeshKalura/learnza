import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../model/groups/groups_model.dart';
import '../../model/groups_provider.dart';

class GroupsStateProvider extends ChangeNotifier {
  List<GroupsModel> groups = [];
  var isLoading = false;
  XFile? groupCoverImage;
  XFile? groupImage;

  Future<void> pickGroupCoverImage() async {
    isLoading = true;
    notifyListeners();
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        groupImage = pickedFile;
      }
    } catch (e, s) {
      developer.log('Error picking group cover image', error: e, stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void removeImage() {
    groupCoverImage = null;
    notifyListeners();
  }

  void removeGroupImage() {
    groupImage = null;
    notifyListeners();
  }

  Future<void> getTheGroup() async {
    try {
      groups = await di.injector.get<GroupsProvider>().getGroups();
    } catch (e, s) {
      developer.log(e.toString(), error: e, stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createGroup(GroupsModel group) async {
    isLoading = true;
    notifyListeners();
    try {
      await di.injector.get<GroupsProvider>().createGroups(groupsModel: group);
    } catch (e, s) {
      developer.log(e.toString(), error: e, stackTrace: s);
    }
    notifyListeners();
  }

  Future<void> updateGroup(GroupsModel group) async {
    isLoading = true;
    notifyListeners();
    try {
      await di.injector.get<GroupsProvider>().updateGroups(groupsModel: group);
    } catch (e, s) {
      developer.log(e.toString(), error: e, stackTrace: s);
    }
    notifyListeners();
  }
}
