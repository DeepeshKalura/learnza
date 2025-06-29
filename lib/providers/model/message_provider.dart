import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnza/interface/messenger_interface.dart';
import 'package:learnza/model/groups/groups_model.dart';
import 'package:learnza/model/messenger/messenger_model.dart';
import 'package:learnza/model/users/users_model.dart';
import 'package:uuid/uuid.dart';

import '../../model/app_enums.dart';
import '../../model/message/messages_model.dart';
import '../../service/firebase_service.dart';
import '../../utils/logger.dart';

class MessageProvider {
  final FirebaseService firebaseService;
  DocumentSnapshot? _lastDocument;

  MessageProvider({required this.firebaseService});

  Future<List<MessengerInterface>> getChatList() async {
    final uid = firebaseService.auth.currentUser?.uid;
    if (uid == null) {
      log.w("getChatList called but user is not logged in.");
      return [];
    }

    log.i("Fetching chat list for user: $uid");
    final messengerSnap = await firebaseService.database
        .collection("users")
        .doc(uid)
        .collection("messenger")
        .orderBy("lastseen", descending: true)
        .get();

    if (messengerSnap.docs.isEmpty) {
      log.i("User $uid has no active conversations.");
      return [];
    }
    log.i("Found ${messengerSnap.docs.length} conversation entries.");

    final messengerModels = messengerSnap.docs
        .map((data) => MessengerModel.fromJson(data.data()))
        .toList();

    final userIds = <String>{};
    final groupIds = <String>{};

    for (final model in messengerModels) {
      if (model.userId != null) userIds.add(model.userId!);
      if (model.groupId != null) groupIds.add(model.groupId!);
    }

    log.d(
        "Batch fetching details for ${userIds.length} users and ${groupIds.length} groups.");

    final results = await Future.wait([
      _fetchUsersInBatches(userIds.toList()),
      _fetchGroupsInBatches(groupIds.toList()),
    ]);

    final usersMap = results[0] as Map<String, UsersModel>;
    final groupsMap = results[1] as Map<String, GroupsModel>;

    log.d(
        "Successfully fetched ${usersMap.length} user details and ${groupsMap.length} group details.");

    final chatList = <MessengerInterface>[];
    for (final model in messengerModels) {
      if (model.userId != null && usersMap.containsKey(model.userId)) {
        chatList.add(MessengerInterface(usersMap[model.userId]!));
      } else if (model.groupId != null &&
          groupsMap.containsKey(model.groupId)) {
        chatList.add(MessengerInterface(groupsMap[model.groupId]!));
      } else {
        log.w('Could not find data for messenger item ID: ${model.id}');
      }
    }

    log.i("Finished building chat list with ${chatList.length} items.");
    return chatList;
  }

  Future<Map<String, UsersModel>> _fetchUsersInBatches(List<String> ids) async {
    if (ids.isEmpty) return {};
    final Map<String, UsersModel> results = {};
    for (var i = 0; i < ids.length; i += 30) {
      final sublist = ids.sublist(i, i + 30 > ids.length ? ids.length : i + 30);
      final snapshot = await firebaseService.database
          .collection('users')
          .where(FieldPath.documentId, whereIn: sublist)
          .get();
      for (final doc in snapshot.docs) {
        results[doc.id] = UsersModel.fromJson(doc.data());
      }
    }
    return results;
  }

  Future<Map<String, GroupsModel>> _fetchGroupsInBatches(
      List<String> ids) async {
    if (ids.isEmpty) return {};
    final Map<String, GroupsModel> results = {};
    for (var i = 0; i < ids.length; i += 30) {
      final sublist = ids.sublist(i, i + 30 > ids.length ? ids.length : i + 30);
      final snapshot = await firebaseService.database
          .collection('groups')
          .where(FieldPath.documentId, whereIn: sublist)
          .get();
      for (final doc in snapshot.docs) {
        results[doc.id] = GroupsModel.fromJson(doc.data());
      }
    }
    return results;
  }

  String getChatRoomId(String userId1, String userId2) {
    if (userId1.hashCode <= userId2.hashCode) {
      return '${userId1}_$userId2';
    } else {
      return '${userId2}_$userId1';
    }
  }

  Stream<List<MessagesModel>> getGroupMessagesStream(String groupId,
      {int limit = 20}) {
    log.i("Subscribing to group messages for groupId: $groupId");
    final query = firebaseService.database
        .collection("messages")
        .where('groupId', isEqualTo: groupId)
        .orderBy('timestamp', descending: true)
        .limit(limit);

    return query.snapshots().map((snapshot) {
      if (snapshot.docs.isNotEmpty) _lastDocument = snapshot.docs.last;
      return snapshot.docs
          .map((doc) => MessagesModel.fromJson(doc.data()))
          .toList();
    });
  }

