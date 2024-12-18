import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/auth_provider.dart';
import '../../../router/app_urls.dart';
import '../../common/widget/drawer_widget.dart';
import '../post/widget/build_navigation.dart';

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

    return LayoutBuilder(builder: (context, constrain) {
      final isWeb = constrain.maxWidth > 600;
      return Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerWidget(
          currentIndex: 1,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              leading: isWeb
                  ? null
                  : IconButton(
                      icon: const Icon(LucideIcons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
              title: Text(localizations.libraryHallTitle),
              titleTextStyle: ShadTheme.of(context).textTheme.h3,
              actions: [
                if (isWeb)
                  buildNavigationItem(
                    context,
                    icon: Icons.home_outlined,
                    label: AppLocalizations.of(context)?.homeNavigationBar ??
                        'Home',
                    index: 0,
                    selectedIndex: 1,
                    primaryColor: primaryColor,
                    tap: () {
                      context.pushReplacementNamed(AppUrls.postStudentScreen);
                    },
                  ),
                if (isWeb)
                  buildNavigationItem(
                    context,
                    icon: Icons.library_books,
                    label: AppLocalizations.of(context)?.libraryNavigationBar ??
                        'Library',
                    index: 1,
                    selectedIndex: 1,
                    primaryColor: primaryColor,
                    tap: () {
                      context.pushReplacementNamed(AppUrls.libraryHallScreen);
                    },
                  ),
                if (isWeb)
                  buildNavigationItem(
                    context,
                    icon: Icons.group,
                    label: AppLocalizations.of(context)?.groupNavigationBar ??
                        'Groups',
                    index: 2,
                    selectedIndex: 1,
                    primaryColor: primaryColor,
                    tap: () {
                      context.pushReplacementNamed(AppUrls.groupsStudentScreen);
                    },
                  ),
              ],
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: isWeb ? 32 : 8,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      _buildLibraryCard(
                        title: localizations.onlineBookStoreTitle,
                        quote: localizations.onlineBookStoreQuote,
                        image:
                            'https://images.unsplash.com/photo-1519681393784-d120267933ba',
                        onTap: () {
                          context.pushNamed(AppUrls.libraryStudentScreen);
                        },
                        first: true,
                      ),
                      const SizedBox(height: 16),
                      _buildLibraryCard(
                        title: localizations.personalLibraryTitle(
                          user?.fullName ?? "My",
                        ),
                        quote: localizations.offlineBookStoreQuote,
                        image:
                            'https://images.unsplash.com/photo-1604866830893-c13cafa515d5',
                        onTap: () {
                          context.pushNamed(AppUrls.offlineLibarayCommonScreen);
                        },
                        first: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildLibraryCard({
    required String title,
    required String quote,
    required String image,
    required VoidCallback onTap,
    required bool first,
  }) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 850,
      ),
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: ShadCard(
        border: const Border(
            top: BorderSide(
          width: 4,
          color: primaryColor,
        )),

        radius: BorderRadius.circular(12),
        // decoration: BoxDecoration(
        //   gradient: const LinearGradient(
        //     colors: [Color(0xFF3c8ce7), Color.fromARGB(255, 0, 174, 189)],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        //   borderRadius: BorderRadius.circular(12),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '"$quote"',
                style: const TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 150,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ShadButton(
                  onPressed: onTap,
                  size: ShadButtonSize.lg,
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.white,
                  //   foregroundColor: const Color(0xFF0077b6),
                  //   minimumSize: const Size(double.infinity, 50),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  // ),
                  child: Text(
                    first ? 'Download Books' : 'Read Books',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
