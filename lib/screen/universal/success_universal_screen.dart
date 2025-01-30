import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../utils/theme.dart';

class UniversalAlert {
  static void sucessAlert(BuildContext context, String message, String title) {
    return ShadToaster.of(context).show(
      ShadToast(
        title: Text(
          title,
          style: TextStyle(
            color: ShadTheme.of(context).colorScheme.background,
          ),
        ),
        description: Text(
          message,
          style: TextStyle(
            color: ShadTheme.of(context).colorScheme.background,
          ),
        ),
        backgroundColor: successColor,
      ),
    );
  }

  static void commonErrorSheet(BuildContext context, String e) {
    return ShadToaster.of(context).show(
      ShadToast.destructive(
        title: const Text('Uh oh! Something went wrong'),
        description: Text(e),
        action: ShadButton.destructive(
          decoration: ShadDecoration(
            border: ShadBorder.all(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          onPressed: () => ShadToaster.of(context).hide(),
          child: const Text('Try again'),
        ),
      ),
    );
  }
}
