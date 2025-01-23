import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/course/courses_model.dart';
import '../../providers/state/libary/course_book_libary_state_provider.dart';
import '../../router/app_urls.dart';

class CourseBookLibraryScreen extends StatefulWidget {
  const CourseBookLibraryScreen({super.key});

  @override
  State<CourseBookLibraryScreen> createState() =>
      _CourseBookLibraryScreenState();
}

class _CourseBookLibraryScreenState extends State<CourseBookLibraryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CourseBookLibaryStateProvider>().getCourse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CourseBookLibaryStateProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingCourses) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.courses.isEmpty) {
            return Center(
              child: Text(
                'No courses available',
                style: ShadTheme.of(context).textTheme.p,
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.courses.length,
            itemBuilder: (context, index) {
              final course = provider.courses[index];
              final isUserCourse = course.id == provider.courseId;

              return _buildCourseCard(course, isUserCourse);
            },
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(CoursesModel course, bool isUserCourse) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ShadCard(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          course.name,
                          style: ShadTheme.of(context).textTheme.h4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (course.description != null)
                        Icon(
                          LucideIcons.info,
                          color: ShadTheme.of(context)
                              .colorScheme
                              .accentForeground,
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (course.description != null)
                    Text(
                      course.description!,
                      style: ShadTheme.of(context).textTheme.p,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      course.year,
                      (yearIndex) => ShadButton(
                        child: Text('Year ${yearIndex + 1}'),
                        onPressed: () {
                          context.pushNamed(
                            AppUrls.courseBookListScreen,
                            extra: {
                              'course': course,
                              'year': yearIndex + 1,
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
