import 'package:flutter/material.dart';

class LoginAuthCommonScreen extends StatelessWidget {
  const LoginAuthCommonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text("Login Screen"),
      ),
    );
  }
}
