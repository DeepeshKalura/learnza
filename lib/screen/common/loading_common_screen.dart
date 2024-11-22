import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../model/app_enums.dart';
import '../../providers/auth_provider.dart';
import '../../router/app_urls.dart';
import '../../service/firebase_service.dart';
import 'package:learnza/locator/injector.dart' as di;

class SplashCommonScreen extends StatefulWidget {
  const SplashCommonScreen({super.key});

  @override
  State<SplashCommonScreen> createState() => _SplashCommonScreenState();
}

class _SplashCommonScreenState extends State<SplashCommonScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    final firebaseUser = di.injector.get<FirebaseService>().auth.currentUser;
    print("$firebaseUser is a user");

    if (firebaseUser == null) {
      context.pushReplacementNamed(AppUrls.authenticationScreen);
      return;
    }
    final authProvider = context.read<AuthProvider>();
    await authProvider.getUser(firebaseUser.uid);
    var user = authProvider.user;

    if (user != null) {
      if (user.role == UserRole.admin) {
        context.pushReplacementNamed(AppUrls.homeAdminScreen);
        return;
      } else if (user.role == UserRole.teacher) {
        context.pushReplacementNamed(AppUrls.homeTeacherScreen);
        return;
      } else {
        context.pushReplacementNamed(AppUrls.homeStudentScreen);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
