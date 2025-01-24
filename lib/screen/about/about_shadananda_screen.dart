import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';
import '../../utils/theme.dart';

class AboutShadanandaScreen extends StatelessWidget {
  const AboutShadanandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              localizations.aboutShadanandaTitle,
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
                        title: localizations.aboutShadanandaIntroductionTitle,
                        content:
                            localizations.aboutShadanandaIntroductionContent,
                        icon: Icons.history_edu,
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoCard(
                        title: localizations.aboutShadanandaObjectiveTitle,
                        content: localizations.aboutShadanandaObjectiveContent,
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
    final localizations = AppLocalizations.of(context)!;

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
              title: Text(localizations.aboutShadanandaFacultiesTitle,
                  style: ShadTheme.of(context).textTheme.h4),
            ),
            ExpansionTile(
              title: Text(
                localizations.aboutShadanandaEducationFaculty,
                style: ShadTheme.of(context)
                    .textTheme
                    .p
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              children: [
                ListTile(
                  title: Text(
                      '• ${localizations.aboutShadanandaEducationSubject1}'),
                ),
                ListTile(
                    title: Text(
                        '• ${localizations.aboutShadanandaEducationSubject2}')),
                ListTile(
                  title: Text(
                      '• ${localizations.aboutShadanandaEducationSubject3}'),
                ),
                ListTile(
                  title: Text(
                      '• ${localizations.aboutShadanandaEducationSubject4}'),
                ),
                ListTile(
                  title: Text(
                      '• ${localizations.aboutShadanandaEducationSubject5}'),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                localizations.aboutShadanandaManagementFaculty,
                style: ShadTheme.of(context)
                    .textTheme
                    .p
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              children: [
                ListTile(
                  title: Text(
                    '• ${localizations.aboutShadanandaManagementCourses}',
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
    final localizations = AppLocalizations.of(context)!;

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
                localizations.aboutShadanandaServicesTitle,
                style: ShadTheme.of(context)
                    .textTheme
                    .h4
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      localizations.aboutShadanandaService1,
                      style: ShadTheme.of(context).textTheme.p.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: successColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      localizations.aboutShadanandaService2,
                      style: ShadTheme.of(context).textTheme.p.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      localizations.aboutShadanandaService3,
                      style: ShadTheme.of(context).textTheme.p.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      localizations.aboutShadanandaService4,
                      style: ShadTheme.of(context).textTheme.p.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      localizations.aboutShadanandaService5,
                      style: ShadTheme.of(context).textTheme.p.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
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
