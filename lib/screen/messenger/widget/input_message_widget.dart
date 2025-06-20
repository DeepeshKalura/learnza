import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnza/providers/state/messanger/chat_state_provider.dart';
import 'package:learnza/screen/messenger/widget/attachment_preview_screen.dart';
import 'package:provider/provider.dart';

import '../../../model/message/messages_model.dart';

class InputMessageWidget extends StatefulWidget {
  final String currentUserId;
  final bool isGroup;

  const InputMessageWidget({
    super.key,
    required this.currentUserId,
    required this.isGroup,
  });

  @override
  InputMessageWidgetState createState() => InputMessageWidgetState();
}

class InputMessageWidgetState extends State<InputMessageWidget> {
  final TextEditingController _messageController = TextEditingController();
  bool _isComposing = false;
  bool _isSending = false;
  ReplyReference? _currentReply;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _onCancelReply() {
    setState(() {
      _currentReply = null;
    });
  }

  void _navigateToPreview(BuildContext context, File file) {
    final chatProvider = context.read<ChatStateProvider>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 1.0,
        minChildSize: 0.5,
        maxChildSize: 1.0,
        builder: (_, scrollController) {
          return ChangeNotifierProvider.value(
            value: chatProvider,
            child: AttachmentPreviewScreen(
              file: file,
              replyTo: _currentReply,
            ),
          );
        },
      ),
    ).then((_) => _onCancelReply());
  }

  Future<void> _sendTextMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _isSending) return;

    setState(() {
      _isSending = true;
    });

    try {
      final chatProvider = context.read<ChatStateProvider>();

      await chatProvider.sendMessage(
        senderId: widget.currentUserId,
        content: text,
        replyTo: _currentReply,
      );

      _messageController.clear();
      _onCancelReply();
      setState(() {
        _isComposing = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send message: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
          _isComposing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[300]!)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_currentReply != null) _buildReplyBanner(),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: _showAttachmentOptions,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        setState(() => _isComposing = text.trim().isNotEmpty);
                      },
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap:
                      (_isComposing && !_isSending) ? _sendTextMessage : null,
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

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickMediaFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file),
                title: const Text('Document'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickDocument();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickMediaFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null && mounted) {
      _navigateToPreview(context, File(pickedFile.path));
    }
  }

  Future<void> _pickFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null && mounted) {
      _navigateToPreview(context, File(pickedFile.path));
    }
  }

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null && mounted) {
      _navigateToPreview(context, File(result.files.single.path!));
    }
  }

  Widget _buildReplyBanner() {
    final replyContent = _currentReply?.content ?? '';
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
            onPressed: _onCancelReply,
            tooltip: 'Cancel reply',
          ),
        ],
      ),
    );
  }
}
