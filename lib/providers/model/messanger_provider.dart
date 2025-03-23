import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../model/messanger/messenger_model.dart';
import '../../service/firebase_service.dart';

class MessangerProvider {
  final FirebaseService firebaseService;

  MessangerProvider({required this.firebaseService});

  Future<List<MessengerModel>> getUserMessangerModel() async {
    final uid = firebaseService.auth.currentUser?.uid;
    final messanger = await firebaseService.database
        .collection("users")
        .doc(uid)
        .collection("messanger")
        .orderBy("lastseen", descending: true)
        .get();

    return messanger.docs
        .map((data) => MessengerModel.fromJson(data.data()))
        .toList();
  }

  Future<bool> isGroupOrPersonExists({String? userId, String? groupId}) async {
    final currentUserId = firebaseService.auth.currentUser?.uid;

    final query = await firebaseService.database
        .collection("users")
        .doc(currentUserId)
        .collection("messanger")
        .where(Filter.or(
          Filter("userId", isEqualTo: userId),
          Filter("groupId", isEqualTo: groupId),
        ))
        .get();

    return query.docs.isNotEmpty;
  }

  Future<void> setUserMessangerModel({String? userId, String? groupId}) async {
    final uid = const Uuid().v4();
    final userId = firebaseService.auth.currentUser?.uid;

    if (await isGroupOrPersonExists(userId: userId, groupId: groupId)) {
      return;
    }

    final messanger = MessengerModel(
      id: uid,
      userId: userId,
      groupId: groupId,
      lastseen: DateTime.now(),
    );

    await firebaseService.database
        .collection("users")
        .doc(userId)
        .collection("messanger")
        .doc(uid)
        .set(
          messanger.toJson(),
        );
  }

  Future<void> setLastseen(MessengerModel model) async {
    final uid = firebaseService.auth.currentUser?.uid;

    await firebaseService.database
        .collection("users")
        .doc(uid)
        .collection("messanger")
        .doc(model.id)
        .update(
          model.toJson(),
        );
  }
}
