import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:learnza/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:feedback_github/feedback_github.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../app_config.dart';
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
                colors: [Colors.black26, Colors.black87],
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
              user?.email ?? 'johndoe@example.com',
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          // Navigation menu
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.feedback,
                  ),
                  title: const Text('Feedback'),
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
                    LucideIcons.logOut,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    context.read<AuthProvider>().logout();
                    context.pushReplacementNamed(AppUrls.authenticationScreen);
                  },
                ),
                // ListTile(
                //   leading: Icon(
                //     LucideIcons.bookA,
                //   ),
                //   title: Text('Library'),
                //   onTap: null,
                // ),
                // ListTile(
                //   leading: Icon(
                //     LucideIcons.user,
                //   ),
                //   title: Text('Profile'),
                //   onTap: null,
                // ),
                // ListTile(
                //   leading: Icon(
                //     LucideIcons.group,
                //   ),
                //   title: Text('Groups'),
                //   onTap: null,
                // ),
                //       Divider(color: Colors.grey[300]),
                //       // ListTile(
                //       //   leading: const Icon(LucideIcons.logOut, color: Colors.red),
                //       //   title: const Text(
                //       //     'Logout',
                //       //     style: TextStyle(color: Colors.red),
                //       //   ),
                //       //   onTap: () {
                //       //     context.read<AuthProvider>().logout();
                //       //     Navigator.pop(context);
                //       //   },
                //       // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
