import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';
import '../../providers/course_provider.dart';

class CourseBookLibraryScreen extends StatelessWidget {
  const CourseBookLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserCourse = context.read<CourseProvider>().currentUserCourse;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShadImage(Assets.icons.icUnderDevelopment.path),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Text(
              'Currently books for ${currentUserCourse?.name ?? "your"} course not available',
              style: ShadTheme.of(context).textTheme.h3.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
