import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../interface/messenger_interface.dart';
import '../../model/groups/groups_model.dart';
import '../../model/messenger/messenger_model.dart';
import '../../model/users/users_model.dart';
import '../../service/firebase_service.dart';

class MessengerProvider {
  final FirebaseService firebaseService;

  MessengerProvider({required this.firebaseService});

  Future<List<MessengerInterface>> getUserMessengerModel() async {
    final uid = firebaseService.auth.currentUser?.uid;
    final messenger = await firebaseService.database
        .collection("users")
        .doc(uid)
        .collection("messenger")
        .orderBy("lastseen", descending: true)
        .get();

    return Future.wait(
      messenger.docs.map(
        (data) async => await getMessengerInterface(
          MessengerModel.fromJson(
            data.data(),
          ),
        ),
      ),
    );
  }

  Future<MessengerInterface> getMessengerInterface(
      MessengerModel message) async {
    //? REMEMBER we can use the caching for better optimizing

    if ((message.groupId == null && message.userId == null) ||
        (message.groupId != null && message.userId != null)) {
      throw Exception("Your world get violated about messaging and the way");
    }
    try {
      if (message.groupId != null) {
        // It means there is not groupId

        final group = await firebaseService.database
            .collection("groups")
            .where("id", isEqualTo: message.groupId)
            .get();

        if (group.docs.isEmpty) {
          throw Exception("Group not found");
        }

        return MessengerInterface(
          GroupsModel.fromJson(
            group.docs.first.data(),
          ),
        );
      } else {
        final user = await firebaseService.database
            .collection("users")
            .where("uid", isEqualTo: message.userId)
            .get();

        if (user.docs.isEmpty) {
          throw Exception("Group not found");
        }

        return MessengerInterface(
          UsersModel.fromJson(
            user.docs.first.data(),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isGroupOrPersonExists({String? userId, String? groupId}) async {
    final currentUserId = firebaseService.auth.currentUser?.uid;
    if (currentUserId == null) {
      developer.log("Why we have error?");
      return false;
    }

    if (userId == null && groupId == null) {
      developer.log("Why we have gd?");
      return false;
    }

    if (userId == null && groupId != null) {
      final query = await firebaseService.database
          .collection("users")
          .doc(currentUserId)
          .collection("messenger")
          .where(
            Filter("groupId", isEqualTo: groupId),
          )
          .get();
      return query.docs.isNotEmpty;
    } else if (groupId == null && userId != null) {
      final query = await firebaseService.database
          .collection("users")
          .doc(currentUserId)
          .collection("messenger")
          .where(
            Filter("userId", isEqualTo: userId),
          )
          .get();
      developer.log("I think it cool ${query.docs.isNotEmpty}");
      return query.docs.isNotEmpty;
    } else {
      throw Exception(
          "Either there will be UserId or GroupId for this operation not both are allowed user cannot be group and group cannot be user");
    }
  }

  Future<void> setUserMessengerModel({String? userId, String? groupId}) async {
    final uid = const Uuid().v4();
    final personId = firebaseService.auth.currentUser?.uid;

    final isItExist =
        await isGroupOrPersonExists(userId: userId, groupId: groupId);
    if (isItExist == true) {
      return;
    }

    final messenger = MessengerModel(
      id: uid,
      userId: userId,
      groupId: groupId,
      lastseen: DateTime.now(),
    );

    await firebaseService.database
        .collection("users")
        .doc(personId)
        .collection("messenger")
        .doc(uid)
        .set(
          messenger.toJson(),
        );
  }

  Future<void> setLastseen(MessengerModel model) async {
    final uid = firebaseService.auth.currentUser?.uid;

    await firebaseService.database
        .collection("users")
        .doc(uid)
        .collection("messenger")
        .doc(model.id)
        .update(
          model.toJson(),
        );
  }
}
