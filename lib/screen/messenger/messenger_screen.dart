import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/screen/messenger/widget/messanger_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/state/messanger/messanger_state_provider.dart';
import '../../router/app_urls.dart';
import '../common/widget/drawer_widget.dart';
import 'error/groups_error_widget.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MessengerStateProvider>().fetchChatList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(
        currentIndex: 2,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: const Text("Messenger"),
            actions: [
              IconButton(
                icon: const Icon(LucideIcons.search),
                onPressed: () {
                  context.pushNamed(AppUrls.searchMessengerScreen);
                },
              ),
              const SizedBox(width: 10),
              // This FutureBuilder can be simplified if needed, but it works
              Consumer<MessengerStateProvider>(
                builder: (context, provider, _) {
                  return FutureBuilder(
                    future: provider.hasPermissionToCreateGroups(),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                              ConnectionState.done &&
                          asyncSnapshot.data == true) {
                        return ShadIconButton(
                          icon: const Icon(Icons.add, size: 20),
                          onPressed: () {
                            // TODO: Implement create group dialog
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  );
                },
              )
            ],
          ),
          SliverFillRemaining(
            child: Consumer<MessengerStateProvider>(
              builder: (context, provider, child) {
                if (provider.isChatListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.chatListError != null) {
                  return GroupsErrorWidget(
                    error: provider.chatListError!,
                    onRetry: () => provider.fetchChatList(),
                  );
                }

                if (provider.chatList.isEmpty) {
                  return const Center(child: Text("No conversations yet."));
                }

                return RefreshIndicator(
                  onRefresh: () => provider.fetchChatList(),
                  child: ListView.builder(
                    itemCount: provider.chatList.length,
                    itemBuilder: (context, index) {
                      final consumer = provider.chatList[index];
                      return MessengerListWidget(
                        consumer: consumer,
                        onTap: () {
                          // --- CORRECTED NAVIGATION ---
                          context.pushNamed(
                            AppUrls.messageConsumerScreen,
                            pathParameters: {'conversationId': consumer.id},
                            extra: {
                              'isGroup': consumer.isGroup,
                              'data': consumer.source,
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
