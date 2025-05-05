import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/message/messages_model.dart';
import '../../../providers/message_provider.dart';

class InputMessageWidget extends StatefulWidget {
  final String receiverId;
  final String currentUserId;
  final ReplyReference? replyTo;
  final Function()? onCancelReply;

  const InputMessageWidget({
    super.key,
    required this.receiverId,
    required this.currentUserId,
    this.replyTo,
    this.onCancelReply,
  });

  @override
  InputMessageWidgetState createState() => InputMessageWidgetState();
}

class InputMessageWidgetState extends State<InputMessageWidget> {
  final TextEditingController _messageController = TextEditingController();
  bool _isComposing = false;
  bool _isSending = false;

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
                // IconButton(
                //   icon: const Icon(Icons.attach_fnnnile, color: Colors.grey),
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
                  onTap: (_isComposing && !_isSending) ? _sendMessage : null,
                  child: CircleAvatar(
                    child: _isSending
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.send),
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
    final replyContent = widget.replyTo?.content ?? '';
    // Limit displayed reply content length
    final displayContent = replyContent.length > 50
        ? '${replyContent.substring(0, 47)}...'
        : replyContent;

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
              'Replying to: $displayContent',
              style: const TextStyle(fontStyle: FontStyle.italic),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: widget.onCancelReply,
            tooltip: 'Cancel reply',
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    try {
      setState(() {
        _isSending = true;
      });

      final messageProvider =
          Provider.of<MessageProvider>(context, listen: false);

      await messageProvider.sendMessage(
        receiverId: widget.receiverId,
        senderId: widget.currentUserId,
        content: text,
        replyTo: widget.replyTo,
      );

      // Clear input and reset state
      _messageController.clear();

      // If there was a reply, cancel it after sending
      if (widget.replyTo != null && widget.onCancelReply != null) {
        widget.onCancelReply!();
      }
    } catch (e) {
      // Show error using a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send message: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
        _isComposing = false;
      });
    }
  }

  void _pickAttachment() {
    // Implement file/image attachment logic
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Photo'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement photo picker
                debugPrint('Photo picker not implemented');
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_present),
              title: const Text('File'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement file picker
                debugPrint('File picker not implemented');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