  Stream<List<MessagesModel>> getPrivateMessagesStream(String receiverId,
      {int limit = 20}) {
    final currentUserId = firebaseService.auth.currentUser!.uid;
    final chatRoomId = getChatRoomId(currentUserId, receiverId);
    log.i("Subscribing to private messages for chatRoomId: $chatRoomId");

    final query = firebaseService.database
        .collection('messages')
        .where('chatRoomId', isEqualTo: chatRoomId)
        .orderBy('timestamp', descending: true)
        .limit(limit);

    return query.snapshots().map((snapshot) {
      if (snapshot.docs.isNotEmpty) _lastDocument = snapshot.docs.last;
      return snapshot.docs
          .map((doc) => MessagesModel.fromJson(doc.data()))
          .toList();
    });
  }

  Future<List<MessagesModel>> fetchOlderMessages({
    String? chatRoomId,
    String? groupId,
    required DocumentSnapshot lastVisible,
    required int limit,
  }) async {
    log.i(
        "Fetching older messages for ${groupId != null ? 'group $groupId' : 'chat $chatRoomId'}");
    Query query;
    if (groupId != null) {
      query = firebaseService.database
          .collection('messages')
          .where('groupId', isEqualTo: groupId)
          .orderBy('timestamp', descending: true);
    } else if (chatRoomId != null) {
      query = firebaseService.database
          .collection('messages')
          .where('chatRoomId', isEqualTo: chatRoomId)
          .orderBy('timestamp', descending: true);
    } else {
      return [];
    }

    final snapshot =
        await query.startAfterDocument(lastVisible).limit(limit).get();
    log.i("Fetched ${snapshot.docs.length} older messages.");
    return snapshot.docs
        .map(
            (doc) => MessagesModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> _updateMessengerEntries(
      String senderId, String receiverId) async {
    final now = DateTime.now();

    final senderMessengerEntry = MessengerModel(
      id: receiverId, // The ID points to the other user
      userId: receiverId,
      lastseen: now,
    );

    final receiverMessengerEntry = MessengerModel(
      id: senderId, // The ID points to the sender
      userId: senderId,
      lastseen: now,
    );

    final senderDocRef = firebaseService.database
        .collection('users')
        .doc(senderId)
        .collection('messenger')
        .doc(receiverId);

    final receiverDocRef = firebaseService.database
        .collection('users')
        .doc(receiverId)
        .collection('messenger')
        .doc(senderId);

    await firebaseService.database.runTransaction((transaction) async {
      transaction.set(senderDocRef, senderMessengerEntry.toJson());
      transaction.set(receiverDocRef, receiverMessengerEntry.toJson());
    });

    log.i(
        "Created/updated messenger entries for both sender ($senderId) and receiver ($receiverId).");
  }

  Future<MessagesModel> sendPrivateMessage({
    required String receiverId,
    required String senderId,
    required String content,
    required MessageType type,
    ReplyReference? replyTo,
    String? attachmentUrl,
    String? attachmentFileName,
    int? attachmentFileSize,
  }) async {
    final chatRoomId = getChatRoomId(senderId, receiverId);
    final message = MessagesModel(
      id: const Uuid().v1(),
      chatRoomId: chatRoomId,
      receiverId: receiverId,
      senderId: senderId,
      content: content,
      type: type,
      timestamp: DateTime.now(),
      attachments: attachmentUrl != null ? [attachmentUrl] : [],
      attachmentFileName: attachmentFileName,
      attachmentFileSize: attachmentFileSize,
      replyTo: replyTo,
    );

    await firebaseService.database.runTransaction((transaction) async {
      final messageRef =
          firebaseService.database.collection('messages').doc(message.id);
      transaction.set(messageRef, message.toJson());

      // Update sender's inbox
      final senderMessengerRef = firebaseService.database
          .collection('users')
          .doc(senderId)
          .collection('messenger')
          .doc(receiverId);
      transaction.set(
          senderMessengerRef,
          MessengerModel(
                  id: receiverId,
                  userId: receiverId,
                  lastseen: message.timestamp)
              .toJson());

      // Update receiver's inbox
      final receiverMessengerRef = firebaseService.database
          .collection('users')
          .doc(receiverId)
          .collection('messenger')
          .doc(senderId);
      transaction.set(
          receiverMessengerRef,
          MessengerModel(
                  id: senderId, userId: senderId, lastseen: message.timestamp)
              .toJson());
    });

    log.i(
        "Private message sent and messenger entries updated via transaction.");
    return message;
  }

  Future<MessagesModel> sendGroupMessage({
    required String groupId,
    required String senderId,
    required String content,
    required MessageType type,
    ReplyReference? replyTo,
    String? attachmentUrl,
    String? attachmentFileName,
    int? attachmentFileSize,
  }) async {
    final message = MessagesModel(
      id: const Uuid().v1(),
      groupId: groupId,
      senderId: senderId,
      content: content,
      type: type,
      timestamp: DateTime.now(),
      attachments: attachmentUrl != null ? [attachmentUrl] : [],
      attachmentFileName: attachmentFileName,
      attachmentFileSize: attachmentFileSize,
      replyTo: replyTo,
    );

    //TODO: transaction here to update the group's `lastMessage` timestamp
    await firebaseService.database
        .collection('messages')
        .doc(message.id)
        .set(message.toJson());
    log.i("Group message sent: ${message.id}");
    return message;
  }

  void resetPagination() {
    _lastDocument = null;
  }
}
