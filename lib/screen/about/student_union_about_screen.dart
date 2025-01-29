import 'package:feedback_github/feedback_github.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../app_config.dart';
import '../../gen/assets.gen.dart';
import 'widget/isu_header_card_widget.dart';
import 'widget/student_council_member_card.dart';

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
        actions: [
          IconButton(
            icon: const Icon(
              LucideIcons.messageSquare,
            ),
            tooltip: 'Send Feedback',
            onPressed: () {
              final githubtoken = di.injector<AppConfig>().githubToken;
              final repoUrl = di.injector<AppConfig>().repoUrl;
              BetterFeedback.of(context).showAndUploadToGitHub(
                repoUrl: repoUrl,
                gitHubToken: githubtoken,
                deviceInfo: true,
                packageInfo: true,
                labels: ['feedback', 'issue', 'enhancement', 'bug'],
                extraData: StackTrace.current.toString(),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const ISUHeaderCardWidget(),
                const SizedBox(height: 16),
                _buildStudentCouncilTable(context, localizations),
              ]),
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
        "Position": "Chairman",
        "Address": "Sha. Na. Pa.-5",
        "Contact No.": "9866467570"
      },
      {
        "S.N.": "2",
        "Name": "Bhuwan Khatri",
        "Position": "Vice President",
        "Address": "Sha. Na. Pa.-8",
        "Contact No.": "9869683330"
      },
      {
        "S.N.": "3",
        "Name": "Romila Rai",
        "Position": "Secretary",
        "Address": "Sha. Na. Pa.-1",
        "Contact No.": "9761635150"
      },
      {
        "S.N.": "4",
        "Name": "Renuka Basnet",
        "Position": "Treasurer",
        "Address": "Sha. Na. Pa.-6",
        "Contact No.": "9861740168"
      },
      {
        "S.N.": "5",
        "Name": "Asha Katwal",
        "Position": "Joint Secretary",
        "Address": "Sha. Na. Pa.-6",
        "Contact No.": "9862819352"
      },
      {
        "S.N.": "6",
        "Name": "Top B. Tamang",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-4",
        "Contact No.": "9842993405"
      },
      {
        "S.N.": "7",
        "Name": "Bhuwan Rai",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-6",
        "Contact No.": "9863348041"
      },
      {
        "S.N.": "8",
        "Name": "Asmita Rai",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-4",
        "Contact No.": "9765966292"
      },
      {
        "S.N.": "9",
        "Name": "Dinesh Bishwakarma",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-7",
        "Contact No.": "9842043841"
      },
      {
        "S.N.": "10",
        "Name": "Kareena Rai",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-10",
        "Contact No.": "9749927768"
      },
      {
        "S.N.": "11",
        "Name": "Sunita Bista",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-8",
        "Contact No.": "984412977"
      },
      {
        "S.N.": "12",
        "Name": "Bhumiraj Dhakal",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-6",
        "Contact No.": "9865727650"
      },
      {
        "S.N.": "13",
        "Name": "Suraj Rai",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-4",
        "Contact No.": "9865164330"
      },
      {
        "S.N.": "14",
        "Name": "Vijay Rai",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-5",
        "Contact No.": "9742437841"
      },
      {
        "S.N.": "15",
        "Name": "Pooja Basnet",
        "Position": "Member",
        "Address": "Sha. Na. Pa.-7",
        "Contact No.": "9823766244"
      },
    ];

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              localizations?.studentUnionCouncilTitle ??
                  'Student Union Election 2079',
              style: ShadTheme.of(context)
                  .textTheme
                  .h3
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: councilData.length,
              itemBuilder: (context, index) {
                final member = councilData[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: StudentCouncilMemberCard(
                    memberData: member,
                    defaultProfileImage:
                        index == 0 ? Assets.images.igStudentCouncil.path : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
