import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/state/admin/admin_state_provider.dart';
import '../../router/app_urls.dart';
import '../common/widget/drawer_widget.dart';
import '../common/widget/user_card_widget.dart';
import 'widget/add_new_user_widget.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminStateProvider>().getAllUser();
    });
  }

  void _showEventBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AddNewUserWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(
        currentIndex: 0,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              title: const Text("Admin Screen"),
              leading: IconButton(
                icon: const Icon(LucideIcons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              actions: [
                ShadButton(
                  icon: const Icon(LucideIcons.plus),
                  onPressed: () {
                    _showEventBottomSheet();
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
          ];
        },
        body: Consumer<AdminStateProvider>(
          builder: (context, stateProvider, child) {
            if (stateProvider.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (stateProvider.user.isEmpty) {
              return const Center(
                child: Text("No user found"),
              );
            }
            return ListView.builder(
              itemCount: stateProvider.user.length,
              itemBuilder: (context, index) {
                final usersModel = stateProvider.user[index];
                return UserCardCommonWidget(
                  user: usersModel,
                  onTap: () {
                    context.pushNamed(
                      AppUrls.userProfileScreen,
                      extra: {
                        'user': usersModel,
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
