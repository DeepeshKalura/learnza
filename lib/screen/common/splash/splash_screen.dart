import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../gen/assets.gen.dart';
import '../../../router/app_urls.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      if (animationController.isCompleted) {
        context.pushReplacementNamed(AppUrls.authenticationScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Adaptive width for different platforms
    final isWeb = MediaQuery.of(context).size.width > 600;
    final logoWidth = isWeb
        ? Assets.images.common.splash.lernzaLogo.size?.width ?? 400
        : double.infinity;

    return Scaffold(
      body: Stack(
        children: [
          // Fade-in Animation for Logo and Text
          Center(
            child: FadeTransition(
              opacity: animation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Assets.images.common.splash.lernzaLogo.path,
                    width: logoWidth,
                  ),
                  SizedBox(
                    height: isWeb ? 24.h : 12.h,
                  ),
                  Text(
                    "Lernza",
                    style: ShadTheme.of(context).textTheme.h1.copyWith(
                          fontSize: isWeb ? 48.sp : 32.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Made by ❤️ Deepesh Kalura ❤️",
                  style: ShadTheme.of(context).textTheme.h1.copyWith(
                        fontSize: isWeb ? 16.sp : 12.sp,
                      ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
