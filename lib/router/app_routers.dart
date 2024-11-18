import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../screen/admin/home_admin_screen.dart';
import '../screen/common/auth/login_auth_common_screen.dart';
import 'app_urls.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouters {
  static final router = GoRouter(
    initialLocation: '/auth',
    navigatorKey: rootNavigatorKey,
    routes: [
      // Public routes
      GoRoute(
        path: "/auth",
        name: AppUrls.authenticationScreen,
        builder: (context, state) => const LoginAuthCommonScreen(),
        redirect: (context, state) {
          if (context.read<AuthProvider>().firebaseService.auth.currentUser ==
              null) {
            return "/auth";
          }
          return '/admin';
        },
      ),

      GoRoute(
        path: "/admin",
        name: AppUrls.homeAdminScreen,
        builder: (context, state) => const HomeAdminScreen(),
        redirect: (context, state) {
          if (context.read<AuthProvider>().firebaseService.auth.currentUser ==
              null) {
            return AppUrls.authenticationScreen;
          }
          return '/admin';
        },
      ),
    ],
  );
}
