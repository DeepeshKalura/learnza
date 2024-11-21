import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:provider/provider.dart';

import '../../../model/departments/departments_model.dart';
import '../../../providers/admin_provider.dart';
import '../../../providers/department_provider.dart';
import '../../../utils/form_validator.dart';
import '../../universal/error_univseral_screen.dart';
import '../../universal/success_universal_screen.dart';

class EditDepartmentSheet extends StatefulWidget {
  const EditDepartmentSheet({super.key, required this.side, this.department});

  final ShadSheetSide side;
  final DepartmentsModel? department;

  @override
  State<EditDepartmentSheet> createState() => _EditDepartmentSheetState();
}

class _EditDepartmentSheetState extends State<EditDepartmentSheet> {
  final _formKey = GlobalKey<ShadFormState>();
  final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _headOfDepartmentController =
  //     TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final errorUniversalScreen = ErrorUniversalScreen();
  final successUniversalScreen = SuccessUniversalScreen();

  bool _isLoading = false;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    // Populate fields if editing existing department
    if (widget.department != null) {
      _nameController.text = widget.department!.name;
      // _headOfDepartmentController.text = widget.department?.headTeacherId ?? '';
      _descriptionController.text = widget.department?.description ?? '';
      _isActive = widget.department!.isActive;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    // _headOfDepartmentController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final departmentProvider = context.read<DepartmentProvider>();

    try {
      // If editing existing department
      if (widget.department != null) {
        // await departmentProvider.updateDepartment(
        //   name: _nameController.text.trim(),
        //   headOfDepartment: _headOfDepartmentController.text.trim(),
        //   description: _descriptionController.text.trim(),
        //   isActive: _isActive,
        // );

        // if (mounted) {
        //   successUniversalScreen.commonErrorSheet(
        //       context, "Department updated successfully");
        // }
      }
      // If creating new department
      else {
        await departmentProvider.createDepartment(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
        );

        if (mounted) {
          successUniversalScreen.commonErrorSheet(
              context, "Department created successfully");
        }
      }

      if (mounted) {
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
    final isEditing = widget.department != null;

    return ShadSheet(
      constraints: widget.side == ShadSheetSide.left ||
              widget.side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: Text(isEditing ? 'Edit Department' : 'Add New Department'),
      description: Text(
        isEditing
            ? "Update the details of the existing department."
            : "Add a new department to the system.",
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
              : Text(
                  isEditing ? 'Update Department' : 'Create Department',
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
              // Department Name
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Department Name',
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
                        'Enter department name',
                      ),
                      validator: FormValidator.validateName,
                      enabled: !_isLoading,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 16),

              // Description
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Description',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.small,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: ShadInputFormField(
                      controller: _descriptionController,
                      placeholder: const Text(
                        'Enter department description',
                      ),
                      maxLines: 3,
                      enabled: !_isLoading,
                    ),
                  ),
                ],
              ),

              // Active Status (only for editing)
              if (isEditing) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Department Status',
                        textAlign: TextAlign.end,
                        style: theme.textTheme.small,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 5,
                      child: ShadSwitch(
                        value: _isActive,
                        onChanged: !_isLoading
                            ? (value) => setState(() => _isActive = value)
                            : null,
                        label: Text(_isActive ? 'Active' : 'Inactive'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
