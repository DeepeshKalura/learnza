import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../router/app_urls.dart';

class HomeStudentScreen extends StatelessWidget {
  const HomeStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Student Screen'),
      ),
      body: const Center(
        child: Text(
          'Home Student Screen',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          developer.log('Floating action button pressed');
          context.pushNamed(AppUrls.editBlogStudentScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
