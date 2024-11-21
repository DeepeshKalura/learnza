import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:file_picker/file_picker.dart';

import '../../../model/departments/departments_model.dart';
import '../../../providers/department_provider.dart';

class EditDepartmentCardWidget extends StatefulWidget {
  final DepartmentsModel department;
  final void Function()? onSuccess;

  const EditDepartmentCardWidget({
    super.key,
    required this.department,
    this.onSuccess,
  });

  @override
  EditDepartmentCardWidgetState createState() =>
      EditDepartmentCardWidgetState();
}

class EditDepartmentCardWidgetState extends State<EditDepartmentCardWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  PlatformFile? _selectedFile;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isActive = true; // Local state for toggling active status

  @override
  void initState() {
    super.initState();
    // Populate initial values from the department
    _nameController.text = widget.department.name;
    _descriptionController.text = widget.department.description;
    _isActive = widget.department.isActive;
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  Future<void> _updateDepartment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final updatedDepartment = widget.department.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        isActive: _isActive,
      );

      final service = context.read<DepartmentProvider>();
      await service.updateDepartment(
        updatedDepartment: updatedDepartment,
        profilePictureFile: _selectedFile,
      );

      setState(() {
        _isLoading = false;
      });

      if (widget.onSuccess != null) widget.onSuccess!();

      if (mounted) {
        ShadToaster.of(context).show(
          const ShadToast(
            backgroundColor: Colors.green,
            title: Text("Department Updated"),
            description: Text("The department details have been updated."),
          ),
        );
        context.pop();
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });

      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text("Update Failed"),
            description: Text(e.toString()),
          ),
        );

        context.pop();
      }
    }
  }

  Future<void> _toggleActiveStatus() async {
    setState(() {
      _isActive = !_isActive;
    });
    // Optionally save this toggle immediately to Firestore.
    _updateDepartment();
  }

  Future<void> _deleteDepartment() async {
    final service = context.read<DepartmentProvider>();

    // Show a confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Department"),
          content: const Text(
            "Are you sure you want to delete this department? This action cannot be undone.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      try {
        await service.deleteDepartment(widget.department.id);

        if (mounted) {
          ShadToaster.of(context).show(
            const ShadToast(
              backgroundColor: Colors.red,
              title: Text("Department Deleted"),
              description:
                  Text("The department has been successfully deleted."),
            ),
          );
          context.pop();
        }

        if (widget.onSuccess != null) widget.onSuccess!();
      } catch (e) {
        if (mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text("Delete Failed"),
              description: Text(e.toString()),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Edit Department",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Description is required.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _pickFile,
                        child: const Text("Upload Profile Picture"),
                      ),
                      const SizedBox(width: 16),
                      if (_selectedFile != null)
                        Expanded(
                          child: Text(
                            _selectedFile!.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _toggleActiveStatus,
                  icon: Icon(_isActive ? Icons.toggle_on : Icons.toggle_off),
                  label: Text(_isActive ? "Deactivate" : "Activate"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isActive ? Colors.orange : Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _deleteDepartment,
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton(
                  onPressed: _isLoading ? null : _updateDepartment,
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
