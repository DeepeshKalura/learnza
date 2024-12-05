import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../router/app_urls.dart';
import '../../utils/theme.dart';

class CustomNavigationRail extends StatelessWidget {
  final int selectedIndex;

  const CustomNavigationRail({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildNavigationItem(
            context,
            icon: Icons.home_filled,
            label: 'Home',
            index: 0,
            selectedIndex: selectedIndex,
            primaryColor: primaryColor,
            tap: selectedIndex != 0
                ? () {
                    context.pushReplacementNamed(AppUrls.profileStudentScreen);
                  }
                : null,
          ),
          const SizedBox(height: 16),
          _buildNavigationItem(
            context,
            icon: Icons.library_books,
            label: 'Library',
            index: 1,
            selectedIndex: selectedIndex,
            primaryColor: primaryColor,
            tap: selectedIndex != 1
                ? () {
                    context.pushReplacementNamed(AppUrls.libraryStudentScreen);
                  }
                : null,
          ),
          const SizedBox(height: 16),
          _buildNavigationItem(
            context,
            icon: Icons.group,
            label: 'Groups',
            index: 2,
            selectedIndex: selectedIndex,
            primaryColor: primaryColor,
            tap: selectedIndex != 2
                ? () {
                    context.pushReplacementNamed(AppUrls.groupsStudentScreen);
                  }
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required int selectedIndex,
    required Color primaryColor,
    required Function()? tap,
  }) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: tap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? primaryColor : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: ShadTheme.of(context).textTheme.table.copyWith(
                    color: isSelected ? primaryColor : Colors.grey,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
            ),
            const SizedBox(
              width: 9,
            ),
          ],
        ),
      ),
    );
  }
}
