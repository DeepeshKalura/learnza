import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/app_enums.dart';
import '../../providers/auth_provider.dart';
import '../../utils/theme.dart';
import '../admin/admin_screen.dart';
import '../library/user_library_screen.dart';
// import '../messenger/groups_student_screen.dart';
import '../messenger/messenger_screen.dart';
import '../post/posts_screen.dart';

class HomeStudentScreen extends StatefulWidget {
  const HomeStudentScreen({super.key});

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  int _currentIndex = 1;
  List<Widget> _screens = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (context.read<AuthProvider>().user?.role == UserRole.admin) {
      _screens = [
        const PostStudentScreen(),
        const AdminScreen(),
        // const ProfileStudentScreen(),
        // const LibraryStudentScreen(),
        const UserLibraryScreen(),
        // const HomeCalendarScreen(),
        const MessengerScreen(),
      ];
    } else {
      _screens = [
        const PostStudentScreen(),

        // const ProfileStudentScreen(),
        // const LibraryStudentScreen(),
        const UserLibraryScreen(),
        // const HomeCalendarScreen(),
        const MessengerScreen(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;
    final authProvider = context.read<AuthProvider>();

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
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_filled,
                      ),
                      label: 'Home',
                    ),
                    if (authProvider.user?.role == UserRole.admin)
                      const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.admin_panel_settings_outlined,
                        ),
                        label: 'Admin',
                      ),
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.library_books,
                      ),
                      label: 'Library',
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(
                    //     Icons.calendar_today,
                    //   ),
                    //   label: 'Calander',
                    // ),
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.message,
                      ),
                      label: 'Messanger',
                    ),
                  ],
                ),
        );
      },
    );
  }
}
