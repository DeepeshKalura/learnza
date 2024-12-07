import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import 'groups/groups_student_screen.dart';
import 'library/library_student_screen.dart';
import 'post/post_student_screen.dart';

class HomeStudentScreen extends StatefulWidget {
  const HomeStudentScreen({super.key});

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const PostStudentScreen(),
    // const ProfileStudentScreen(),
    const LibraryStudentScreen(),
    const GroupsStudentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: isWeb
              ? null
              : BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) => setState(() => _currentIndex = index),
                  selectedItemColor: primaryColor,
                  unselectedItemColor: hintColor,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_filled,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.library_books,
                      ),
                      label: 'Library',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.group,
                      ),
                      label: 'Groups',
                    ),
                  ],
                ),
        );
      },
    );
  }
}
