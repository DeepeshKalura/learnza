import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:mime/mime.dart';

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
    required String content, // Can be empty if only sending a file
    MessageType type = MessageType.text, // Default to text
    ReplyReference? replyTo,
    String? attachmentUrl,
    String? attachmentFileName, // For display or metadata
    MessageType? attachmentMessageType, // Explicitly pass the type for the attachment
  }) async {
    final messageId = const Uuid().v1();
    List<String> attachments = [];
    MessageType finalMessageType = type;

    if (attachmentUrl != null && attachmentUrl.isNotEmpty) {
      attachments.add(attachmentUrl); // MessagesModel expects List<String> for attachments
      if (attachmentMessageType != null) {
        finalMessageType = attachmentMessageType;
      } else if (attachmentFileName != null) {
        // Try to infer from file name if not explicitly provided
        final mimeType = lookupMimeType(attachmentFileName);
        if (mimeType != null) {
          if (mimeType.startsWith('image/')) {
            finalMessageType = MessageType.image;
          } else if (mimeType.startsWith('video/')) {
            finalMessageType = MessageType.video;
          } else if (mimeType.startsWith('audio/')) {
            finalMessageType = MessageType.audio;
          } else if (mimeType.startsWith('application/pdf') || mimeType.startsWith('text/plain') || mimeType.contains('document')) {
            finalMessageType = MessageType.document;
          } else {
            finalMessageType = MessageType.document; // Default for other files
          }
        } else {
          finalMessageType = MessageType.document; // Default if MIME can't be determined
        }
      }
    }

    final message = MessagesModel(
      id: messageId,
      receiverId: receiverId,
      senderId: senderId,
      content: content, // This can be a caption for the file
      type: finalMessageType,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
      replyTo: replyTo,
      attachments: attachments,
    );

    try {
      await firebaseService.database
          .collection('messages')
          .doc(messageId) // Use the generated messageId as doc ID for consistency
          .set(message.toJson());
      notifyListeners();
    } catch (e) {
      debugPrint('Error sending message: $e');
      rethrow; // Rethrow to allow UI to handle it
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
