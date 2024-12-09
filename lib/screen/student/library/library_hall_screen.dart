import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../gen/assets.gen.dart';
import '../../../providers/auth_provider.dart';
import '../../../router/app_urls.dart';
import '../../common/widget/drawer_widget.dart';

class LibraryHallScreen extends StatefulWidget {
  const LibraryHallScreen({super.key});

  @override
  State<LibraryHallScreen> createState() => _LibraryHallScreenState();
}

class _LibraryHallScreenState extends State<LibraryHallScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().user;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.menu),
          color: Colors.black,
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(localizations.libraryHallTitle),
      ),
      drawer: const DrawerWidget(
        currentIndex: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShadImage(
              Assets.icons.student.looking.path,
            ),
            _buildLibraryCard(
              title: localizations.onlineBookStoreTitle,
              description: localizations.onlineBookStoreDescription,
              icon: Icons.cloud_download,
              image:
                  'https://images.unsplash.com/photo-1519681393784-d120267933ba',
              onTap: () {
                context.pushNamed(AppUrls.libraryStudentScreen);
              },
            ),
            const SizedBox(height: 16),
            _buildLibraryCard(
              title: localizations.personalLibraryTitle(user?.fullName ?? "My"),
              description: localizations.personalLibraryDescription,
              icon: Icons.local_library,
              image:
                  'https://images.unsplash.com/photo-1604866830893-c13cafa515d5',
              onTap: () {
                context.pushNamed(AppUrls.offlineLibarayCommonScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Custom card widget for library features
  Widget _buildLibraryCard({
    required String title,
    required String description,
    required IconData icon,
    required String image,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image and Icon Row
              Row(
                children: [
                  // Image on the left
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              icon,
                              size: 40,
                              color: primaryColor,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: primaryColor.withOpacity(0.5),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
