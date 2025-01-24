import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';

class StudentUnionAboutScreen extends StatelessWidget {
  const StudentUnionAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations?.studentUnionTitle ?? 'Student Union',
          style: ShadTheme.of(context).textTheme.h3,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildStudentLeaderCard(context, localizations),
                const SizedBox(height: 16),
                _buildStudentCouncilTable(context, localizations),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentLeaderCard(
      BuildContext context, AppLocalizations? localizations) {
    return ShadCard(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: Assets.images.igStudentCouncil.provider(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                localizations?.studentUnionPresidentName ?? 'Girija Karki',
                style: ShadTheme.of(context).textTheme.h4,
              ),
              Text(
                localizations?.studentUnionPresidentPosition ??
                    'Student Union President',
                style: ShadTheme.of(context).textTheme.p,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              localizations?.studentUnionPresidentDescription ??
                  "Girija Karki, a visionary student of ANPA-5, leads as the president of the student union for 2081. He inspires change through dedication and active participation in college initiatives.",
              style: ShadTheme.of(context).textTheme.p,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCouncilTable(
      BuildContext context, AppLocalizations? localizations) {
    const List<Map<String, String>> councilData = [
      {
        "S.N.": "1",
        "Name": "Girija Karki",
        "Position": "President",
        "Roll No.": "ANPA-5"
      },
      {
        "S.N.": "2",
        "Name": "Bhuvan Khatri",
        "Position": "Vice President",
        "Roll No.": "ANPA-5"
      },
      {
        "S.N.": "3",
        "Name": "Romila Rai",
        "Position": "Secretary",
        "Roll No.": "ANPA-6"
      },
      {
        "S.N.": "4",
        "Name": "Rekha Baral",
        "Position": "Treasurer",
        "Roll No.": "ANPA-5"
      },
      {
        "S.N.": "5",
        "Name": "Asha Katwal",
        "Position": "Joint Secretary",
        "Roll No.": "ANPA-6"
      },
      {
        "S.N.": "6",
        "Name": "Tej B. Tamang",
        "Position": "Member",
        "Roll No.": "ANPA-8"
      },
      {
        "S.N.": "7",
        "Name": "Bhuvan Rai",
        "Position": "Member",
        "Roll No.": "ANPA-6"
      },
      {
        "S.N.": "8",
        "Name": "Ashmita Rai",
        "Position": "Member",
        "Roll No.": "ANPA-7"
      },
      {
        "S.N.": "9",
        "Name": "Dinesh Bishwokarma",
        "Position": "Member",
        "Roll No.": "ANPA-7"
      },
      {
        "S.N.": "10",
        "Name": "Karina Rai",
        "Position": "Member",
        "Roll No.": "ANPA-10"
      },
      {
        "S.N.": "11",
        "Name": "Sunita Bisht",
        "Position": "Member",
        "Roll No.": "ANPA-8"
      },
      {
        "S.N.": "12",
        "Name": "Bhumi Raj Dhakal",
        "Position": "Member",
        "Roll No.": "ANPA-6"
      },
      {
        "S.N.": "13",
        "Name": "Surya Rai",
        "Position": "Member",
        "Roll No.": "ANPA-8"
      },
      {
        "S.N.": "14",
        "Name": "Vijay Rai",
        "Position": "Member",
        "Roll No.": "ANPA-5"
      },
      {
        "S.N.": "15",
        "Name": "Pooja Baral",
        "Position": "Member",
        "Roll No.": "ANPA-7"
      },
    ];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              localizations?.studentUnionCouncilTitle ?? 'Student Council 2081',
              style: ShadTheme.of(context)
                  .textTheme
                  .h3
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              columnWidths: const {
                0: FlexColumnWidth(0.6),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(1.2),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          localizations?.studentUnionTableHeaderSn ?? 'S.N',
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ShadTheme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          localizations?.studentUnionTableHeaderName ?? 'Name',
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ShadTheme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          localizations?.studentUnionTableHeaderPosition ??
                              'Position',
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ShadTheme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          localizations?.studentUnionTableHeaderRollNo ??
                              'Roll No.',
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ShadTheme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...councilData.map(
                  (member) => TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(member["S.N."] ?? ''),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(member["Name"] ?? ''),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(member["Position"] ?? ''),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(member["Roll No."] ?? ''),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
