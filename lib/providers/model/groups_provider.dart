// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/groups/groups_model.dart';
import '../../service/firebase_service.dart';
// TODO: add sentry on this provider

class GroupsProvider {
  final FirebaseService firebaseService;

  GroupsProvider({required this.firebaseService});

  // CRUD Operations

  Future<List<GroupsModel>> getGroups(
      {int limit = 10, DocumentSnapshot? startAfter}) async {
    try {
      // final userId = firebaseService.auth.currentUser!.uid;
      // TODO: Please add the spearte group for the user
      Query query = firebaseService.database
          .collection("groups")
          .orderBy("name", descending: false)
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      return await query.get().then((value) {
        List<GroupsModel> groups = [];
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            developer.log('elemenbt ${element.data()}');
            groups.add(
              GroupsModel.fromJson(
                element.data() as Map<String, dynamic>,
              ),
            );
          }
        }
        developer.log('Groups: $groups');
        return groups;
      });
    } catch (e, s) {
      developer.log(e.toString(), error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> createGroups({required GroupsModel groupsModel}) async {
    try {
      final Map<String, dynamic> groupJson = {
        'id': groupsModel.id,
        'name': groupsModel.name,
        'description': groupsModel.description,
        'imageUrl': groupsModel.imageUrl,
        'coverImageUrl': groupsModel.coverImageUrl,
        'members': groupsModel.members
            .map((member) => {
                  'id': member.id,
                  'role': member.role.name, // Custom serialization for enum
                })
            .toList(),
        'createdAt': groupsModel.createdAt.toIso8601String(),
        'updatedAt': groupsModel.updatedAt.toIso8601String(),
        'privacy': groupsModel.privacy.name, // Custom serialization for enum
        'pendingInvites': groupsModel.pendingInvites,
      };
      await firebaseService.database
          .collection("groups")
          .doc(groupsModel.id)
          .set(
            groupJson,
          );
    } catch (e, s) {
      developer.log('Error creating groups', error: e, stackTrace: s);
      rethrow;
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

  Future<String> uploadGroupImage(XFile imageFile, String groupId) async {
    try {
      var storageRef = firebaseService.storage.ref().child(
          'group_images/$groupId/${DateTime.now().millisecondsSinceEpoch}');

      await storageRef.putFile(File(imageFile.path));
      return await storageRef.getDownloadURL();
    } catch (e) {
      developer.log('Error uploading group image', error: e);
      rethrow;
    }
  }
}
