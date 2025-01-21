import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';

class AboutShadanandaScreen extends StatelessWidget {
  const AboutShadanandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'About Shadananda',
                style: ShadTheme.of(context).textTheme.h3,
              ),
              centerTitle: false,
              elevation: 2,
              pinned: true,
              floating: true,
              bottom: TabBar(
                indicatorWeight: 3,
                labelStyle: ShadTheme.of(context).textTheme.p.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                tabs: const [
                  Tab(icon: Icon(Icons.school), text: 'About Campus'),
                  Tab(icon: Icon(Icons.people), text: 'Contribution'),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: Assets.images.igCampusImage.provider(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildInfoCard(
                              title: 'Introduction',
                              content:
                                  'Shadananda Multiple Campus was established in 2067 BS in Dingla, Bhojpur, affiliated with Tribhuvan University.\n\n'
                                  'It is named after education reformer Balaguru Shadananda, who established Nepal\'s first community-run school. '
                                  'From this inspiration, we created an online library to support students and the community.\n',
                              icon: Icons.history_edu,
                              context: context,
                            ),
                            const SizedBox(height: 16),
                            _buildInfoCard(
                              title: 'Objective',
                              content:
                                  'The main objective is to provide quality higher education to residents of remote and northern areas of Bhojpur district, with special focus on women, Dalits, indigenous people, and marginalized groups.',
                              icon: Icons.track_changes,
                              context: context,
                            ),
                            const SizedBox(height: 16),
                            _buildFacultiesCard(context),
                            const SizedBox(height: 16),
                            _buildServicesCard(context),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(8),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image:
                                      Assets.images.igNagendraBasnet.provider(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildInfoCard(
                              title: 'Campus Chief',
                              content:
                                  'Mr. Nagendra Basnet serves as the Campus Chief, leading our institution with dedication and vision towards academic excellence.',
                              icon: Icons.person,
                              context: context,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image:
                                      Assets.images.igStudentCouncil.provider(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            _buildInfoCard(
                              title: 'Head of Free Student Union',
                              content:
                                  'Mr. Girija Karki is a dedicated and visionary leader who serves as the Head of the Free Student Union.\n'
                                  'Under his leadership, the union has initiated several programs aimed at empowering students and enhancing their overall college experience.\n',
                              icon: Icons.person,
                              context: context,
                            ),
                            _buildInfoCard(
                              title: 'Developer | Engineer of Shadananda',
                              content:
                                  'Deepesh Kalura is a talented developer and engineer who played a pivotal role in creating Shadananda\'s digital platforms. '
                                  'His dedication to innovation and quality has been instrumental in modernizing the campus\'s digital infrastructure.\n',
                              icon: Icons.code,
                              context: context,
                            ),
                            const SizedBox(height: 20),
                            _buildStudentCouncilTable(context),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacultiesCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.school, size: 32, color: Colors.blue),
              title: Text('Academic Faculties',
                  style: ShadTheme.of(context).textTheme.h4),
            ),
            ExpansionTile(
              title: Text(
                'Education',
                style: ShadTheme.of(context)
                    .textTheme
                    .p
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              children: const [
                ListTile(title: Text('• English')),
                ListTile(title: Text('• Nepali')),
                ListTile(title: Text('• Economics')),
                ListTile(title: Text('• Health')),
                ListTile(title: Text('• Population Studies')),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Management',
                style: ShadTheme.of(context)
                    .textTheme
                    .p
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              children: const [
                ListTile(
                  title: Text(
                    '• Bachelor Level Courses',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesCard(BuildContext context) {
    const services = [
      'Quality Education with focus on student academic excellence',
      'Annual and Internal Examination System',
      'Well-equipped Computer Lab with basic computer education',
      'Library and E-Library Services',
      'Free higher education for eligible first-year students',
    ];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.star, size: 32, color: Colors.amber),
              title: Text(
                'Our Services',
                style: ShadTheme.of(context)
                    .textTheme
                    .h4
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            ...services.map((service) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          service,
                          style: ShadTheme.of(context).textTheme.p.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentCouncilTable(BuildContext context) {
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
              'Student Council 2081',
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
                          'S.N',
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
                          'Name',
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
                ...councilData.map((member) => TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(member["S.N."]!),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(member["Name"]!),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(member["Position"]!),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(member["Roll No."]!),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required IconData icon,
    required BuildContext context,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: Colors.blue),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: ShadTheme.of(context).textTheme.large,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: ShadTheme.of(context).textTheme.p,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
