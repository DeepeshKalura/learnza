import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/users/users_model.dart';
import '../../../providers/admin_provider.dart';
import '../sheet/edit_profile_admin_sheet.dart';

class AdminManagementPannel extends StatefulWidget {
  const AdminManagementPannel({super.key});

  @override
  State<AdminManagementPannel> createState() => _AdminManagementPannelState();
}

class _AdminManagementPannelState extends State<AdminManagementPannel> {
  int currentPage = 1;
  final int rowsPerPage = 15;
  var isLoading = true;
  List<UsersModel> admins = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFotter(),
          const SizedBox(height: 16),
          _buildDataTable(),
          const SizedBox(height: 8),
          _buildPagination(),
        ],
      ),
    );
  }

  Widget _buildFotter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: () {
            showShadSheet(
              context: context,
              side: ShadSheetSide.bottom,
              builder: (context) => const EditProfileAdminSheet(
                side: ShadSheetSide.bottom,
              ),
            );
          },
          child: const Text("Add New Admin"),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildDataTable() {
    return StreamBuilder(
        stream: context.read<AdminProvider>().getAdminsWithPagination(
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
              child: CircularProgressIndicator(),
            );
          }

          return Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      "id",
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Name",
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Email",
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Role",
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Status",
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "View",
                    ),
                  ),
                ],
                rows: snapshot.data!.map((admin) {
                  return DataRow(
                    cells: [
                      DataCell(Text(admin.uid)),
                      DataCell(Text(admin.fullName)),
                      DataCell(Text(admin.email)),
                      DataCell(Text(admin.role.name)),
                      DataCell(
                        _buildStatusBadge(
                          admin.isActive ? 'Active' : 'Inactive',
                        ),
                      ),
                      DataCell(
                        IconButton(
                          icon: const Icon(
                            LucideIcons.eye,
                            size: 16,
                          ),
                          onPressed: () {
                            if (mounted) {
                              ShadToaster.of(context).show(
                                const ShadToast.destructive(
                                  title: Text("First Create a Profile "),
                                  description: Text(
                                    "Create a profile and make it like a view you know",
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        });
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
    final adminProvider = context.watch<AdminProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${adminProvider.admins.length} results",
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        Row(
          children: [
            IconButton(
              onPressed: currentPage > 1
                  ? () async {
                      setState(() => currentPage--);
                      adminProvider.lastAdminDocs = null;
                    }
                  : null,
              icon: const Icon(Icons.arrow_back),
            ),
            Text(
              currentPage.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            IconButton(
              onPressed: () async {
                ShadToaster.of(context).show(
                  const ShadToast.destructive(
                    title: Text("Wrong paganiation"),
                    description: Text(
                      "The way you are doing pagation is not good improve with ui",
                    ),
                  ),
                );
                // if (false) {
                //   setState(() => currentPage++);
                // }
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ],
    );
  }
}
