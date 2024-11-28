import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/app_enums.dart';
import '../model/message/messages_model.dart';
import '../service/firebase_service.dart';

class MessageProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  MessageProvider({required this.firebaseService});

  Stream<List<MessagesModel>> getStreamMessageForGroups(String groupId) {
    return firebaseService.database
        .collection('messages')
        .where('groupId', isEqualTo: groupId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => MessagesModel.fromJson(
                doc.data(),
              ),
            )
            .toList());
  }

  Future<void> sendMessage({
    required String groupId,
    required String senderId,
    required String content,
    MessageType type = MessageType.text,
    ReplyReference? replyTo,
  }) async {
    final message = MessagesModel(
      id: const Uuid().v1(),
      groupId: groupId,
      senderId: senderId,
      content: content,
      type: type,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
      replyTo: replyTo,
    );

    try {
      // Save message to Firestore
      await firebaseService.database
          .collection('messages')
          .add(message.toJson());
      notifyListeners();
    } catch (e) {
      // Handle error - you might want to show a snackbar or log the error
      debugPrint('Error sending message: $e');
    }
  }

  // Method to mark message as read
  Future<void> markMessageAsRead(String messageId, String userId) async {
    try {
      await firebaseService.database
          .collection('messages')
          .doc(messageId)
          .update({
        'readBy': FieldValue.arrayUnion([userId])
      });
    } catch (e) {
      debugPrint('Error marking message as read: $e');
    }
  }
}
