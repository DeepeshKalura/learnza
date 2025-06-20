import 'dart:async';
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnza/interface/messenger_interface.dart';
import 'package:learnza/model/groups/groups_model.dart';
import 'package:learnza/model/messenger/messenger_model.dart';
import 'package:learnza/model/users/users_model.dart';
import 'package:uuid/uuid.dart';

import '../../model/app_enums.dart';
import '../../model/message/messages_model.dart';
import '../../service/firebase_service.dart';

class MessageProvider {
  final FirebaseService firebaseService;
  DocumentSnapshot? _lastDocument;

  MessageProvider({required this.firebaseService});

  // --- LOGIC MOVED FROM DELETED PROVIDER ---
  Future<List<MessengerInterface>> getChatList() async {
    final uid = firebaseService.auth.currentUser?.uid;
    if (uid == null) return [];

    final messengerSnap = await firebaseService.database
        .collection("users")
        .doc(uid)
        .collection("messenger")
        .orderBy("lastseen", descending: true)
        .get();

    return Future.wait(
      messengerSnap.docs.map(
        (data) async => await _buildInterfaceFromMessengerModel(
            MessengerModel.fromJson(data.data())),
      ),
    );
  }

  Future<MessengerInterface> _buildInterfaceFromMessengerModel(
      MessengerModel message) async {
    if (message.groupId != null) {
      final groupDoc = await firebaseService.database
          .collection("groups")
          .doc(message.groupId)
          .get();
      if (!groupDoc.exists) {
        throw Exception("Group not found for ID: ${message.groupId}");
      }
      return MessengerInterface(GroupsModel.fromJson(groupDoc.data()!));
    } else {
      final userDoc = await firebaseService.database
          .collection("users")
          .doc(message.userId)
          .get();
      if (!userDoc.exists) {
        throw Exception("User not found for ID: ${message.userId}");
      }
      return MessengerInterface(UsersModel.fromJson(userDoc.data()!));
    }
  }
  // --- END OF MOVED LOGIC ---

  String getChatRoomId(String userId1, String userId2) {
    if (userId1.hashCode <= userId2.hashCode) {
      return '${userId1}_$userId2';
    } else {
      return '${userId2}_$userId1';
    }
  }

  Stream<List<MessagesModel>> getGroupMessagesStream(String groupId,
      {int limit = 20}) {
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

  // ChatMessanger Also wanted to maintin the last documentation thanks

  Future<List<MessagesModel>> fetchOlderMessages({
    String? chatRoomId,
    String? groupId,
    required DocumentSnapshot lastVisible,
    required int limit,
  }) async {
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
    return snapshot.docs
        .map(
            (doc) => MessagesModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> _createAndSendMessage(MessagesModel message) async {
    try {
      await firebaseService.database
          .collection('messages')
          .doc(message.id)
          .set(message.toJson());
    } catch (e) {
      developer.log('Error sending message: $e');
      rethrow;
    }
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
    );
    await _createAndSendMessage(message);
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
    );
    await _createAndSendMessage(message);
    return message;
  }

  void resetPagination() {
    _lastDocument = null;
  }
}
