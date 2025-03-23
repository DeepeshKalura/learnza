import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../model/message/messages_model.dart';
import '../../model/users/users_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/message_provider.dart';
import '../../utils/resource_util.dart';
import 'widget/input_message_widget.dart';
import 'widget/message_bubble_group_widget.dart';

class UserMessageScreen extends StatefulWidget {
  const UserMessageScreen({super.key, required this.user});

  final UsersModel user;

  @override
  UserMessageScreenState createState() => UserMessageScreenState();
}

class UserMessageScreenState extends State<UserMessageScreen> {
  // ReplyReference? _currentReply;

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
        tooltip: 'Back to Conversations',
        onPressed: () => context.pop(),
      ),
      title: GestureDetector(
        onTap: () {
          // context.pushNamed(
          //   AppUrls.userProfileScreen,
          //   extra: {'user': widget.user},
          // );
        },
        child: Hero(
          tag: widget.user.uid,
          child: Row(
            children: [
              ShadAvatar(
                widget.user.profileImageURL ?? ResourceUtil.defaultProfileImage,
                placeholder: Text(
                  widget.user.fullName.substring(0, 1),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color:
                              widget.user.isOnline ? Colors.green : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.user.isOnline
                            ? "Online"
                            : (widget.user.lastseen != null
                                ? "Last seen ${widget.user.lastseen}"
                                : "Offline"),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
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
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final currentUserId = authProvider.user?.uid ?? '';
        final bool isBlocked = widget.user.blockedUsers.contains(currentUserId);

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
                  //   extra: {'user': widget.user},
                  // );
                },
              ),
              ListTile(
                leading: Icon(isBlocked ? Icons.person_add : Icons.block),
                title: Text(isBlocked ? 'Unblock User' : 'Block User'),
                onTap: () {
                  // Implement block/unblock functionality
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Clear Chat'),
                onTap: () {
                  // Implement clear chat functionality
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessagesList() {
    final currentUserId = Provider.of<AuthProvider>(context).user?.uid ?? '';

    return StreamBuilder<List<MessagesModel>>(
      stream: context.read<MessageProvider>().getStreamMessageForUser(
          userId: currentUserId, receiverId: widget.user.uid),
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
    final currentUserId = Provider.of<AuthProvider>(context).user?.uid ?? '';
    final bool isBlocked = widget.user.blockedUsers.contains(currentUserId);

    if (isBlocked) {
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
      receiverId: widget.user.uid,
      currentUserId: currentUserId,
      // isDirectMessage: true,
      // replyTo: _currentReply,
    );
  }
}
