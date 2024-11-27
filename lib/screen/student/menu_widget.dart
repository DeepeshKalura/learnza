import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: 0,
      onDestinationSelected: (index) {
        // TODO: Navigate based on selected menu item
      },
      labelType: NavigationRailLabelType.selected,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.book),
          label: Text('Library'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.group),
          label: Text('People & Services'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.calendar_today),
          label: Text('Schedule'),
        ),
      ],
    );
  }
}
