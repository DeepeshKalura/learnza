import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/screen/messenger/widget/messanger_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/state/messanger/messanger_state_provider.dart';
import '../../router/app_urls.dart';
import '../common/widget/drawer_widget.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MessengerStateProvider>().retrieveUserMessengerList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MessengerStateProvider>();

    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(
          currentIndex: 2,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: true,
              title: const Text("Messenger"),
              actions: [
                IconButton(
                  icon: const Icon(
                    LucideIcons.search,
                  ),
                  onPressed: () {
                    context.pushNamed(AppUrls.searchMessengerScreen);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                FutureBuilder(
                  future: provider.hasPermissionToCreateGroups(),
                  builder: (context, asyncSnapshot) {
                    if (asyncSnapshot.connectionState == ConnectionState.done) {
                      if (asyncSnapshot.hasData && asyncSnapshot.data == true) {
                        return ShadButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {},
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else {
                      return CircularProgressIndicator(
                        backgroundColor:
                            ShadTheme.of(context).colorScheme.primary,
                      );
                    }
                  },
                ),
              ],
            ),
            SliverFillRemaining(
              child: Consumer<MessengerStateProvider>(
                builder: (context, stateProvider, child) {
                  if (stateProvider.listLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return RefreshIndicator(
                    onRefresh: () => provider.retrieveUserMessengerList(),
                    child: ListView.builder(
                      itemCount: stateProvider.messengerInterface.length,
                      itemBuilder: (context, index) {
                        // STEP 1: Design a good messanger overlay

                        return SizedBox(
                          child: MessengerListWidget(
                            consumer: stateProvider.messengerInterface[index],
                            onTap: () {
                              context.pushNamed(
                                AppUrls.messageConsumerScreen,
                                extra: {
                                  "consumer":
                                      stateProvider.messengerInterface[index]
                                },
                              );
                            },
                          ),
                          // onTap: () {},
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
