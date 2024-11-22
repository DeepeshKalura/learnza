// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../core/app_url.dart';
// import '../../core/pallet.dart';
// import 'bloc/splash_bloc.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController animationController;

//   @override
//   void initState() {
//     super.initState();

//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );

//     animation = Tween<double>(begin: 0, end: 1).animate(animationController);

//     animationController.forward();
//     animationController.addListener(() {
//       if (animationController.isCompleted) {
//         context.read<SplashBloc>().add(TimerEndEvent());
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Pallet.whiteColor,
//       body: BlocListener<SplashBloc, SplashState>(
//         listener: (context, state) {
//           if (state is OnbodingScreenState) {
//             context.pushReplacementNamed(AppUrl.onboardingScreen);
//           } else if (state is HomeScreenState) {
//             context.pushReplacementNamed(AppUrl.homeScreen);
//           } else if (state is LoggedInState) {
//             context.pushReplacementNamed(AppUrl.signInScreen);
//           } else if (state is ErrorState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.errorMessage)),
//             );
//           }
//         },
//         child: Stack(
//           children: [
//             // Background Image
//             Positioned.fill(
//               child: Image.asset(
//                 "assets/images/splash/splash_bg.png",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Pallet.splashBackgroundColor,
//               ),
//             ),
//             // Gradient Overlay
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: RadialGradient(
//                   center: Alignment(0.4987, 0.8535),
//                   radius: 2.5,
//                   colors: [
//                     Color(0x00FF6D17),
//                     Color.fromRGBO(255, 109, 23, 0.64),
//                     Color(0xFF1E1E1E),
//                   ],
//                   stops: [0.0, 0.29, 0.69],
//                   transform: GradientRotation(3.14159),
//                 ),
//               ),
//             ),

//             // Fade-in Animation for Logo and Text
//             Center(
//               child: FadeTransition(
//                 opacity: animation,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset(
//                       "assets/images/splash/app_logo_cropped.png",
//                     ),
//                     Text(
//                       "REAL \nESTATE \nINDIA",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.quicksand(
//                         fontSize: 36,
//                         fontWeight: FontWeight.bold,
//                         color: Pallet.whiteColor,
//                         letterSpacing: 5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 40,
//               left: 0,
//               right: 0,
//               child: Column(
//                 children: [
//                   Text(
//                     "Made with Love",
//                     style: GoogleFonts.quicksand(
//                       color: Pallet.whiteColor,
//                       fontSize: 11,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     "v1.0",
//                     style: GoogleFonts.quicksand(
//                       color: Pallet.whiteColor,
//                       fontSize: 11,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
// }