import 'package:flutter/material.dart';

class ThemeUtils {
  static Color getDestructiveForeground(BuildContext context) {
    return Theme.of(context).colorScheme.error;
  }
}
