import 'package:flutter/material.dart';

import '../../../model/app_enums.dart';
import '../../../model/message/messages_model.dart';

class MessageBubbleGroupWidget extends StatelessWidget {
  final MessagesModel message;
  final bool isCurrentUser;

  const MessageBubbleGroupWidget({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.blueAccent[200] : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isCurrentUser ? const Radius.circular(12) : Radius.zero,
            bottomRight:
                isCurrentUser ? Radius.zero : const Radius.circular(12),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Reply reference if exists
            if (message.replyTo != null)
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  message.replyTo!.content,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

            // Main message content
            Text(
              message.content,
              style: TextStyle(
                color: isCurrentUser ? Colors.black87 : Colors.black87,
                fontSize: 16,
              ),
            ),

            // Timestamp and status
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatTimestamp(message.timestamp),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                buildMessageStatusIcon(message.status),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to format timestamp
  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}';
  }

  //? Helper method to show message status icon based on the status
  Widget buildMessageStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return const Icon(Icons.check, color: Colors.grey, size: 16);
      case MessageStatus.delivered:
        return const Icon(Icons.done_all, color: Colors.grey, size: 16);
      case MessageStatus.read:
        return const Icon(Icons.done_all, color: Colors.blue, size: 16);
      default:
        return const SizedBox.shrink();
    }
  }
}
