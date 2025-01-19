import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/message/messages_model.dart';
import '../../../providers/message_provider.dart';

class InputMessageWidget extends StatefulWidget {
  final String groupId;
  final String currentUserId;
  final ReplyReference? replyTo;

  const InputMessageWidget({
    super.key,
    required this.groupId,
    required this.currentUserId,
    this.replyTo,
  });

  @override
  InputMessageWidgetState createState() => InputMessageWidgetState();
}

class InputMessageWidgetState extends State<InputMessageWidget> {
  final TextEditingController _messageController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.replyTo != null) _buildReplyBanner(),
            Row(
              children: [
                // TODO: Implement attachment picker
                // IconButton(
                //   icon: const Icon(Icons.attach_file, color: Colors.grey),
                //   onPressed: _pickAttachment,
                // ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        setState(() {
                          _isComposing = text.trim().isNotEmpty;
                        });
                      },
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ),

                // Send button
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: _isComposing ? _sendMessage : null,
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.send,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyBanner() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Replying to: ${widget.replyTo!.content}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              // Cancel reply logic
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final messageProvider =
        Provider.of<MessageProvider>(context, listen: false);

    messageProvider.sendMessage(
      groupId: widget.groupId,
      senderId: widget.currentUserId,
      content: _messageController.text.trim(),
      replyTo: widget.replyTo,
    );

    // Clear input and reset state
    _messageController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  void _pickAttachment() {
    // TODO: Implement file/image attachment logic
    debugPrint('Attachment picking not implemented');
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
