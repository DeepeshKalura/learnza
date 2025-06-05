import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import '../../../model/message/messages_model.dart';
import '../../../providers/message_provider.dart';
import '../../../service/file_service.dart';
import '../../../service/errors/file_service_errors.dart';
import '../../../locator/service_locator.dart';
import '../../../model/app_enums.dart';
import 'package:mime/mime.dart';

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
  File? _selectedFile;

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
            if (_selectedFile != null) _buildSelectedFileBanner(),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: _pickAttachment,
                ),
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

  Widget _buildSelectedFileBanner() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'File: ${_selectedFile!.path.split('/').last}', // Show file name
              style: const TextStyle(fontStyle: FontStyle.italic),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              setState(() {
                _selectedFile = null;
              });
            },
            tooltip: 'Clear selected file',
          ),
        ],
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
    if (text.isEmpty && _selectedFile == null) return; // Nothing to send

    setState(() {
      _isSending = true;
    });

    final messageProvider = Provider.of<MessageProvider>(context, listen: false);
    final fileService = sl<FileService>(); // Get FileService instance

    try {
      String? attachmentUrl;
      String? attachmentFileName;
      MessageType? attachmentType;

      if (_selectedFile != null) {
        try {
          // Determine attachment type from MIME
          attachmentFileName = _selectedFile!.path.split('/').last;
          final mime = lookupMimeType(_selectedFile!.path);
          if (mime != null) {
            if (mime.startsWith('image/')) attachmentType = MessageType.image;
            else if (mime.startsWith('video/')) attachmentType = MessageType.video;
            else if (mime.startsWith('audio/')) attachmentType = MessageType.audio;
            else attachmentType = MessageType.document; // Default for others
          } else {
            attachmentType = MessageType.document; // Fallback
          }

          // Use receiverId for basePath for now, consider group chats later
          String basePath = 'chat_attachments/${widget.receiverId}';
          attachmentUrl = await fileService.uploadFile(_selectedFile!, basePath);

        } on FileSizeLimitExceededException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message), backgroundColor: Colors.red),
          );
          setState(() { _isSending = false; }); // Reset sending state
          return; // Stop sending
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('File upload failed: ${e.toString()}'), backgroundColor: Colors.red),
          );
          setState(() { _isSending = false; }); // Reset sending state
          return; // Stop sending
        }
      }

      await messageProvider.sendMessage(
        receiverId: widget.receiverId,
        senderId: widget.currentUserId,
        content: text, // Text can be a caption or empty
        replyTo: widget.replyTo,
        attachmentUrl: attachmentUrl,
        attachmentFileName: attachmentFileName,
        attachmentMessageType: attachmentType,
        // If only file is sent, type might be overridden by attachmentType in provider
        type: (attachmentUrl != null && text.isEmpty) ? (attachmentType ?? MessageType.document) : MessageType.text,
      );

      _messageController.clear();
      if (_selectedFile != null) {
        setState(() {
          _selectedFile = null;
        });
      }
      if (widget.replyTo != null && widget.onCancelReply != null) {
        widget.onCancelReply!();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send message: ${e.toString()}'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() {
        _isSending = false;
        _isComposing = _messageController.text.trim().isNotEmpty;
      });
    }
  }

  Future<void> _pickAttachment() async {
    // Close the bottom sheet first if it's open due to previous logic
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Allow any file type for now
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
      // For now, just print the selected file path.
      // Actual upload and message sending will be handled in later steps.
      debugPrint('Selected file: ${_selectedFile!.path}');

      // Show a temporary indication that a file is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected file: ${result.files.single.name}'),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      // User canceled the picker
      debugPrint('No file selected.');
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
