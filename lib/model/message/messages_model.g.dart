// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    _MessagesModel(
      id: json['id'] as String,
      groupId: json['groupId'] as String?,
      receiverId: json['receiverId'] as String?,
      senderId: json['senderId'] as String,
      content: json['content'] as String,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']) ??
          MessageType.text,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sent,
      readBy: (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      deliveredTo: (json['deliveredTo'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      replyTo: json['replyTo'] == null
          ? null
          : ReplyReference.fromJson(json['replyTo'] as Map<String, dynamic>),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      attachmentFileName: json['attachmentFileName'] as String?,
      attachmentFileSize: (json['attachmentFileSize'] as num?)?.toInt(),
      chatRoomId: json['chatRoomId'] as String?,
    );

Map<String, dynamic> _$MessagesModelToJson(_MessagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'content': instance.content,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': _$MessageStatusEnumMap[instance.status]!,
      'readBy': instance.readBy,
      'deliveredTo': instance.deliveredTo,
      'replyTo': instance.replyTo,
      'attachments': instance.attachments,
      'attachmentFileName': instance.attachmentFileName,
      'attachmentFileSize': instance.attachmentFileSize,
      'chatRoomId': instance.chatRoomId,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.document: 'document',
  MessageType.location: 'location',
  MessageType.unknown: 'unknown',
};

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
};

_ReplyReference _$ReplyReferenceFromJson(Map<String, dynamic> json) =>
    _ReplyReference(
      messageId: json['messageId'] as String,
      content: json['content'] as String,
      senderId: json['senderId'] as String,
    );

Map<String, dynamic> _$ReplyReferenceToJson(_ReplyReference instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'content': instance.content,
      'senderId': instance.senderId,
    };
