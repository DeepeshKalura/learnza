import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../sheet/edit_profile_admin_sheet.dart';

class DetailedReportScreen extends StatefulWidget {
  const DetailedReportScreen({super.key});

  @override
  State<DetailedReportScreen> createState() => _DetailedReportScreenState();
}

class _DetailedReportScreenState extends State<DetailedReportScreen> {
  // Data for the table
  final List<Map<String, String>> data = [
    {
      "customerName": "Elizabeth Lee",
      "company": "AvatarSystems",
      "orderValue": "\$359",
      "orderDate": "10/07/2023",
      "status": "New"
    },
    {
      "customerName": "Carlos Garcia",
      "company": "SmoozeShift",
      "orderValue": "\$747",
      "orderDate": "24/07/2023",
      "status": "New"
    },
    {
      "customerName": "Elizabeth Bailey",
      "company": "Prime Time Telecom",
      "orderValue": "\$564",
      "orderDate": "08/08/2023",
      "status": "In-progress"
    },
    {
      "customerName": "Ryan Brown",
      "company": "OmniTech Corporation",
      "orderValue": "\$541",
      "orderDate": "31/08/2023",
      "status": "In-progress"
    },
    {
      "customerName": "Ryan Young",
      "company": "DataStream Inc.",
      "orderValue": "\$769",
      "orderDate": "01/05/2023",
      "status": "Completed"
    },
    {
      "customerName": "Hailey Adams",
      "company": "FlowRush",
      "orderValue": "\$922",
      "orderDate": "10/06/2023",
      "status": "Completed"
    },
  ];

  int currentPage = 1;
  final int rowsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Import and Export Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadButton.outline(
                onPressed: () {
                  showShadSheet(
                    context: context,
                    builder: (context) => const EditProfileAdminSheet(
                      side: ShadSheetSide.bottom,
                    ),
                  );
                },
                child: const Text("Add New Admin"),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 16),

          // Data Table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("CUSTOMER NAME")),
                  DataColumn(label: Text("COMPANY")),
                  DataColumn(label: Text("ORDER VALUE")),
                  DataColumn(label: Text("ORDER DATE")),
                  DataColumn(label: Text("STATUS")),
                  DataColumn(label: Text("")),
                ],
                rows: data.map((row) {
                  return DataRow(
                    cells: [
                      DataCell(Text(row["customerName"]!)),
                      DataCell(Text(row["company"]!)),
                      DataCell(Text(row["orderValue"]!)),
                      DataCell(Text(row["orderDate"]!)),
                      DataCell(_statusWidget(row["status"]!)),
                      const DataCell(Icon(Icons.edit, size: 16)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),

          // Pagination
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data.length} results",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: currentPage > 1
                        ? () {
                            setState(() {
                              currentPage--;
                            });
                          }
                        : null,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    currentPage.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  IconButton(
                    onPressed: currentPage < (data.length / rowsPerPage).ceil()
                        ? () {
                            setState(() {
                              currentPage++;
                            });
                          }
                        : null,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusWidget(String status) {
    Color backgroundColor;
    switch (status) {
      case "New":
        backgroundColor = Colors.blue[100]!;
        break;
      case "In-progress":
        backgroundColor = Colors.amber[100]!;
        break;
      case "Completed":
        backgroundColor = Colors.green[100]!;
        break;
      default:
        backgroundColor = Colors.grey[100]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
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
}
