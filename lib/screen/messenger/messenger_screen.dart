import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  Widget build(BuildContext context) {
    final provider = context.read<MessengerStateProvider>();

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
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.searchPeopleResults.isEmpty &&
                      provider.searchGroupsResults.isEmpty) {
                    return const Center(
                      child: Text("None Founds"),
                    );
                  }

                  return const Center(
                    child: Text("There is a children man"),
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
