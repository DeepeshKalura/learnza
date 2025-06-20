import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learnza/providers/auth_provider.dart';
import 'package:learnza/providers/state/messanger/chat_state_provider.dart';
import 'package:learnza/service/errors/file_service_errors.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/message/messages_model.dart';

class AttachmentPreviewScreen extends StatefulWidget {
  final File file;
  final ReplyReference? replyTo;

  const AttachmentPreviewScreen({
    super.key,
    required this.file,
    this.replyTo,
  });

  @override
  State<AttachmentPreviewScreen> createState() =>
      _AttachmentPreviewScreenState();
}

class _AttachmentPreviewScreenState extends State<AttachmentPreviewScreen> {
  final TextEditingController _captionController = TextEditingController();
  bool _isSending = false;

  Future<void> _handleSend() async {
    if (_isSending) return;

    setState(() {
      _isSending = true;
    });

    try {
      // Access providers needed for the operation
      final chatProvider = context.read<ChatStateProvider>();
      final authProvider = context.read<AuthProvider>();

      // Get the current user's ID safely.
      final senderId = authProvider.user?.uid;
      if (senderId == null) {
        throw Exception("User is not logged in.");
      }

      // Call the sendMessage method on the ChatStateProvider
      await chatProvider.sendMessage(
        senderId: senderId,
        content: _captionController.text.trim(),
        file: widget.file,
        replyTo: widget.replyTo,
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    } on FileSizeLimitExceededException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send file: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPreview(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ShadInput(
                      controller: _captionController,
                      placeholder: const Text('Add a caption...'),
                      decoration: const ShadDecoration(
                        border: ShadBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _handleSend,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: _isSending
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
    final mimeType = lookupMimeType(widget.file.path);
    if (mimeType != null && mimeType.startsWith('image/')) {
      return Image.file(widget.file, fit: BoxFit.contain);
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.insert_drive_file, size: 100, color: Colors.white70),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.file.path.split('/').last,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
