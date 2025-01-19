import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/auth_provider.dart';
import '../../router/app_urls.dart';
import '../../utils/theme.dart';
import '../common/widget/drawer_widget.dart';
import '../post/widget/build_navigation.dart';

class UserLibraryScreen extends StatefulWidget {
  const UserLibraryScreen({super.key});

  @override
  State<UserLibraryScreen> createState() => _UserLibraryScreenState();
}

class _UserLibraryScreenState extends State<UserLibraryScreen> {
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
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image at the top
              Container(
                height: 200,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),
              // Content padding
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: ShadTheme.of(context).textTheme.h3,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '"$quote"',
                      style: ShadTheme.of(context).textTheme.blockquote,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          first ? 'Download Books' : 'Read Books',
                          style: ShadTheme.of(context).textTheme.p,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
