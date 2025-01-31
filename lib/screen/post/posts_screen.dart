import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../common/widget/drawer_widget.dart';
import 'post_editor_screen.dart';
import 'widget/post_list_widget.dart';

class PostStudentScreen extends StatefulWidget {
  const PostStudentScreen({super.key});

  @override
  State<PostStudentScreen> createState() => _PostStudentScreenState();
}

class _PostStudentScreenState extends State<PostStudentScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _scaffoldKey.currentState?.dispose();
    super.dispose();
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
              title: Text(
                AppLocalizations.of(context)?.appName ?? 'e-Shadananda',
              ),
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
                    _showCreatePostBottomSheet(context);
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
          ];
        },
        body: const PostsListWidget(),
      ),
    );
  }

  void _showCreatePostBottomSheet(BuildContext context) {
    showShadSheet(
      context: context,
      side: ShadSheetSide.bottom,
      builder: (context) => const PostEditorScreen(),
    );
  }
}
