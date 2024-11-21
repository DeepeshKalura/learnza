import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/departments/departments_model.dart';
import '../../../providers/department_provider.dart';
import '../sheet/edit_deparments_sheet.dart';
import '../widget/edit_department_card_widget.dart';

class DepartmentManagementPanel extends StatefulWidget {
  const DepartmentManagementPanel({super.key});

  @override
  State<DepartmentManagementPanel> createState() =>
      _DepartmentManagementPanelState();
}

class _DepartmentManagementPanelState extends State<DepartmentManagementPanel> {
  int currentPage = 1;
  final int rowsPerPage = 15;
  var isLoading = true;
  List<DepartmentsModel> departments = [];

  @override
  void initState() {
    super.initState();
    // Optional: Initial data loading can be added here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
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
            showShadSheet(
              context: context,
              side: ShadSheetSide.bottom,
              builder: (context) => const EditDepartmentSheet(
                side: ShadSheetSide.bottom,
              ),
            );
          },
          child: const Text("Create New Department"),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildDataTable() {
    return StreamBuilder(
      stream: context.read<DepartmentProvider>().getDepartmentsWithPagination(
            limit: rowsPerPage,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Text("No departments found"),
          );
        }

        return Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Head of Department")),
                DataColumn(label: Text("Employee Count")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Actions")),
              ],
              rows: snapshot.data!.map((department) {
                return DataRow(
                  cells: [
                    DataCell(Text(department.name)),
                    DataCell(Text(department.headTeacherId ?? 'Not Assigned')),
                    DataCell(
                      Text(department.teacherIds?.length.toString() ?? "0"),
                    ),
                    DataCell(
                      _buildStatusBadge(
                        department.isActive ? 'Active' : 'Inactive',
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
                              _showDepartmentDetails(department);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              LucideIcons.pencil,
                              size: 16,
                            ),
                            onPressed: () {
                              _editDepartment(department);
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
    final departmentProvider = context.watch<DepartmentProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${departmentProvider.departments.length} results",
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        Row(
          children: [
            IconButton(
              onPressed: currentPage > 1
                  ? () {
                      setState(() => currentPage--);
                      departmentProvider.lastDoc = null;
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

  void _showDepartmentDetails(DepartmentsModel department) {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text(department.name),
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Head of Department: ${department.headTeacherId ?? 'Not Assigned'}'),
            Text('Employee Count: ${department.teacherIds?.length ?? "0"}'),
            Text('Status: ${department.isActive ? 'Active' : 'Inactive'}'),
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

  void _editDepartment(DepartmentsModel department) {
    showDialog(
      context: context,
      builder: (context) => EditDepartmentCardWidget(
        department: department,
      ),
    );
  }
}
