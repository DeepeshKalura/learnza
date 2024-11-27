import '../app_enums.dart';

class NotificationModel {
  final String id;
  final String recipientId;
  final NotificationType type;
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final String? relatedEntityId;

  NotificationModel({
    required this.id,
    required this.recipientId,
    required this.type,
    required this.content,
    required this.timestamp,
    this.isRead = false,
    this.relatedEntityId,
  });
}
