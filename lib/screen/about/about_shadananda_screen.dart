import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';

class AboutShadanandaScreen extends StatelessWidget {
  const AboutShadanandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
          SliverFillRemaining(
            child: CustomScrollView(
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
          ),
        ],
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
