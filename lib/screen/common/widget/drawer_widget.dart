import 'package:feedback_github/feedback_github.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../app_config.dart';
import '../../../providers/auth_provider.dart';
import '../../../router/app_urls.dart';
import '../../../utils/resource_util.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: ShadTheme.of(context).colorScheme.primary,
            ),
            currentAccountPicture: ShadAvatar(
              user?.profileImageURL ?? ResourceUtil.defaultProfileImage,
              placeholder: Text(
                user?.fullName.substring(0, 2) ?? 'JD',
              ),
            ),
            accountName: Text(
              user?.fullName ?? 'John Doe',
              style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ShadTheme.of(context).colorScheme.background,
                  ),
            ),
            accountEmail: Text(
              user?.email ?? 'johndoe@example.com',
              style: ShadTheme.of(context).textTheme.p.copyWith(
                    fontSize: 14,
                    color: ShadTheme.of(context).colorScheme.background,
                  ),
            ),
          ),
          // Navigation menu
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.person_outline,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.profileDrawer ?? 'Profile',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.profileStudentScreen);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LucideIcons.settings,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.settingDrawer ?? 'Settings',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.settingCommonScreen);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.feedback_outlined,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.feedbackDrawer ?? 'Feedback',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    final githubtoken = di.injector<AppConfig>().githubToken;
                    final repoUrl = di.injector<AppConfig>().repoUrl;
                    BetterFeedback.of(context).showAndUploadToGitHub(
                      repoUrl: repoUrl,
                      gitHubToken: githubtoken,
                      deviceInfo: true,
                      packageInfo: true,
                      labels: ['feedback', 'issue', 'enhancement', 'bug'],
                      extraData: StackTrace.current.toString(),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LucideIcons.loaderPinwheel,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.teacherDrawer ?? 'Teacher',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.teacherAboutScreen);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LucideIcons.shell,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.studentUnionDrawer ??
                        'Student Union',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.studentUnionAboutScreen);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LucideIcons.badgeInfo,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.aboutDrawer ?? 'About',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.aboutScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
