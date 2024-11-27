import 'package:freezed_annotation/freezed_annotation.dart';
import '../app_enums.dart';
part 'messages_model.freezed.dart';
part 'messages_model.g.dart';

@freezed
class MessagesModel with _$MessagesModel {
  const factory MessagesModel({
    required String id,
    required String groupId,
    required String senderId,
    required String content,
    @Default(MessageType.text) MessageType type,
    required DateTime timestamp,
    @Default(MessageStatus.sent) MessageStatus status,
    @Default([]) List<String> readBy,
    @Default([]) List<String> deliveredTo,
    ReplyReference? replyTo,
    @Default([]) List<String> attachments,
  }) = _MessagesModel;

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);
}

@freezed
class ReplyReference with _$ReplyReference {
  const factory ReplyReference({
    required String messageId,
    required String content,
    required String senderId,
  }) = _ReplyReference;

  factory ReplyReference.fromJson(Map<String, dynamic> json) =>
      _$ReplyReferenceFromJson(json);
}
