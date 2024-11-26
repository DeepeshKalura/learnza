import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/widget/drawer_widget.dart';

class ProfileStudentScreen extends StatelessWidget {
  const ProfileStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: kIsWeb
          ? null
          : const DrawerWidget(
              currentIndex: 2,
            ),
      body: const Center(
        child: Text('Profile Student Screen'),
      ),
    );
  }
}
