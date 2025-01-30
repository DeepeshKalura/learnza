import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';

class TeacherAboutScreen extends StatefulWidget {
  const TeacherAboutScreen({super.key});

  @override
  State<TeacherAboutScreen> createState() => _TeacherAboutScreenState();
}

class _TeacherAboutScreenState extends State<TeacherAboutScreen> {
  final Map<String, Map<String, String?>> facultyData = {
    "BBS": {
      "Rita Khadka": "9849049788",
      "Dambar B. Bista": "9842147291",
      "Kabita Pariyar": null,
      "Susmita Khatiwada": "9842366065",
      "Hem Prakash Adhikari": "9862185006",
    },
    "Education": {
      "Madab Neupane": "984259499",
      "Gobinda Khadka": "9841880969",
    },
    "Engineering": {
      "Kedar Koirala": "9842097935",
      "Nabin Pokhrel": "9852035877",
      "Dipak Bhujel": "9852052575",
    },
    "HP": {
      "Naresh Mandal": "9842378435",
    },
    "Nepali": {
      "Iswar Gautam": "9842082649",
      "Bisnu Kumari Bhujel": "9842508166",
      "Resma Biswakarma": "98621128025",
      "Sabin Lamsal": "9842343069",
    },
    "Population": {
      "Pratibha Khadka": "9842157048",
      "Pawan Khadka": "9844343103",
    },
    "Administration": {
      "Nagendra Basnet (Chief of Campus)": "9842145705",
      "Harka B. Shrestha (Assistant Campus)": "9840847056",
    }
  };

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = ShadTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          localizations?.teacherScreenTitle ?? 'Campus Faculty',
          style: theme.textTheme.h3,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          // Administration Section
          _buildAdministrationCard(theme),
          const SizedBox(height: 24),

          // Department Sections
          ...facultyData.entries
              .where((entry) => entry.key != 'Administration')
              .map((department) => Column(
                    children: [
                      _buildDepartmentCard(
                        theme: theme,
                        departmentName: department.key,
                        facultyMembers: department.value,
                      ),
                      const SizedBox(height: 16),
                    ],
                  )),
        ],
      ),
    );
  }

  Widget _buildAdministrationCard(ShadThemeData theme) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Administration',
              style: theme.textTheme.h4.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            _buildChiefProfile(theme),
            const SizedBox(height: 16),
            _buildAssistantProfile(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildChiefProfile(ShadThemeData theme) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: DecorationImage(
              image: Assets.images.igNagendraBasnet.provider(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nagendra Basnet',
                style: theme.textTheme.h4,
              ),
              const SizedBox(height: 4),
              Text(
                'Chief of Campus',
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Contact: 9842145705',
                style: theme.textTheme.p,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAssistantProfile(ShadThemeData theme) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(
          Icons.person,
        ),
      ),
      title: Text(
        'Harka B. Shrestha',
        style: theme.textTheme.p,
      ),
      subtitle: const Text(
        'Assistant Campus • 9840847056',
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildDepartmentCard({
    required ShadThemeData theme,
    required String departmentName,
    required Map<String, String?> facultyMembers,
  }) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              departmentName,
              style: theme.textTheme.h4.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            ...facultyMembers.entries.map(
              (faculty) => ListTile(
                leading: CircleAvatar(
                  child: Text(
                    faculty.key.substring(0, 1),
                  ),
                ),
                title: Text(faculty.key, style: theme.textTheme.p),
                subtitle: Text(faculty.value ?? 'No contact available'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
