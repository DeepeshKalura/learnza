import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final bool isMediaMessage =
        message.type == MessageType.image || message.type == MessageType.video;
    final hasTextContent = message.content.isNotEmpty;

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.blueAccent[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.replyTo != null) _buildReplyBanner(message.replyTo!),
            if (isMediaMessage)
              ClipRRect(
                borderRadius: hasTextContent
                    ? const BorderRadius.vertical(top: Radius.circular(9))
                    : BorderRadius.circular(9),
                child: _buildMediaContent(),
              ),
            if (message.type == MessageType.document) _buildDocumentContent(),
            if (hasTextContent)
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                child: Text(
                  message.content,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 2, bottom: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _formatTimestamp(message.timestamp),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (isCurrentUser) buildMessageStatusIcon(message.status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaContent() {
    if (message.attachments.isEmpty) return const SizedBox.shrink();
    return CachedNetworkImage(
      imageUrl: message.attachments.first,
      placeholder: (context, url) => Container(
        height: 200,
        color: Colors.grey.shade200,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        height: 200,
        color: Colors.grey.shade200,
        child: const Icon(Icons.error),
      ),
    );
  }

  Widget _buildDocumentContent() {
    final fileName = message.attachmentFileName ?? 'File';
    final fileSize = message.attachmentFileSize != null
        ? '${(message.attachmentFileSize! / 1024).toStringAsFixed(1)} KB'
        : '';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.insert_drive_file, color: Colors.blueGrey[700]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  fileSize,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.download_for_offline_outlined,
                color: Colors.blueGrey[800]),
            onPressed: () async {
              if (message.attachments.isNotEmpty) {
                final url = Uri.parse(message.attachments.first);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildReplyBanner(ReplyReference reply) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reply.senderId, // You might want to resolve this to a name
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 2),
          Text(
            reply.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  Widget buildMessageStatusIcon(MessageStatus status) {
    IconData iconData;
    Color color;
    switch (status) {
      case MessageStatus.sending:
        iconData = Icons.access_time;
        color = Colors.grey;
        break;
      case MessageStatus.sent:
        iconData = Icons.check;
        color = Colors.grey;
        break;
      case MessageStatus.delivered:
        iconData = Icons.done_all;
        color = Colors.grey;
        break;
      case MessageStatus.read:
        iconData = Icons.done_all;
        color = Colors.blue;
        break;
    }
    return Icon(iconData, color: color, size: 16);
  }
}
