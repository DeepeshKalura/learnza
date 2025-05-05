import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../interface/messenger_interface.dart';
import '../../model/message/messages_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/message_provider.dart';
import '../../router/app_urls.dart';
import '../../utils/image_utils.dart';
import '../../utils/resource_util.dart';
import 'widget/input_message_widget.dart';
import 'widget/message_bubble_group_widget.dart';

class ConsumerMessengerScreen extends StatefulWidget {
  const ConsumerMessengerScreen({super.key, required this.interface});

  final MessengerInterface interface;

  @override
  ConsumerMessengerScreenState createState() => ConsumerMessengerScreenState();
}

class ConsumerMessengerScreenState extends State<ConsumerMessengerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar
          _buildCustomAppBar(),

          // Messages List
          Expanded(
            child: _buildMessagesList(),
          ),

          // Message Input
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Back',
        onPressed: () => context.pop(),
      ),
      title: GestureDetector(
        onTap: () {
          if (widget.interface.isGroup) {
            context.pushNamed(
              AppUrls.groupDetailStudentScreen,
              extra: {'group': widget.interface.source},
            );
          } else {
            // Navigate to user profile when implemented
            // context.pushNamed(AppUrls.userProfileScreen, extra: {'user': widget.interface.source});
          }
        },
        child: Hero(
          tag: widget.interface.heroTag,
          child: Row(
            children: [
              CircleAvatar(
                child: ImageUtils.load(
                  urlOrAsset: widget.interface.imageUrl,
                  defaultAsset: ResourceUtil.defaultProfileImage,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.interface.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  widget.interface.isGroup
                      ? const Text(
                          "Click to view more details",
                          style: TextStyle(fontSize: 16),
                        )
                      : Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: widget.interface.isOnline
                                    ? Colors.green
                                    : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.interface.isOnline
                                  ? "Online"
                                  : (widget.interface.lastSeen != null
                                      ? "Last seen ${widget.interface.lastSeen}"
                                      : "Offline"),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (!widget.interface.isGroup)
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More options',
            onPressed: () {
              _showUserOptions(context);
            },
          ),
      ],
    );
  }

  void _showUserOptions(BuildContext context) {
    if (widget.interface.isGroup) return;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final currentUserId = authProvider.user?.uid ?? '';
        final bool isBlocked = widget.interface.isUserBlocked(currentUserId);

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('View Profile'),
                onTap: () {
                  context.pop();
                  // context.pushNamed(
                  //   AppUrls.userProfileScreen,
                  //   extra: {'user': widget.interface.source},
                  // );
                },
              ),
              ListTile(
                leading: Icon(isBlocked ? Icons.person_add : Icons.block),
                title: Text(isBlocked ? 'Unblock User' : 'Block User'),
                onTap: () {
                  // Implement block/unblock functionality
                  // Navigator.pop(context);
                  context.pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Clear Chat'),
                onTap: () {
                  // Implement clear chat functionality
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessagesList() {
    final messageProvider = context.read<MessageProvider>();

    return StreamBuilder<List<MessagesModel>>(
      stream: widget.interface.isGroup
          ? messageProvider.getStreamMessageForGroups(widget.interface.id)
          : messageProvider.getStreamMessageForUser(
              receiverId: widget.interface.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No messages yet. Start a conversation!',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          reverse: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final currentUserId = context.read<AuthProvider>().user?.uid;
            final message = snapshot.data![index];
            return MessageBubbleGroupWidget(
              message: message,
              isCurrentUser: message.senderId == currentUserId,
            );
          },
        );
      },
    );
  }

  Widget _buildMessageInput() {
    final currentUserId =
        context.read<AuthProvider>().firebaseService.auth.currentUser?.uid ??
            "";

    developer.log(widget.interface.id);
    if (!widget.interface.isGroup &&
        widget.interface.isUserBlocked(currentUserId)) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.grey[200],
        child: const Center(
          child: Text(
            "You can't send messages to this user",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return InputMessageWidget(
      receiverId: widget.interface.id,
      currentUserId: currentUserId,
    );
  }
}
