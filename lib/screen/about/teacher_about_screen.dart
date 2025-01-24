import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';

class TeacherAboutScreen extends StatelessWidget {
  const TeacherAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campus Faculty',
          style: ShadTheme.of(context).textTheme.h3,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildCampusChiefCard(context),
                const SizedBox(height: 16),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampusChiefCard(BuildContext context) {
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
                'Nagendra Basnet',
                style: ShadTheme.of(context).textTheme.h4,
              ),
              Text(
                'Campus Chief',
                style: ShadTheme.of(context).textTheme.p,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
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
