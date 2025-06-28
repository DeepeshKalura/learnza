import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadInput(
      placeholder: const Text('Password'),
      obscureText: obscure,
      controller: widget.controller,
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(LucideIcons.lock, size: 16),
      ),
      trailing: ShadIconButton(
        width: 24,
        height: 24,
        padding: EdgeInsets.zero,
        decoration: const ShadDecoration(
          secondaryBorder: ShadBorder.none,
          secondaryFocusedBorder: ShadBorder.none,
        ),
        icon: Icon(
          obscure ? LucideIcons.eyeOff : LucideIcons.eye,
          size: 16,
        ),
        onPressed: () {
          setState(() => obscure = !obscure);
        },
      ),
    );
  }
}
