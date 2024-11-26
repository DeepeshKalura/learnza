import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
          // Drawer Header with user profile
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black26, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: ShadAvatar(
              user?.profileImage ??
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
                    LucideIcons.house,
                  ),
                  title: const Text('Home'),
                  onTap: () {
                    if (currentIndex == 0) {
                      context.pop();
                    } else {
                      context.pushReplacementNamed(AppUrls.homeStudentScreen);
                    }
                    context.pop();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LucideIcons.bookA,
                  ),
                  title: const Text('Library'),
                  onTap: () {
                    if (currentIndex == 1) {
                      context.pop();
                    } else {
                      context
                          .pushReplacementNamed(AppUrls.libraryStudentScreen);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LucideIcons.user,
                  ),
                  title: const Text('Profile'),
                  onTap: () {
                    if (currentIndex == 2) {
                      context.pop();
                    } else {
                      context
                          .pushReplacementNamed(AppUrls.profileStudentScreen);
                    }
                  },
                ),
                Divider(color: Colors.grey[300]),
                ListTile(
                  leading: const Icon(LucideIcons.logOut, color: Colors.red),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    context.read<AuthProvider>().logout();
                    Navigator.pop(context);
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
