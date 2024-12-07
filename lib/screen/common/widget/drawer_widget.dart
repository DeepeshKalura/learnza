import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/utils/theme.dart';
// import 'package:learnza/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:feedback_github/feedback_github.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../app_config.dart';
import '../../../gen/assets.gen.dart';
import '../../../providers/auth_provider.dart';
import '../../../router/app_urls.dart';

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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF62cff4), Color(0xFF0077b6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: ShadAvatar(
              user?.profileImageURL ??
                  "https://www.pngitem.com/pimgs/m/522-5220445_anonymous-profile-grey-person-sticker-glitch-empty-profile.png",
              placeholder: Text(
                user?.fullName.substring(0, 2) ?? 'JD',
              ),
            ),
            accountName: Text(
              user?.fullName ?? 'John Doe',
              style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
            ),
            accountEmail: Text(
              user?.email ?? 'johndoe@example.com',
              style: ShadTheme.of(context).textTheme.p.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
            ),
          ),
          // Navigation menu
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: darkPrimaryColor),
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.profileStudentScreen);
                  },
                  selected: currentIndex == 0,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: primaryColor,
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                      color: darkPrimaryColor,
                    ),
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.seetingStudentScreen);
                  },
                  selected: currentIndex == 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.feedback,
                    color: primaryColor,
                  ),
                  title: const Text(
                    'Feedback',
                    style: TextStyle(
                      color: darkPrimaryColor,
                    ),
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

                      // onSucces: (_) {
                      //   ShadToaster.of(context).show(
                      //     const ShadToast(
                      //       backgroundColor: successColor,
                      //       title: Text("Feedback Sent"),
                      //       description: Text(
                      //         "Thank you for your feedback",
                      //       ),
                      //     ),
                      //   );
                      // },
                      // onError: (_) {
                      //   ShadToaster.of(context).show(
                      //     const ShadToast.destructive(
                      //       title: Text("Feedback Error"),
                      //       description: Text(
                      //         "Something went wrong while sending feedback",
                      //       ),
                      //     ),
                      //   );
                      // }
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: primaryColor,
                  ),
                  title: const Text(
                    'About',
                    style: TextStyle(
                      color: darkPrimaryColor,
                    ),
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.aboutStudentScreen);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: dangerColor,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: dangerColor),
                  ),
                  onTap: () {
                    context.read<AuthProvider>().logout();
                    context.pushReplacementNamed(AppUrls.authenticationScreen);
                  },
                ),
                ShadImage(
                  Assets.icons.student.welcome.path,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
