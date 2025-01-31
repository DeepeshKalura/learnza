import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:learnza/model/course/courses_model.dart';
import 'package:provider/provider.dart';

import '/model/app_enums.dart';
import '../model/books/books_model.dart';
import '../model/groups/groups_model.dart';
import '../model/posts/posts_model.dart';
import '../providers/auth_provider.dart';
import '../screen/about/about_shadananda_screen.dart';
import '../screen/about/student_union_about_screen.dart';
import '../screen/about/teacher_about_screen.dart';
import '../screen/auth/authentication_screen.dart';
import '../screen/auth/forgot_password_screen.dart';
import '../screen/common/library/offline_libaray_common_screen.dart';
import '../screen/common/splash/splash_screen.dart';
import '../screen/library/anna_web_view_screen.dart';
import '../screen/library/course_book_list_screen.dart';
import '../screen/library/library_student_screen.dart';
import '../screen/library/read_book_read_screen.dart';
import '../screen/library/search_book_student_screen.dart';
import '../screen/library/user_library_screen.dart';
import '../screen/library/widget/book_card_widget.dart';
import '../screen/messenger/groups_message_screen.dart';
import '../screen/messenger/groups_student_screen.dart';
import '../screen/messenger/widget/groups_details_screen.dart';
import '../screen/post/posts_screen.dart';
import '../screen/setting/setting_screen.dart';
import '../screen/student/blogs/deatail_blog_student.dart';
import '../screen/student/home_student_screen.dart';
import '../screen/student/profile/profile_student_screen.dart';
import '../service/firebase_service.dart';
import '../service/internet_connectivity_service.dart';
import 'app_urls.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouters {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: ${state.error}'),
            ],
          ),
        ),
      );
    },
    routes: [
      // Public routes

      GoRoute(
        path: "/",
        name: AppUrls.loadingCommonScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: "/auth",
        name: AppUrls.authenticationScreen,
        builder: (context, state) => const AuthenticationScreen(),
        redirect: roleBasedRedirect,
      ),

      GoRoute(
        path: "/about",
        name: AppUrls.aboutScreen,
        builder: (context, state) => const AboutShadanandaScreen(),
      ),

      GoRoute(
        path: "/setting",
        name: AppUrls.settingCommonScreen,
        builder: (context, state) => const SettingScreen(),
      ),

      GoRoute(
        path: "/offline-library",
        name: AppUrls.offlineLibarayCommonScreen,
        builder: (context, state) => const OfflineLibraryCommonScreen(),
      ),

      GoRoute(
        path: "/posts",
        name: AppUrls.postStudentScreen,
        builder: (context, state) => const PostStudentScreen(),
      ),
      GoRoute(
        path: "/forgot-password",
        name: AppUrls.forgotPasswordAuthScreen,
        builder: (context, state) => const ForgotPasswordAuthScreen(),
      ),

      GoRoute(
        path: "/anna-web-view",
        name: AppUrls.annaWebViewScreen,
        builder: (context, state) {
          var queryParams = state.extra as Map<String, dynamic>;
          return AnnaWebViewScreen(
            url: queryParams['url'] as String,
            book: queryParams['book'] as BooksModel,
          );
        },
      ),

      GoRoute(
        path: "/download-page",
        name: AppUrls.downloadBookScreen,
        builder: (context, state) {
          var queryParams = state.extra as Map<String, dynamic>;
          return BookDownloadScreen(
            bookUrl: queryParams['bookUrl'] as String,
            booksModel: queryParams['book'] as BooksModel,
          );
        },
      ),

      // here will exit authenticated student routes
      GoRoute(
        path: "/student",
        // redirect: studentRoutesRedirect,
        name: AppUrls.homeStudentScreen,
        builder: (context, state) => const HomeStudentScreen(),
        routes: [
          GoRoute(
            path: "/library-hall",
            name: AppUrls.libraryHallScreen,
            builder: (context, state) {
              return const UserLibraryScreen();
            },
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
          GoRoute(
            path: "/groups",
            name: AppUrls.groupsStudentScreen,
            builder: (context, state) => const GroupsStudentScreen(),
          ),
          GoRoute(
            path: '/read-book',
            name: AppUrls.readBookReadScreen,
            builder: (context, state) {
              var args = state.extra! as Map<String, dynamic>;
              return ReadBookReadScreen(
                book: args['book'] as BooksModel,
              );
            },
          ),
          GoRoute(
            path: '/groups-message',
            name: AppUrls.groupMessageStudentScreen,
            builder: (context, state) {
              var args = state.extra! as Map<String, GroupsModel>;
              return GroupsMessageScreen(
                groups: args['group'] as GroupsModel,
              );
            },
          ),
          GoRoute(
            path: "/groups-detail",
            name: AppUrls.groupDetailStudentScreen,
            builder: (context, state) {
              var args = state.extra! as Map<String, GroupsModel>;
              return GroupDetailsScreen(
                group: args['group'] as GroupsModel,
              );
            },
          ),
          GoRoute(
            path: '/search',
            name: AppUrls.searchBooksStudentScreen,
            builder: (context, state) {
              var args = state.extra! as Map<String, dynamic>;
              return SearchBookStudentScreen(
                searchQuery: args["searchQuery"] as String,
                books: args["books"] as List<BooksModel>,
              );
            },
          ),
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
          GoRoute(
            path: '/course-book-list',
            name: AppUrls.courseBookListScreen,
            builder: (context, state) {
              var args = state.extra! as Map<String, dynamic>;
              return CourseBookListScreen(
                course: args['course'] as CoursesModel,
                year: args['year'] as int,
              );
            },
          ),
          GoRoute(
            path: '/about/student-union',
            name: AppUrls.studentUnionAboutScreen,
            builder: (context, state) {
              return const StudentUnionAboutScreen();
            },
          ),
          GoRoute(
            path: "/about/teacher",
            name: AppUrls.teacherAboutScreen,
            builder: (context, state) => const TeacherAboutScreen(),
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
    // TODO: Implement role based redirection when you created the admin role and teacher role screen
    BuildContext context,
    GoRouterState state) async {
  final firebaseUser = di.injector.get<FirebaseService>().auth.currentUser;

  final authProvider = context.read<AuthProvider>();
  final internetConnectivityService =
      di.injector.get<InternetConnectivityService>();

  if (!await internetConnectivityService.checkConnectivity()) {
    return '/offline-library';
  }

  if (firebaseUser == null) {
    return '/auth';
  }

  await authProvider.getUser(firebaseUser.uid);
  var user = authProvider.user;

  if (user == null) {
    return '/auth';
  } else {
    return '/student';
  }
}
