import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../interface/messenger_interface.dart';
import '../../providers/auth_provider.dart';
import '../../providers/state/messanger/chat_state_provider.dart';
import '../../router/app_urls.dart';
import '../../utils/image_utils.dart';
import '../../utils/resource_util.dart';
import 'widget/input_message_widget.dart';
import 'widget/message_bubble_group_widget.dart';

class ConsumerMessengerScreen extends StatelessWidget {
  const ConsumerMessengerScreen({
    super.key,
    required this.conversationId,
    required this.isGroup,
    required this.interface,
  });

  final String conversationId;
  final bool isGroup;
  final MessengerInterface interface;

  @override
  Widget build(BuildContext context) {
    // Create and provide the ChatStateProvider specifically for this chat screen.
    // It will be disposed automatically when the screen is closed.
    return ChangeNotifierProvider(
      create: (_) => ChatStateProvider(
        conversationId: conversationId,
        isGroupChat: isGroup,
      ),
      child: Scaffold(
        // Use a Consumer to get the context that has the ChatStateProvider.
        body: Consumer<ChatStateProvider>(
          builder: (context, chatProvider, _) {
            return Column(
              children: [
                _buildCustomAppBar(context),
                Expanded(
                  child: _buildMessagesList(context, chatProvider),
                ),
                _buildMessageInput(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Back',
        onPressed: () => context.pop(),
      ),
      title: GestureDetector(
        onTap: () {
          if (interface.isGroup) {
            context.pushNamed(
              AppUrls.groupDetailStudentScreen,
              extra: {'group': interface.source},
            );
          } else {
            context.pushNamed(
              AppUrls.userProfileScreen,
              extra: {'user': interface.source},
            );
          }
        },
        child: Hero(
          tag: interface.heroTag,
          child: Row(
            children: [
              CircleAvatar(
                child: ImageUtils.load(
                  urlOrAsset: interface.imageUrl,
                  defaultAsset: ResourceUtil.defaultProfileImage,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      interface.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (!interface.isGroup) ...[
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: interface.isOnline
                                  ? Colors.green
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            interface.isOnline
                                ? "Online"
                                : (interface.lastSeen != null
                                    ? "Last seen ${interface.lastSeen}"
                                    : "Offline"),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ] else ...[
                      const SizedBox(height: 3),
                      Text(
                        "Tap for group info",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (!interface.isGroup)
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
    if (interface.isGroup) return;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final currentUserId = authProvider.user?.uid ?? '';
        final bool isBlocked = interface.isUserBlocked(currentUserId);

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('View Profile'),
                onTap: () {
                  context.pop();
                  context.pushNamed(
                    AppUrls.userProfileScreen,
                    extra: {'user': interface.source},
                  );
                },
              ),
              ListTile(
                leading: Icon(isBlocked ? Icons.person_add : Icons.block),
                title: Text(isBlocked ? 'Unblock User' : 'Block User'),
                onTap: () {
                  // TODO: Implement block/unblock functionality
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessagesList(BuildContext context, ChatStateProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.messages.isEmpty) {
      return const Center(
        child: Text(
          'No messages yet. Start a conversation!',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      controller: provider.scrollController,
      reverse: true, // This is key for chat UIs
      itemCount: provider.messages.length + (provider.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        // If we are at the end of the list (which is the top of the chat because it's reversed)
        // and still loading more, show a spinner.
        if (index == provider.messages.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        final message = provider.messages[index];
        final currentUserId = context.read<AuthProvider>().user?.uid;
        return MessageBubbleGroupWidget(
          message: message,
          isCurrentUser: message.senderId == currentUserId,
        );
      },
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    final currentUserId = context.read<AuthProvider>().user?.uid ?? "";

    if (!interface.isGroup && interface.isUserBlocked(currentUserId)) {
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
      currentUserId: currentUserId,
      isGroup: interface.isGroup,
    );
  }
}
