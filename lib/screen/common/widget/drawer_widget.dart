import 'package:feedback_github/feedback_github.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../app_config.dart';
// import '../../../gen/assets.gen.dart';
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
            decoration: BoxDecoration(
              color: ShadTheme.of(context).colorScheme.primary,
              // gradient: LinearGradient(
              //   colors: [ShadTheme.of(context).colorScheme.pr  ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
            ),
            currentAccountPicture: ShadAvatar(
              user?.profileImageURL ??
                  "https://plus.unsplash.com/premium_vector-1722102206801-756d21ef01ca",
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
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.profileDrawer ?? 'Profile',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.profileStudentScreen);
                  },
                  selected: currentIndex == 0,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.settingDrawer ?? 'Settings',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.settingCommonScreen);
                    //     // showShadDialog(
                    //     //   context: context,
                    //     //   builder: (context) => ShadDialog(
                    //     //     title: const Text("Settings"),
                    //     //     description:
                    //     //         const Text("Make changes for you application"),
                    //     //     actions: [
                    //     //       ShadButton(
                    //     //         icon: const Icon(LucideIcons.languages),
                    //     //         onPressed: () {
                    //     //           Navigator.of(context).pop();
                    //     //         },
                    //     //         child: const Text("Neplai"),
                    //     //       ),
                    //     //       ShadButton(
                    //     //           icon: const Icon(Icons.close),
                    //     //           onPressed: () {
                    //     //             Navigator.of(context).pop();
                    //     //           }),
                    //     //     ],
                    //     //   ),
                    //     // );
                  },
                  //   selected: currentIndex == 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.feedback,
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
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.aboutDrawer ?? 'About',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () {
                    context.pushNamed(AppUrls.aboutCommonScreen);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    AppLocalizations.of(context)?.logoutDrawer ?? 'Logout',
                    style: ShadTheme.of(context).textTheme.table,
                  ),
                  onTap: () async {
                    var result = await showShadDialog(
                      context: context,
                      builder: (context) => ShadDialog.alert(
                        title: const Text('Are you absolutely sure?'),
                        description: const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'This action will makes you logout from the application.',
                          ),
                        ),
                        actions: [
                          ShadButton.outline(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          ShadButton(
                            child: const Text('Continue'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      ),
                    );
                    if (result == true) {
                      context.read<AuthProvider>().logout();
                      context
                          .pushReplacementNamed(AppUrls.authenticationScreen);
                    }
                  },
                ),
                // TODO: I don't like the application image in the drawer
                // ShadImage(
                //   Assets.icons.student.welcome.path,

                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
