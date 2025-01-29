import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/resource_util.dart';

class StudentCouncilMemberCard extends StatelessWidget {
  final Map<String, String> memberData;
  final String? defaultProfileImage;

  const StudentCouncilMemberCard({
    super.key,
    required this.memberData,
    this.defaultProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: defaultProfileImage != null
                      ? AssetImage(defaultProfileImage!)
                      : const NetworkImage(ResourceUtil.defaultProfileImage),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Member Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    memberData["Name"] ?? '',
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    memberData["Position"] ?? '',
                    style: ShadTheme.of(context).textTheme.p.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        memberData["Address"] ?? '',
                        style: ShadTheme.of(context)
                            .textTheme
                            .small
                            .copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        memberData["Contact No."] ?? '',
                        style: ShadTheme.of(context).textTheme.small.copyWith(
                              color: Colors.grey[600],
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
}
