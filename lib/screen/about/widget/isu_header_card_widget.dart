import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ISUHeaderCardWidget extends StatelessWidget {
  const ISUHeaderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Independent Students\' Union (ISU)',
              style: ShadTheme.of(context)
                  .textTheme
                  .h3
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'The Independent Students\' Union (ISU) is an organization representing students actively engaged in universities, campuses, and educational institutions in Nepal. The primary objective of this organization is to protect the rights, interests, and welfare of students while raising a strong voice on educational and social issues.',
              style: ShadTheme.of(context).textTheme.p,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: ShadTheme.of(context).colorScheme.mutedForeground,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Shree Shadananda Multiple Campus, Koshi Province, Dingla, Bhojpur',
                    maxLines: 2,
                    style: ShadTheme.of(context).textTheme.small.copyWith(
                          color:
                              ShadTheme.of(context).colorScheme.mutedForeground,
                        ),
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
