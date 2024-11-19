import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SuccessUniversalScreen {
  void commonErrorSheet(BuildContext context, String message) {
    return ShadToaster.of(context).show(
      ShadToast(
        title: const Text('Success Action'),
        description: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
