import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:learnza/model/app_enums.dart';
import 'package:learnza/model/message/messages_model.dart';
import 'package:learnza/service/errors/file_service_errors.dart';
import 'package:learnza/service/file_service.dart';
import 'package:mime/mime.dart';

import '../../../utils/logger.dart';
import '../../model/message_provider.dart';

class ChatStateProvider extends ChangeNotifier {
  final String conversationId;
  final bool isGroupChat;

  final MessageProvider _messageProvider = di.injector<MessageProvider>();
  final FileService _fileService = di.injector<FileService>();

  late final StreamSubscription<List<MessagesModel>> _messageSubscription;
  final ScrollController scrollController = ScrollController();

  List<MessagesModel> _messages = [];
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMoreMessages = true;
  DocumentSnapshot? _lastDocument;

  List<MessagesModel> get messages => _messages;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;

  ChatStateProvider({required this.conversationId, required this.isGroupChat}) {
    _fetchInitialMessages();
    scrollController.addListener(_scrollListener);
  }

  void _fetchInitialMessages() {
    _messageProvider.resetPagination();
    final stream = isGroupChat
        ? _messageProvider.getGroupMessagesStream(conversationId)
        : _messageProvider.getPrivateMessagesStream(conversationId);

    _messageSubscription = stream.listen((newMessages) async {
      // Make this async
      _messages = _mergeMessages(_messages, newMessages);

      // --- START OF FIX ---
      // We no longer need to manually set the _lastDocument here.
      // The pagination logic in _fetchMoreMessages will handle it correctly.
      // This removes the line that was causing the crash.
      // --- END OF FIX ---

      if (_isLoading) {
        _isLoading = false;
      }
      notifyListeners();
    }, onError: (error, stackTrace) {
      _isLoading = false;
      log.e("Error in chat stream", error: error, stackTrace: stackTrace);
      notifyListeners();
    });
  }

  List<MessagesModel> _mergeMessages(
      List<MessagesModel> oldMessages, List<MessagesModel> newMessages) {
    var messageMap = <String, MessagesModel>{};
    for (var msg in oldMessages) {
      messageMap[msg.id] = msg;
    }
    for (var msg in newMessages) {
      messageMap[msg.id] = msg;
    }
    var mergedList = messageMap.values.toList();
    mergedList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return mergedList;
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasMoreMessages) {
      _fetchMoreMessages();
    }
  }

  Future<void> _fetchMoreMessages() async {
    if (_isLoadingMore || !_hasMoreMessages || _messages.isEmpty) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      // --- START OF FIX 2 ---
      // Get the actual DocumentSnapshot of the last message we currently have.
      // This is the correct way to get the cursor for pagination.
      final lastMessageId = _messages.last.id;
      final lastDocSnapshot = await _messageProvider.firebaseService.database
          .collection('messages')
          .doc(lastMessageId)
          .get();

      if (!lastDocSnapshot.exists) {
        log.w("Last document for pagination does not exist. Stopping.");
        _hasMoreMessages = false;
        _isLoadingMore = false;
        notifyListeners();
        return;
      }
      _lastDocument = lastDocSnapshot;
      // --- END OF FIX 2 ---

      final chatRoomId = isGroupChat
          ? null
          : _messageProvider.getChatRoomId(
              _messageProvider.firebaseService.auth.currentUser!.uid,
              conversationId,
            );

      final olderMessages = await _messageProvider.fetchOlderMessages(
        groupId: isGroupChat ? conversationId : null,
        chatRoomId: chatRoomId,
        lastVisible: _lastDocument!, // We now have a valid snapshot
        limit: 20,
      );

      if (olderMessages.isEmpty) {
        _hasMoreMessages = false;
      } else {
        _messages.addAll(olderMessages);
      }
    } catch (e, s) {
      log.e("Error fetching older messages", error: e, stackTrace: s);
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> sendMessage({
    required String senderId,
    required String content,
    File? file,
    ReplyReference? replyTo,
  }) async {
    String? attachmentUrl;
    String? attachmentFileName;
    int? attachmentFileSize;
    MessageType messageType = MessageType.text;

    if (file != null) {
      try {
        String basePath = 'chat_attachments/$conversationId';
        attachmentUrl = await _fileService.uploadFile(file, basePath);
        attachmentFileName = file.path.split('/').last;
        attachmentFileSize = await file.length();
        final mimeType = lookupMimeType(file.path);

        if (mimeType != null) {
          if (mimeType.startsWith('image/')) {
            messageType = MessageType.image;
          } else if (mimeType.startsWith('video/')) {
            messageType = MessageType.video;
          } else if (mimeType.startsWith('audio/')) {
            messageType = MessageType.audio;
          } else {
            messageType = MessageType.document;
          }
        }
      } on FileSizeLimitExceededException catch (e) {
        throw FileSizeLimitExceededException(e.message);
      } catch (e) {
        rethrow;
      }
    }

    if (isGroupChat) {
      await _messageProvider.sendGroupMessage(
        groupId: conversationId,
        senderId: senderId,
        content: content,
        type: messageType,
        replyTo: replyTo,
        attachmentUrl: attachmentUrl,
        attachmentFileName: attachmentFileName,
        attachmentFileSize: attachmentFileSize,
      );
    } else {
      await _messageProvider.sendPrivateMessage(
        receiverId: conversationId,
        senderId: senderId,
        content: content,
        type: messageType,
        replyTo: replyTo,
        attachmentUrl: attachmentUrl,
        attachmentFileName: attachmentFileName,
        attachmentFileSize: attachmentFileSize,
      );
    }
  }

  @override
  void dispose() {
    _messageSubscription.cancel();
    scrollController.dispose();
    super.dispose();
  }
}
