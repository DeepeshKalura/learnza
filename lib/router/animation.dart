import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchMessengerPage extends CustomTransitionPage<void> {
  SearchMessengerPage({required super.child})
      : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
