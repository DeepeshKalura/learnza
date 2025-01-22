import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

import '../model/groups/groups_model.dart';
import '../service/firebase_service.dart';

class GroupsProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  var isLoading = false;
  XFile? groupCoverImage;
  XFile? groupImage;

  GroupsProvider({required this.firebaseService});

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

  void removeGroupImage() {
    groupImage = null;
    notifyListeners();
  }

  Stream<List<GroupsModel>> getGroupsWithPagination(
      {required int limit, DocumentSnapshot? startAfter}) async* {
    try {
      Query query = firebaseService.database.collection("groups").limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshots = query.snapshots();

      await for (final snapshot in snapshots) {
        if (snapshot.docs.isNotEmpty) {
          final List<GroupsModel> groups = snapshot.docs
              .map((doc) =>
                  GroupsModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          yield groups;
        } else {
          yield [];
        }
      }
    } catch (e, s) {
      developer.log('Error fetching groups with pagination',
          error: e, stackTrace: s);
      yield [];
    }
  }

  Future<void> createGroups({required GroupsModel groupsModel}) async {
    try {
      isLoading = true;
      notifyListeners();
      await firebaseService.database
          .collection("groups")
          .doc(groupsModel.id)
          .set(
            groupsModel.toJson(),
          );
    } catch (e, s) {
      developer.log('Error creating groups', error: e, stackTrace: s);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateGroups({required GroupsModel groupsModel}) async {
    try {
      await firebaseService.database
          .collection("groups")
          .doc(groupsModel.id)
          .update(
            groupsModel.toJson(),
          );
    } catch (e, s) {
      developer.log('Error updating groups', error: e, stackTrace: s);
    }
  }

  Future<void> deleteGroups({required String id}) async {
    try {
      await firebaseService.database.collection("groups").doc(id).delete();
    } catch (e, s) {
      developer.log('Error deleting groups', error: e, stackTrace: s);
    }
  }

  // Image Picker Method
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      groupCoverImage = pickedFile;
      notifyListeners();
    }
  }

  // Remove Image Method
  void removeImage() {
    groupCoverImage = null;
    notifyListeners();
  }

  // Upload Group Image Method
  Future<String?> uploadGroupImage(XFile imageFile) async {
    try {
      isLoading = true;
      notifyListeners();
      final groupId = FirebaseFirestore.instance.collection('groups').doc().id;
      final storageRef = firebaseService.storage.ref().child(
          'group_images/$groupId/${DateTime.now().millisecondsSinceEpoch}');

      await storageRef.putFile(File(imageFile.path));
      return await storageRef.getDownloadURL();
    } catch (e) {
      developer.log('Error uploading group image', error: e);
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
