import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../utils/form_validator.dart';
import '../../universal/error_univseral_screen.dart';
import '../../universal/success_universal_screen.dart';

class EditProfileAdminSheet extends StatefulWidget {
  const EditProfileAdminSheet({super.key, required this.side});

  final ShadSheetSide side;

  @override
  State<EditProfileAdminSheet> createState() => _EditProfileAdminSheetState();
}

class _EditProfileAdminSheetState extends State<EditProfileAdminSheet> {
  final _formKey = GlobalKey<ShadFormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final errorUniversalScreen = ErrorUniversalScreen();
  final successUniversalScreen = SuccessUniversalScreen();
  final message = "Admin has been added successfully";

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final authService = context.read<AuthProvider>();

    try {
      await authService.createAdminRegisteration(
        username: _nameController.text.trim(),
        email: _emailController.text.trim(),
      );
      if (mounted) {
        successUniversalScreen.commonErrorSheet(context, message);
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        errorUniversalScreen.commonErrorSheet(context, e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSheet(
      constraints: widget.side == ShadSheetSide.left ||
              widget.side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: const Text('Add New Admin'),
      description: const Text(
        "Add a new admin to the system. Admins have full access to the system.",
      ),
      actions: [
        ShadButton(
          onPressed: _isLoading ? null : _handleSave,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Save changes',
                ),
        ),
      ],
      child: ShadForm(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Full Name',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.small,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: ShadInputFormField(
                      controller: _nameController,
                      placeholder: const Text(
                        'Enter full name',
                      ),
                      validator: FormValidator.validateName,
                      enabled: !_isLoading,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Email',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.small,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: ShadInputFormField(
                      controller: _emailController,
                      placeholder: const Text(
                        'Enter email address',
                      ),
                      validator: FormValidator.validateEmail,
                      enabled: !_isLoading,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
