import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/users/users_model.dart';
import '../../../model/departments/departments_model.dart';
import '../../../providers/teacher_provider.dart';
import '../../../providers/department_provider.dart';
import '../../../providers/auth_provider.dart';

class TeacherManagementPanel extends StatefulWidget {
  const TeacherManagementPanel({super.key});

  @override
  State<TeacherManagementPanel> createState() => _TeacherManagementPanelState();
}

class _TeacherManagementPanelState extends State<TeacherManagementPanel> {
  int currentPage = 1;
  final int rowsPerPage = 15;
  final TextEditingController _searchController = TextEditingController();
  String? _selectedDepartmentId;
  List<DepartmentsModel> _departments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDepartments();
  }

  Future<void> _loadDepartments() async {
    try {
      final departmentProvider = context.read<DepartmentProvider>();
      final departments = await departmentProvider.getDepartmentsAsFuture();
      setState(() {
        _departments = departments;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error loading departments: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
                _buildDataTable(),
                const SizedBox(height: 8),
                _buildPagination(),
              ],
            ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShadButton(
          onPressed: () {
            _showCreateTeacherDialog();
          },
          child: const Text("Add New Teacher"),
        ),
      ],
    );
  }

  Widget _buildDataTable() {
    return StreamBuilder(
      stream: context.read<TeacherProvider>().getTeachersWithPagination(
            limit: rowsPerPage,
            departmentId: _selectedDepartmentId,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No teachers found"));
        }

        List<UsersModel> teachers = snapshot.data!;
        if (_searchController.text.isNotEmpty) {
          teachers = teachers
              .where((teacher) => teacher.fullName
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
              .toList();
        }

        return Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Head Teacher")),
                DataColumn(label: Text("Actions")),
              ],
              rows: teachers.map((teacher) {
                return DataRow(
                  cells: [
                    DataCell(Text(teacher.fullName)),
                    DataCell(Text(teacher.email)),
                    DataCell(
                      _buildStatusBadge(
                        teacher.isActive ? 'Active' : 'Inactive',
                      ),
                    ),
                    DataCell(
                      Text(teacher.isHeadTeacher ?? false ? 'Yes' : 'No'),
                    ),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(LucideIcons.eye, size: 16),
                            onPressed: () => _showTeacherDetails(teacher),
                          ),
                          IconButton(
                            icon: const Icon(LucideIcons.pencil, size: 16),
                            onPressed: () => _editTeacher(teacher),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    switch (status.toLowerCase()) {
      case 'active':
        backgroundColor = Colors.green[100]!;
        break;
      case 'inactive':
        backgroundColor = Colors.red[100]!;
        break;
      default:
        backgroundColor = Colors.grey[100]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: currentPage > 1
              ? () {
                  setState(() => currentPage--);
                }
              : null,
          icon: const Icon(Icons.arrow_back),
        ),
        Text(currentPage.toString()),
        IconButton(
          onPressed: () {
            setState(() => currentPage++);
          },
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }

  void _showTeacherDetails(UsersModel teacher) {
    String departmentName = _departments
        .firstWhere(
          (dept) => dept.id == teacher.departmentId,
          orElse: () => DepartmentsModel(
            id: '',
            name: 'Not Assigned',
            description: '',
            isActive: true,
            createdAt: DateTime.now(),
          ),
        )
        .name;

    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text(teacher.fullName),
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email: ${teacher.email}'),
            Text('Department: $departmentName'),
            Text('Status: ${teacher.isActive ? 'Active' : 'Inactive'}'),
            Text(
                'Head Teacher: ${teacher.isHeadTeacher ?? false ? 'Yes' : 'No'}'),
            Text('Created At: ${teacher.createdAt}'),
          ],
        ),
        actions: [
          ShadButton.ghost(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showCreateTeacherDialog() {
    showDialog(
      context: context,
      builder: (context) => _TeacherCreateDialog(departments: _departments),
    );
  }

  void _editTeacher(UsersModel teacher) {
    showDialog(
      context: context,
      builder: (context) => _TeacherEditDialog(
        teacher: teacher,
        departments: _departments,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _TeacherCreateDialog extends StatefulWidget {
  final List<DepartmentsModel> departments;

  const _TeacherCreateDialog({required this.departments});

  @override
  _TeacherCreateDialogState createState() => _TeacherCreateDialogState();
}

class _TeacherCreateDialogState extends State<_TeacherCreateDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _selectedDepartmentId;
  bool _isHeadTeacher = false;
  final _shadPopoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text('Add New Teacher'),
      description: ShadForm(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadInputFormField(
              id: 'email',
              label: const Text('Email'),
              controller: _emailController,
              validator: (value) {
                if (value.isEmpty) return 'Please enter an email';
                if (!value.contains('@')) return 'Please enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 16),
            ShadInputFormField(
              id: 'name',
              label: const Text('Full Name'),
              controller: _nameController,
              validator: (value) {
                if (value.isEmpty) return 'Please enter a name';
                return null;
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ShadSelect<String>(
                controller: _shadPopoverController,
                placeholder: const Text('From Which Department'),
                options: [
                  ...widget.departments.map(
                    (dept) => ShadOption(
                      value: dept.id,
                      child: Text(dept.name),
                    ),
                  ),
                ],
                selectedOptionBuilder: (context, value) {
                  // Ensure that value is not null and matches a department id
                  try {
                    final selectedDepartment = widget.departments.firstWhere(
                      (dept) => dept.id == value,
                    );
                    return Text(selectedDepartment.name);
                  } catch (e) {
                    return const Text('Department not found');
                  }
                },
                onChanged: (value) {
                  _selectedDepartmentId = value;
                },
              ),
            ),
            const SizedBox(height: 16),
            ShadSwitch(
              label: const Text('Head Teacher'),
              value: _isHeadTeacher,
              onChanged: (value) {
                setState(() {
                  _isHeadTeacher = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        ShadButton.ghost(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ShadButton(
          onPressed: _submitTeacher,
          child: const Text('Create Teacher'),
        ),
      ],
    );
  }

  void _submitTeacher() {
    if (_formKey.currentState!.validate() && _selectedDepartmentId != null) {
      final authProvider = context.read<AuthProvider>();

      authProvider
          .createTeacherRegistration(
        email: _emailController.text,
        fullName: _nameController.text,
        departmentId: _selectedDepartmentId!,
        isHeadTeacher: _isHeadTeacher,
      )
          .then((_) {
        Navigator.of(context).pop();
        ShadToaster.of(context).show(
          const ShadToast(
            backgroundColor: Colors.green,
            title: Text('Success'),
            description: Text('Teacher has been successfully created.'),
          ),
        );
      }).catchError((error) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('Error'),
            description: Text(error.toString()),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}

class _TeacherEditDialog extends StatefulWidget {
  final UsersModel teacher;
  final List<DepartmentsModel> departments;

  const _TeacherEditDialog({
    required this.teacher,
    required this.departments,
  });

  @override
  _TeacherEditDialogState createState() => _TeacherEditDialogState();
}

class _TeacherEditDialogState extends State<_TeacherEditDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  late TextEditingController _nameController;
  late String _selectedDepartmentId;
  late bool _isActive;
  late bool _isHeadTeacher;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.teacher.fullName);
    _selectedDepartmentId = widget.teacher.departmentId ?? '';
    _isActive = widget.teacher.isActive;
    _isHeadTeacher = widget.teacher.isHeadTeacher ?? false;
  }

  final _shadPopoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text('Edit Teacher: ${widget.teacher.fullName}'),
      description: ShadForm(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadInputFormField(
              id: 'name',
              label: const Text('Full Name'),
              controller: _nameController,
              validator: (value) {
                if (value.isEmpty) return 'Please enter a name';
                return null;
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ShadSelect<String>(
                controller: _shadPopoverController,
                placeholder: const Text('From Which Department'),
                options: [
                  ...widget.departments.map(
                    (dept) => ShadOption(
                      value: dept.id,
                      child: Text(dept.name),
                    ),
                  ),
                ],
                selectedOptionBuilder: (context, value) {
                  // Ensure that value is not null and matches a department id
                  try {
                    final selectedDepartment = widget.departments.firstWhere(
                      (dept) => dept.id == value,
                    );
                    return Text(selectedDepartment.name);
                  } catch (e) {
                    return const Text('Department not found');
                  }
                },
                onChanged: (value) {
                  if (value != null) {
                    _selectedDepartmentId = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            ShadSwitch(
              label: const Text('Active Status'),
              value: _isActive,
              onChanged: (value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ShadSwitch(
              label: const Text('Head Teacher'),
              value: _isHeadTeacher,
              onChanged: (value) {
                setState(() {
                  _isHeadTeacher = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        ShadButton.ghost(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ShadButton(
          onPressed: _submitTeacherUpdate,
          child: const Text('Update Teacher'),
        ),
        ShadButton.destructive(
          onPressed: _deleteTeacher,
          child: const Text('Delete Teacher'),
        ),
      ],
    );
  }

  void _submitTeacherUpdate() {
    if (_formKey.currentState!.validate()) {
      final teacherProvider = context.read<TeacherProvider>();

      final updatedTeacher = widget.teacher.copyWith(
        fullName: _nameController.text,
        departmentId: _selectedDepartmentId,
        isActive: _isActive,
        isHeadTeacher: _isHeadTeacher,
      );

      teacherProvider.updateTeacher(updatedTeacher: updatedTeacher).then((_) {
        if (mounted) {
          context.pop();
          ShadToaster.of(context).show(
            const ShadToast(
              backgroundColor: Colors.green,
              title: Text('Teacher Updated'),
              description:
                  Text('Teacher details have been successfully updated.'),
            ),
          );
        }
      }).catchError((error) {
        if (mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Error'),
              description: Text(error.toString()),
            ),
          );
        }
      });
    }
  }

  void _deleteTeacher() {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Confirm Delete'),
        description: Text(
          'Are you sure you want to delete the teacher "${widget.teacher.fullName}"? This action cannot be undone.',
        ),
        actions: [
          ShadButton.ghost(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ShadButton.destructive(
            onPressed: () {
              final teacherProvider = context.read<TeacherProvider>();
              teacherProvider.deleteTeacher(widget.teacher.uid).then((_) {
                if (mounted) {
                  context.pop(); // Delete confirmation dialog
                  context.pop(); // Edit teacher dialog

                  ShadToaster.of(context).show(
                    const ShadToast(
                      backgroundColor: Colors.redAccent,
                      title: Text('Teacher Deleted'),
                      description:
                          Text('Teacher has been successfully deleted.'),
                    ),
                  );
                }
              }).catchError((error) {
                if (mounted) {
                  context.pop();

                  ShadToaster.of(context).show(
                    ShadToast.destructive(
                      title: const Text('Error'),
                      description: Text(error.toString()),
                    ),
                  );
                }
              });
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
