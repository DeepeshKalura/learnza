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
  XFile? groupAvatarImage;

  Future<void> pickGroupCoverImage() async {
    isLoading = true;
    notifyListeners();
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        groupCoverImage = pickedFile;
      }
    } catch (e, s) {
      developer.log('Error picking group cover image', error: e, stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> pickGroupAvatarImage() async {
    isLoading = true;
    notifyListeners();
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        groupAvatarImage = pickedFile;
      }
    } catch (e, s) {
      developer.log('Error picking group cover image', error: e, stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void removeAvatarImage() {
    groupAvatarImage = null;
    notifyListeners();
  }

  void removeCoverImage() {
    groupCoverImage = null;
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
      await getTheGroup();
    } catch (e, s) {
      developer.log(e.toString(), error: e, stackTrace: s);
    }
    notifyListeners();
  }

  Future<String> uploadGroupImage(XFile imageFile, String groupId) async {
    isLoading = true;
    notifyListeners();
    try {
      return await di.injector.get<GroupsProvider>().uploadGroupImage(
            imageFile,
            groupId,
          );
    } catch (e) {
      developer.log('Error uploading group image', error: e);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
