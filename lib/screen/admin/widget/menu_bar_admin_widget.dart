import 'package:flutter/material.dart';

class MenuBarAdminWidget extends StatelessWidget {
  final ValueChanged<int> onItemSelected;

  const MenuBarAdminWidget({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo Section
            const Row(
              children: [
                Icon(
                  Icons.apps,
                  size: 36,
                ),
                SizedBox(width: 10),
                Text(
                  "Logo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerItem(
                    icon: Icons.dashboard,
                    label: "Admin",
                    index: 0,
                    onTap: onItemSelected,
                  ),
                  DrawerItem(
                    icon: Icons.folder,
                    label: "Departments",
                    index: 1,
                    onTap: onItemSelected,
                  ),
                  DrawerItem(
                    icon: Icons.golf_course,
                    label: "Course",
                    index: 2,
                    onTap: onItemSelected,
                  ),
                  DrawerItem(
                    icon: Icons.person,
                    label: "Teachers",
                    index: 3,
                    onTap: onItemSelected,
                  ),
                  DrawerItem(
                    icon: Icons.people,
                    label: "Students",
                    index: 4,
                    onTap: onItemSelected,
                  ),
                  DrawerItem(
                    icon: Icons.chat,
                    label: "Posts",
                    index: 5,
                    onTap: onItemSelected,
                  ),
                  DrawerItem(
                    icon: Icons.book,
                    label: "Books",
                    index: 6,
                    onTap: onItemSelected,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  DrawerItem(
                    icon: Icons.person,
                    label: "Talk to Developer",
                    index: 7,
                    onTap: onItemSelected,
                  ),
                  DrawerItem(
                    icon: Icons.add,
                    label: "Request New Feature",
                    index: 8,
                    onTap: onItemSelected,
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

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final ValueChanged<int> onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => onTap(index),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.grey[800]),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
