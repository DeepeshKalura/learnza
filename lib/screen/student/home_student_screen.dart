import 'package:flutter/material.dart';

import 'groups/groups_student_screen.dart';
import 'library/library_student_screen.dart';
import 'post/post_student_screen.dart';
import 'profile/profile_student_screen.dart';

class HomeStudentScreen extends StatefulWidget {
  const HomeStudentScreen({super.key});

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PostStudentScreen(),
    const ProfileStudentScreen(),
    const LibraryStudentScreen(),
    const GroupsStudentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
              color: Colors.black,
            ),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
              color: Colors.black,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: Colors.black,
            ),
            label: 'Groups',
          ),
        ],
      ),
    );
  }
}
