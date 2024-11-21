import 'package:flutter/material.dart';
import 'package:learnza/screen/admin/pannel/course_mangement_pannel.dart';
import 'package:learnza/screen/admin/pannel/department_managment_pannel.dart';
import 'pannel/admin_management_pannel.dart';
import 'widget/header_admin_widget.dart';
import 'widget/menu_bar_admin_widget.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const AdminManagementPannel(),
    const DepartmentManagementPanel(),
    const CourseMangementPanel(),
    const Center(
      child: Text(
        'Teachers',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Students',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Posts',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Books',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Developer Contact',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Request feature to Developer',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return Scaffold(
          appBar: isSmallScreen
              ? AppBar(
                  title: const Text('Admin Panel'),
                )
              : null,
          drawer: isSmallScreen
              ? MenuBarAdminWidget(
                  onItemSelected: (index) {
                    setState(() => _currentPageIndex = index);
                    Navigator.pop(context);
                  },
                )
              : null,
          body: Row(
            children: [
              if (!isSmallScreen)
                SizedBox(
                  width: 250,
                  child: MenuBarAdminWidget(
                    onItemSelected: (index) {
                      setState(() => _currentPageIndex = index);
                    },
                  ),
                ),
              if (!isSmallScreen)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      child: HeaderAdminWidget(
                        activePage: _pages[_currentPageIndex].toString(),
                      ),
                    ),
                    Expanded(
                      child: _pages[_currentPageIndex],
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
