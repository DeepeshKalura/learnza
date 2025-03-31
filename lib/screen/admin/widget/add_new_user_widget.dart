import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/state/admin/admin_state_provider.dart';
import '../../../utils/form_validator.dart';
import '../../../utils/theme.dart';

class AddNewUserWidget extends StatefulWidget {
  const AddNewUserWidget({super.key});

  @override
  State<AddNewUserWidget> createState() => _AddNewUserWidgetState();
}

class _AddNewUserWidgetState extends State<AddNewUserWidget> {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    fullNameController.dispose();
    emailFocusNode.dispose();
    fullNameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.6,
      expand: true,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add New User',
                        style: ShadTheme.of(context).textTheme.h2,
                      ),
                      IconButton(
                        icon: const Icon(LucideIcons.x),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Email Field
                  Focus(
                    focusNode: emailFocusNode,
                    child: TextFormField(
                      controller: emailController,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        fullNameFocusNode.requestFocus();
                      },
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: primaryColor, width: 2),
                        ),
                      ),
                      validator: FormValidator.validateEmail,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Full Name Field
                  Focus(
                    focusNode: fullNameFocusNode,
                    child: TextFormField(
                      controller: fullNameController,
                      autocorrect: true,
                      keyboardType: TextInputType.name,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: primaryColor, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Role Selection
                  Text(
                    'Role',
                    style: ShadTheme.of(context).textTheme.large,
                  ),
                  const SizedBox(height: 8),
                  Consumer<AdminStateProvider>(
                    builder: (context, adminProvider, child) {
                      return DropdownButtonFormField<String>(
                        value: adminProvider.selectedRole,
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: primaryColor,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: primaryColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: primaryColor, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: primaryColor, width: 1.0),
                          ),
                        ),
                        elevation: 8,
                        style: ShadTheme.of(context).textTheme.large.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        onChanged: (value) {
                          if (value != null) {
                            adminProvider.setSelectedRole(value);
                          }
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'student',
                            child: Row(
                              children: [
                                Icon(Icons.school,
                                    color: primaryColor, size: 20),
                                SizedBox(width: 10),
                                Text(
                                  'Student',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'admin',
                            child: Row(
                              children: [
                                Icon(Icons.admin_panel_settings,
                                    color: primaryColor, size: 20),
                                SizedBox(width: 10),
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'teacher',
                            child: Row(
                              children: [
                                Icon(
                                  Icons.co_present,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Teacher',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  Consumer<AdminStateProvider>(
                    builder: (context, stateProvider, child) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: stateProvider.createNewUserLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    // Show loading

                                    try {
                                      await stateProvider.createNewUser(
                                        email: emailController.text.trim(),
                                        fullName:
                                            fullNameController.text.trim(),
                                        role: stateProvider.getSelectedRole,
                                      );

                                      context.pop();
                                    } catch (e) {
                                      // Dismiss loading dialog
                                      context.pop();

                                      // Show error message
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Error: ${e.toString()}'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  'Create User',
                                  style: ShadTheme.of(context)
                                      .textTheme
                                      .large
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ShadTheme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                ),
                              ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
