import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/course/courses_model.dart';
import '../../../model/departments/departments_model.dart';
import '../../../providers/course_provider.dart';
import '../../../providers/department_provider.dart';

class CourseMangementPanel extends StatefulWidget {
  const CourseMangementPanel({super.key});

  @override
  State<CourseMangementPanel> createState() => _CourseMangementPanelState();
}

class _CourseMangementPanelState extends State<CourseMangementPanel> {
  int currentPage = 1;
  final int rowsPerPage = 15;
  final TextEditingController _searchController = TextEditingController();
  String? _selectedDepartmentId;
  List<DepartmentsModel> _departments = [];
  bool _isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _loadDepartments(); // Start loading departments
  }

  Future<void> _loadDepartments() async {
    try {
      final departmentProvider = context.read<DepartmentProvider>();
      final departments = await departmentProvider.getDepartmentsAsFuture();
      setState(() {
        _departments = departments;
        _isLoading = false; // Data loaded successfully
      });
    } catch (error) {
      setState(() {
        _isLoading = false; // Loading failed
      });
      // Handle errors (e.g., show a message)
      print('Error loading departments: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loader while loading
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: () {
            _showCreateCourseDialog();
          },
          child: const Text("Create New Course"),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildDataTable() {
    return StreamBuilder(
      stream: context.read<CourseProvider>().getCoursesWithPagination(
            limit: rowsPerPage,
            departmentId: _selectedDepartmentId,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No courses found"),
          );
        }

        // If search is active, filter the results
        List<CoursesModel> courses = snapshot.data!;
        if (_searchController.text.isNotEmpty) {
          courses = courses
              .where((course) => course.name
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
                DataColumn(label: Text("Department")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Actions")),
              ],
              rows: courses.map((course) {
                // Find department name
                String departmentName = _departments
                    .firstWhere((dept) => dept.id == course.departmentId,
                        orElse: () => DepartmentsModel(
                            id: '',
                            name: 'Unknown',
                            description: '',
                            isActive: true,
                            createdAt: DateTime.now()))
                    .name;

                return DataRow(
                  cells: [
                    DataCell(Text(course.name)),
                    DataCell(Text(departmentName)),
                    DataCell(
                      _buildStatusBadge(
                        course.isActive ? 'Active' : 'Inactive',
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              LucideIcons.eye,
                              size: 16,
                            ),
                            onPressed: () {
                              _showCourseDetails(course);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              LucideIcons.pencil,
                              size: 16,
                            ),
                            onPressed: () {
                              _editCourse(course);
                            },
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
      case 'pending':
        backgroundColor = Colors.amber[100]!;
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
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPagination() {
    final courseProvider = context.watch<CourseProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${courseProvider.courses.length} results",
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        Row(
          children: [
            IconButton(
              onPressed: currentPage > 1
                  ? () {
                      setState(() => currentPage--);
                      courseProvider.lastDoc = null;
                    }
                  : null,
              icon: const Icon(Icons.arrow_back),
            ),
            Text(
              currentPage.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            IconButton(
              onPressed: () {
                // TODO: Implement next page logic
                ShadToaster.of(context).show(
                  const ShadToast.destructive(
                    title: Text("Pagination Not Implemented"),
                    description: Text(
                      "Pagination logic needs to be implemented in the provider",
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ],
    );
  }
// Continue from the previous implementation

  void _showCourseDetails(CoursesModel course) {
    // Find department name
    String departmentName = _departments
        .firstWhere(
          (dept) => dept.id == course.departmentId,
          orElse: () => DepartmentsModel(
            id: '',
            name: 'Unknown',
            description: '',
            isActive: true,
            createdAt: DateTime.now(),
          ),
        )
        .name;

    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text(course.name),
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Department: $departmentName'),
            Text('Status: ${course.isActive ? 'Active' : 'Inactive'}'),
            Text('Created At: ${course.createdAt}'),
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

  void _editCourse(CoursesModel course) {
    showDialog(
      context: context,
      builder: (context) => _CourseEditDialog(
        course: course,
        departments: _departments,
      ),
    );
  }

  void _showCreateCourseDialog() {
    showDialog(
      context: context,
      builder: (context) => _CourseCreateDialog(
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

// Create Course Dialog
class _CourseCreateDialog extends StatefulWidget {
  final List<DepartmentsModel> departments;

  const _CourseCreateDialog({required this.departments});

  @override
  _CourseCreateDialogState createState() => _CourseCreateDialogState();
}

class _CourseCreateDialogState extends State<_CourseCreateDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  String? _selectedDepartmentId;
  final TextEditingController _nameController = TextEditingController();
  final Map<String, dynamic> _courseSettings = {};

  final _shadPopoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    print(widget.departments);
    final theme = ShadTheme.of(context);
    return ShadDialog(
      title: const Text('Create New Course'),
      description: ShadForm(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Course Name Input
            ShadInputFormField(
              id: 'Course',
              label: const Text(
                "Write a Name of course",
              ),
              controller: _nameController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a course name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Department Dropdown
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
          ],
        ),
      ),
      actions: [
        ShadButton.ghost(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ShadButton(
          onPressed: _submitCourse,
          child: const Text('Create Course'),
        ),
      ],
    );
  }

  void _addCourseSettingField() {
    setState(() {
      _courseSettings['setting_${_courseSettings.length + 1}'] = '';
    });
  }

  List<Widget> _buildCourseSettingsFields() {
    return _courseSettings.keys.map((key) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Setting Name',
                hintText: 'Enter setting name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _courseSettings.remove(key);
                    });
                  },
                ),
              ),
              initialValue: key,
              onChanged: (newKey) {
                setState(() {
                  final value = _courseSettings.remove(key);
                  _courseSettings[newKey] = value;
                });
              },
            ),
            const SizedBox(width: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Setting Value',
                hintText: 'Enter setting value',
              ),
              initialValue: _courseSettings[key].toString(),
              onChanged: (value) {
                setState(() {
                  _courseSettings[key] = value;
                });
              },
            ),
          ],
        ),
      );
    }).toList();
  }

  void _submitCourse() {
    if (_formKey.currentState!.validate()) {
      final courseProvider = context.read<CourseProvider>();

      courseProvider
          .createCourse(
        name: _nameController.text,
        departmentId: _selectedDepartmentId!,
      )
          .then((_) {
        context.pop();
        ShadToaster.of(context).show(
          const ShadToast(
            backgroundColor: Colors.green,
            title: Text('Course Created'),
            description: Text('New course has been successfully created.'),
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
    _nameController.dispose();
    super.dispose();
  }
}

// Edit Course Dialog
class _CourseEditDialog extends StatefulWidget {
  final CoursesModel course;
  final List<DepartmentsModel> departments;

  const _CourseEditDialog({
    required this.course,
    required this.departments,
  });

  @override
  _CourseEditDialogState createState() => _CourseEditDialogState();
}

class _CourseEditDialogState extends State<_CourseEditDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  late String _selectedDepartmentId;
  late TextEditingController _nameController;
  Map<String, dynamic>? _courseSettings;
  late bool _isActive;

  final _shadPopoverController = ShadPopoverController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.course.name);
    _selectedDepartmentId = widget.course.departmentId;
    _isActive = widget.course.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text('Edit Course: ${widget.course.name}'),
      description: ShadForm(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Course Name Input
            ShadInputFormField(
              id: 'Course Name',
              controller: _nameController,
              label: const Text('Course Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a course name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Department Dropdown
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

            // Active/Inactive Toggle
            ShadSwitch(
              label: const Text('Course Status'),

              // subtitle: Text(_isActive ? 'Active' : 'Inactive'),
              value: _isActive,
              onChanged: (bool value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),

            // Dynamic Course Settings
          ],
        ),
      ),
      actions: [
        ShadButton.ghost(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ShadButton(
          onPressed: _submitCourseUpdate,
          child: const Text('Update Course'),
        ),
        ShadButton.destructive(
          onPressed: _deleteCourse,
          child: const Text('Delete Course'),
        ),
      ],
    );
  }

  void _submitCourseUpdate() {
    if (_formKey.currentState!.validate()) {
      final courseProvider = context.read<CourseProvider>();

      final updatedCourse = widget.course.copyWith(
        name: _nameController.text,
        departmentId: _selectedDepartmentId,
        courseSettings: _courseSettings,
        isActive: _isActive,
      );

      courseProvider.updateCourse(updatedCourse: updatedCourse).then((_) {
        if (mounted) {
          context.pop();
          ShadToaster.of(context).show(
            const ShadToast(
              backgroundColor: Colors.green,
              title: Text('Course Updated'),
              description:
                  Text('Course details have been successfully updated.'),
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

  void _deleteCourse() {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Confirm Delete'),
        description: Text(
          'Are you sure you want to delete the course "${widget.course.name}"? This action cannot be undone.',
        ),
        actions: [
          ShadButton.ghost(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ShadButton.destructive(
            onPressed: () {
              final courseProvider = context.read<CourseProvider>();
              courseProvider.deleteCourse(widget.course.id).then((_) {
                // Close both dialogs
                if (mounted) {
                  context.pop(); // Delete confirmation dialog
                  context.pop(); // Edit course dialog

                  ShadToaster.of(context).show(
                    const ShadToast(
                      backgroundColor: Colors.redAccent,
                      title: Text('Course Deleted'),
                      description:
                          Text('Course has been successfully deleted.'),
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
