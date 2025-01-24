import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';

class TeacherAboutScreen extends StatelessWidget {
  const TeacherAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations?.teacherScreenTitle ?? 'Campus Faculty',
          style: ShadTheme.of(context).textTheme.h3,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildCampusChiefCard(context, localizations),
                const SizedBox(height: 16),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampusChiefCard(
      BuildContext context, AppLocalizations? localizations) {
    return ShadCard(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  image: DecorationImage(
                    image: Assets.images.igNagendraBasnet.provider(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                localizations?.teacherChiefName ?? 'Nagendra Basnet',
                style: ShadTheme.of(context).textTheme.h4,
              ),
              Text(
                localizations?.teacherChiefPosition ?? 'Campus Chief',
                style: ShadTheme.of(context).textTheme.p,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              localizations?.teacherChiefDescription ??
                  'Mr. Nagendra Basnet serves as the Campus Chief, leading our institution with dedication and vision towards academic excellence.',
              style: ShadTheme.of(context).textTheme.p,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
