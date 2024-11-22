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
import 'providers/course_provider.dart';
import 'providers/department_provider.dart';
import 'providers/student_provider.dart';
import 'providers/teacher_provider.dart';
import 'router/app_routers.dart';
import 'service/firebase_service.dart';

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
      designSize: const Size(375, 812),
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
          ],
          child: ShadApp.router(
            title: 'Learnza',
            darkTheme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: const ShadSlateColorScheme.light(),
            ),
            routerConfig: AppRouters.router,
          ),
        );
      },
    );
  }
}
