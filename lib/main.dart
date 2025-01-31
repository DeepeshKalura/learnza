import 'package:feedback_github/feedback_github.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnza/app_config.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// import 'package:firebase_app_check/firebase_app_check.dart';
// I will remove add app check

import 'firebase_options.dart';
import 'l10n/l10n.dart';
import 'providers/admin_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/book_provider.dart';
import 'providers/course_provider.dart';
import 'providers/department_provider.dart';
import 'providers/groups_provider.dart';
import 'providers/message_provider.dart';
import 'providers/post_provider.dart';
import 'providers/state/groups/groups_state_provider.dart';
import 'providers/state/libary/course_book_libary_state_provider.dart';
import 'providers/state/libary/download_books_libary_state_provider.dart';
import 'providers/state/libary/literature_book_library_state_provider.dart';
import 'providers/state/posts/post_editor_sate_provider.dart';
import 'providers/state/posts/posts_state_provider.dart';
import 'providers/state/settings/settings_state_provider.dart';
import 'providers/state/student/libary_student_state_provider.dart';
import 'providers/state/user_preference_provider.dart';
import 'providers/student_provider.dart';
import 'providers/teacher_provider.dart';
import 'router/app_routers.dart';
import 'service/firebase_service.dart';
import 'utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await FirebaseAppCheck.instance.activate(
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.appAttest,s
  // );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await di.init();
  await di.injector.get<AppConfig>().setup();
  runApp(
    BetterFeedback(
      mode: FeedbackMode.navigate,
      theme: FeedbackThemeData(
        background: Colors.blue[50]!,
        feedbackSheetColor: Colors.grey[50]!,
        drawColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
        ],
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: kIsWeb ? const Size(1440, 900) : const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => UserPreferenceProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => AuthProvider(
                di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => AdminProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => DepartmentProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => CourseProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => TeacherProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => StudentProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => PostProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => BookProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) {
                return GroupsProvider(
                  firebaseService: di.injector.get<FirebaseService>(),
                );
              },
            ),
            ChangeNotifierProvider(create: (context) {
              return MessageProvider(
                firebaseService: di.injector.get<FirebaseService>(),
              );
            }),
            ChangeNotifierProvider(
              create: (context) {
                return LibaryStudentStateProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return DownloadBooksLibaryStateProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return GroupsStateProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return CourseBookLibaryStateProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return LiteratureBookLibraryStateProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return SettingsStateProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return PostsStateProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return PostEditorStateProvider();
              },
            )
          ],
          child: Consumer<UserPreferenceProvider>(
            builder: (context, userPreferenceProvider, _) {
              if (!userPreferenceProvider.isInitialized) {
                return const MaterialApp(
                  home: Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }

              return ShadApp.router(
                debugShowCheckedModeBanner: false,
                locale: Locale(userPreferenceProvider.currentLanguage),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: L10n.all,
                title: 'Shadananda',
                theme: userPreferenceProvider.isDarkMode
                    ? darkThemeData
                    : lightThemeData,
                routerConfig: AppRouters.router,
              );
            },
          ),
        );
      },
    );
  }
}
