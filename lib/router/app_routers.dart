import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:learnza/locator/injector.dart' as di;
import '../model/posts/posts_model.dart';
import '../screen/student/library/library_student_screen.dart';
import '../screen/student/post/deatail_blog_student.dart';
import '../screen/student/profile/profile_student_screen.dart';
import '../service/firebase_service.dart';
import '/model/app_enums.dart';
import '../providers/auth_provider.dart';
import '../screen/admin/home_admin_screen.dart';
import '../screen/common/auth/login_auth_common_screen.dart';
import '../screen/common/loading_common_screen.dart';
import '../screen/student/home_student_screen.dart';
import '../screen/teacher/home_teacher_screen.dart';
import 'app_urls.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouters {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/auth',
    navigatorKey: rootNavigatorKey,
    routes: [
      // Public routes

      GoRoute(
        path: "/",
        name: AppUrls.loadingCommonScreen,
        builder: (context, state) => const SplashCommonScreen(),
      ),

      GoRoute(
        path: "/auth",
        name: AppUrls.authenticationScreen,
        builder: (context, state) => const LoginAuthCommonScreen(),
        redirect: roleBasedRedirect,
      ),

      // here will exit authenticated admin routes
      GoRoute(
        path: "/admin",
        name: AppUrls.homeAdminScreen,
        builder: (context, state) => const HomeAdminScreen(),
        redirect: roleBasedRedirect,
      ),

      // here will exit authenticated teacher routes
      GoRoute(
        path: "/teacher",
        name: AppUrls.homeTeacherScreen,
        builder: (context, state) => const HomeTeacherScreen(),
        redirect: roleBasedRedirect,
      ),
      // here will exit authenticated student routes
      GoRoute(
        path: "/student",
        redirect: studentRoutesRedirect,
        routes: [
          GoRoute(
            path: "/home",
            name: AppUrls.homeStudentScreen,
            builder: (context, state) => const HomeStudentScreen(),
          ),
          GoRoute(
            path: "/profile",
            name: AppUrls.profileStudentScreen,
            builder: (context, state) => const ProfileStudentScreen(),
          ),

          GoRoute(
            path: '/library',
            name: AppUrls.libraryStudentScreen,
            builder: (context, state) {
              return const LibraryStudentScreen();
            },
          ),
          // GoRoute(
          //   path: '/edit-blog',
          //   name: AppUrls.editBlogStudentScreen,
          //   builder: (context, state) {
          //     return const EditBlogStudentScreen();
          //   },
          // ),
          GoRoute(
            path: '/detail-blog',
            name: AppUrls.detailBlogStudentScreen,
            builder: (context, state) {
              var args = state.extra! as Map<String, PostsModel>;
              return DetailBlogStudentScreen(
                post: args['post']!,
              );
            },
          ),
        ],
      ),
    ],
  );
}

String? studentRoutesRedirect(BuildContext context, GoRouterState state) {
  final authProvider = context.read<AuthProvider>();

  if (authProvider.user!.role == UserRole.student) {
    return null;
  } else {
    return '/unauthorized';
  }
}

Future<String?> roleBasedRedirect(
    BuildContext context, GoRouterState state) async {
  final firebaseUser = di.injector.get<FirebaseService>().auth.currentUser;

  if (firebaseUser == null) {
    return '/auth';
  }
  final authProvider = context.read<AuthProvider>();
  await authProvider.getUser(firebaseUser.uid);
  var user = authProvider.user;

  if (user == null) {
    return '/auth';
  } else {
    if (user.role == UserRole.admin) {
      return '/admin';
    } else if (user.role == UserRole.teacher) {
      return '/teacher';
    } else {
      return '/student/home';
    }
  }
}
