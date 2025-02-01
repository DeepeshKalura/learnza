import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../model/groups/groups_model.dart';
import '../../model/message/messages_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/message_provider.dart';
import '../../router/app_urls.dart';
import '../../utils/resource_util.dart';
import 'widget/input_message_widget.dart';
import 'widget/message_bubble_group_widget.dart';

class GroupsMessageScreen extends StatefulWidget {
  const GroupsMessageScreen({super.key, required this.groups});

  final GroupsModel groups;

  @override
  GroupsMessageScreenState createState() => GroupsMessageScreenState();
}

class GroupsMessageScreenState extends State<GroupsMessageScreen> {
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
        tooltip: 'Back Arrow',
        onPressed: () => context.pop(),
      ),
      title: GestureDetector(
        onTap: () {
          context.pushNamed(
            AppUrls.groupDetailStudentScreen,
            extra: {'group': widget.groups},
          );
        },
        child: Hero(
          tag: widget.groups.id,
          child: Row(
            children: [
              ShadAvatar(
                widget.groups.imageUrl ?? ResourceUtil.defaultProfileImage,
                placeholder: Text(
                  widget.groups.name.substring(0, 2),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.groups.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Click to view more details",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: const [
        // IconButton(
        //   icon: const Icon(LucideIcons.search),
        //   tooltip: 'Search Chat Room',
        //   onPressed: () {
        //     developer.log(
        //       "You didn't implement the editing and viewing of the group details",
        //     );
        //   },
        // ),
      ],
    );
  }

  Widget _buildMessagesList() {
    return StreamBuilder<List<MessagesModel>>(
      stream: context
          .read<MessageProvider>()
          .getStreamMessageForGroups(widget.groups.id),
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
            return
                // GestureDetector(
                // onLongPress: () {
                // setState(() {
                //   _currentReply = ReplyReference(
                //     messageId: message.id,
                //     content: message.content,
                //     senderId: message.senderId,
                //   );
                // });
                // },
                // child:
                MessageBubbleGroupWidget(
              message: message,
              isCurrentUser: message.senderId ==
                  Provider.of<AuthProvider>(context)
                      .user
                      ?.uid, // Assuming you have an AuthProvider
              // ),
            );
          },
        );
      },
    );
  }

  Widget _buildMessageInput() {
    return InputMessageWidget(
      groupId: widget.groups.id,
      currentUserId: Provider.of<AuthProvider>(context).user?.uid ??
          '', // Assuming you have an AuthProvider
      // replyTo: _currentReply,
    );
  }
}
