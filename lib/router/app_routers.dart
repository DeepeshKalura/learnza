import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/common/auth/login_auth_common_screen.dart';
import 'app_urls.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouters {
  static final router = GoRouter(
    initialLocation: '/auth',
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: "/auth",
        name: AppUrls.authenticationScreen,
        builder: (context, state) => const LoginAuthCommonScreen(),
      )
    ],
  );
}
