import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/users/users_model.dart';
import '../../../model/departments/departments_model.dart';
import '../../../providers/student_provider.dart';
import '../../../providers/department_provider.dart';
import '../../../providers/auth_provider.dart';

class StudentManagementPanel extends StatefulWidget {
  const StudentManagementPanel({super.key});

  @override
  State<StudentManagementPanel> createState() => _StudentManagementPanelState();
}

class _StudentManagementPanelState extends State<StudentManagementPanel> {
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
            _showCreateStudentDialog();
          },
          child: const Text("Add New Student"),
        ),
      ],
    );
  }

  Widget _buildDataTable() {
    return StreamBuilder(
      stream: context.read<StudentProvider>().getStudentsWithPagination(
            limit: rowsPerPage,
            departmentId: _selectedDepartmentId,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No students found"));
        }

        List<UsersModel> students = snapshot.data!;
        if (_searchController.text.isNotEmpty) {
          students = students
              .where((student) => student.fullName
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
                DataColumn(label: Text("Actions")),
              ],
              rows: students.map((student) {
                return DataRow(
                  cells: [
                    DataCell(Text(student.fullName)),
                    DataCell(Text(student.email)),
                    DataCell(
                      _buildStatusBadge(
                        student.isActive ? 'Active' : 'Inactive',
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(LucideIcons.eye, size: 16),
                            onPressed: () => _showStudentDetails(student),
                          ),
                          IconButton(
                            icon: const Icon(LucideIcons.pencil, size: 16),
                            onPressed: () => _editStudent(student),
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

  void _showStudentDetails(UsersModel student) {
    String departmentName = _departments
        .firstWhere(
          (dept) => dept.id == student.departmentId,
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
        title: Text(student.fullName),
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email: ${student.email}'),
            Text('Department: $departmentName'),
            Text('Status: ${student.isActive ? 'Active' : 'Inactive'}'),
            Text('Created At: ${student.createdAt}'),
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

  void _showCreateStudentDialog() {
    showDialog(
      context: context,
      builder: (context) => _StudentCreateDialog(departments: _departments),
    );
  }

  void _editStudent(UsersModel student) {
    showDialog(
      context: context,
      builder: (context) => _StudentEditDialog(
        student: student,
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

class _StudentCreateDialog extends StatefulWidget {
  final List<DepartmentsModel> departments;

  const _StudentCreateDialog({required this.departments});

  @override
  _StudentCreateDialogState createState() => _StudentCreateDialogState();
}

class _StudentCreateDialogState extends State<_StudentCreateDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _selectedDepartmentId;
  final _shadPopoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text('Add New Student'),
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
            ShadSelect<String>(
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
          ],
        ),
      ),
      actions: [
        ShadButton.ghost(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ShadButton(
          onPressed: _submitStudent,
          child: const Text('Create Student'),
        ),
      ],
    );
  }

  void _submitStudent() {
    if (_formKey.currentState!.validate() && _selectedDepartmentId != null) {
      final authProvider = context.read<AuthProvider>();

      authProvider
          .createStudentRegistration(
        email: _emailController.text,
        fullName: _nameController.text,
        // departmentId: _selectedDepartmentId!,
      )
          .then((_) {
        Navigator.of(context).pop();
        ShadToaster.of(context).show(
          const ShadToast(
            backgroundColor: Colors.green,
            title: Text('Success'),
            description: Text('Student has been successfully created.'),
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

class _StudentEditDialog extends StatefulWidget {
  final UsersModel student;
  final List<DepartmentsModel> departments;

  const _StudentEditDialog({
    required this.student,
    required this.departments,
  });

  @override
  _StudentEditDialogState createState() => _StudentEditDialogState();
}

class _StudentEditDialogState extends State<_StudentEditDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  late TextEditingController _nameController;
  late String _selectedDepartmentId;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.fullName);
    _selectedDepartmentId = widget.student.departmentId ?? '';
    _isActive = widget.student.isActive;
  }

  final _shadPopoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text('Edit Student: ${widget.student.fullName}'),
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
            ShadSelect<String>(
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
          ],
        ),
      ),
      actions: [
        ShadButton.ghost(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ShadButton(
          onPressed: _submitStudentUpdate,
          child: const Text('Update Student'),
        ),
        ShadButton.destructive(
          onPressed: _deleteStudent,
          child: const Text('Delete Student'),
        ),
      ],
    );
  }

  void _submitStudentUpdate() {
    if (_formKey.currentState!.validate()) {
      final studentProvider = context.read<StudentProvider>();

      final updatedStudent = widget.student.copyWith(
        fullName: _nameController.text,
        departmentId: _selectedDepartmentId,
        isActive: _isActive,
      );

      studentProvider.updateStudent(updatedStudent: updatedStudent).then((_) {
        if (mounted) {
          context.pop();
          ShadToaster.of(context).show(
            const ShadToast(
              backgroundColor: Colors.green,
              title: Text('Student Updated'),
              description:
                  Text('Student details have been successfully updated.'),
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

  void _deleteStudent() {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Confirm Delete'),
        description: Text(
          'Are you sure you want to delete the student "${widget.student.fullName}"? This action cannot be undone.',
        ),
        actions: [
          ShadButton.ghost(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ShadButton.destructive(
            onPressed: () {
              final studentProvider = context.read<StudentProvider>();
              studentProvider.deleteStudent(widget.student.uid).then((_) {
                if (mounted) {
                  context.pop(); // Delete confirmation dialog
                  context.pop(); // Edit student dialog

                  ShadToaster.of(context).show(
                    const ShadToast(
                      backgroundColor: Colors.redAccent,
                      title: Text('Student Deleted'),
                      description:
                          Text('Student has been successfully deleted.'),
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
