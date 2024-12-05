import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget buildNavigationItem(
  BuildContext context, {
  required IconData icon,
  required String label,
  required int index,
  required int selectedIndex,
  required Color primaryColor,
  required void Function()? tap,
}) {
  final isSelected = selectedIndex == index;
  return InkWell(
    onTap: tap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
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
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
          ),
          const SizedBox(width: 9),
        ],
      ),
    ),
  );
}
