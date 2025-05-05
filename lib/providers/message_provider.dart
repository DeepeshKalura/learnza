import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/app_enums.dart';
import '../model/message/messages_model.dart';
import '../service/firebase_service.dart';

class MessageProvider extends ChangeNotifier {
  final FirebaseService firebaseService;

  MessageProvider({required this.firebaseService});

  Stream<List<MessagesModel>> getStreamMessageForGroups(String receiverId) {
    try {
      final userId = firebaseService.auth.currentUser?.uid;

      if (userId == null) {
        throw Exception("userId cannnot be null");
      }

      final sentStream = firebaseService.database
          .collection("messages")
          .where('senderId', isEqualTo: userId)
          .where('receiverId', isEqualTo: receiverId)
          .snapshots();

      final receivedStream = firebaseService.database
          .collection("messages")
          .where('senderId', isEqualTo: receiverId)
          .where('receiverId', isEqualTo: userId)
          .snapshots();

      return sentStream.asyncMap((sentSnapshot) async {
        final receivedSnapshot = await receivedStream.first;

        final allDocs = [...sentSnapshot.docs, ...receivedSnapshot.docs];
        allDocs.sort((a, b) => (b['timestamp'] as Timestamp)
            .compareTo(a['timestamp'] as Timestamp));

        return allDocs
            .map((doc) => MessagesModel.fromJson(doc.data()))
            .toList();
      });
    } catch (e) {
      developer.log("The world is fool of fake");
      rethrow;
    }
  }

  Stream<List<MessagesModel>> getStreamMessageForUser({String? receiverId}) {
    try {
      final userId = firebaseService.auth.currentUser?.uid;

      if (userId == null) {
        throw Exception("userId cannnot be null");
      }

      final sentStream = firebaseService.database
          .collection("messages")
          .where('senderId', isEqualTo: userId)
          .where('receiverId', isEqualTo: receiverId)
          .snapshots();

      final receivedStream = firebaseService.database
          .collection("messages")
          .where('senderId', isEqualTo: receiverId)
          .where('receiverId', isEqualTo: userId)
          .snapshots();

      return sentStream.asyncMap((sentSnapshot) async {
        final receivedSnapshot = await receivedStream.first;

        final allDocs = [...sentSnapshot.docs, ...receivedSnapshot.docs];
        allDocs.sort((a, b) => (b['timestamp'] as Timestamp)
            .compareTo(a['timestamp'] as Timestamp));

        return allDocs
            .map((doc) => MessagesModel.fromJson(doc.data()))
            .toList();
      });
    } catch (e) {
      developer.log("The world is fool of fake");
      rethrow;
    }
  }

  Future<void> sendMessage({
    required String receiverId,
    required String senderId,
    required String content,
    MessageType type = MessageType.text,
    ReplyReference? replyTo,
  }) async {
    final message = MessagesModel(
      id: const Uuid().v1(),
      receiverId: receiverId,
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
