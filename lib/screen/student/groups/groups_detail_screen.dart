import 'package:flutter/material.dart';

import '../../../model/groups/groups_model.dart';

class GroupsDetailScreen extends StatelessWidget {
  const GroupsDetailScreen({super.key, required this.groups});

  final GroupsModel groups;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Detail'),
      ),
      body: const Center(
        child: Text('Group Detail Screen'),
      ),
    );
  }
}
