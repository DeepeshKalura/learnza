import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:provider/provider.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';
// I will remove add app check

import 'firebase_options.dart';
import 'providers/admin_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/book_provider.dart';
import 'providers/course_provider.dart';
import 'providers/department_provider.dart';
import 'providers/groups_provider.dart';
import 'providers/message_provider.dart';
import 'providers/post_provider.dart';
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
  //   appleProvider: AppleProvider.appAttest,
  // );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
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
          ],
          child: ShadApp.router(
            title: 'Learnza',
            darkTheme: lightThemData,
            routerConfig: AppRouters.router,
          ),
        );
      },
    );
  }
}
