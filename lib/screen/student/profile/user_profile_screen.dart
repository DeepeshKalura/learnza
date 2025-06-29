import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/app_enums.dart';
import '../../../model/users/users_model.dart';
import '../../../utils/resource_util.dart';
import '../../common/widget/custom_image_widget.dart';

class UserProfileScreen extends StatelessWidget {
  final UsersModel user;

  const UserProfileScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  // Profile Image
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          color: Colors.grey.shade200,
                        ),
                        child: CustomImageWidget(
                          imageUrl: user.profileImageURL,
                          defaultImageAsset: ResourceUtil.defaultProfileImage,
                        ),
                      ),
                      // Online indicator
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: user.isOnline ? Colors.green : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // User Name and Role
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),

                  // Role badge
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getRoleColor(user.role),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _getRoleText(user.role),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  if (user.title != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      user.title!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // User Info Sections
            const SizedBox(height: 16),
            _buildInfoSection(
              context: context,
              title: 'Contact Information',
              items: [
                _InfoItem(
                  icon: Icons.email,
                  title: 'Email',
                  value: user.email,
                ),
                if (user.phoneNumber != null)
                  _InfoItem(
                    icon: Icons.phone,
                    title: 'Phone',
                    value: user.phoneNumber!,
                  ),
                if (user.address != null)
                  _InfoItem(
                    icon: Icons.location_on,
                    title: 'Address',
                    value: user.address!,
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // Academic Information
            if (user.role == UserRole.student) ...[
              _buildInfoSection(
                context: context,
                title: 'Academic Information',
                items: [
                  _InfoItem(
                    icon: Icons.group,
                    title: 'Batch',
                    value: user.batch ?? "N/A",
                  ),
                  if (user.departmentId != null)
                    _InfoItem(
                      icon: Icons.business,
                      title: 'Department',
                      value: user.departmentId ?? "N?A",
                    ),
                  if (user.motherName != null)
                    _InfoItem(
                      icon: Icons.person,
                      title: 'Mother\'s Name',
                      value: user.motherName ?? "N/A",
                    ),
                  if (user.fatherName != null)
                    _InfoItem(
                      icon: Icons.person,
                      title: 'Father\'s Name',
                      value: user.fatherName ?? "N/A",
                    ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            // Teacher Information
            if (user.role == UserRole.teacher && user.courseId != null) ...[
              _buildInfoSection(
                context: context,
                title: 'Teaching Information',
                items: [
                  _InfoItem(
                    icon: Icons.book,
                    title: 'Course',
                    value: user.courseId!,
                  ),
                  if (user.departmentId != null)
                    _InfoItem(
                      icon: Icons.business,
                      title: 'Department',
                      value: user.departmentId!,
                    ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            // Account Information
            _buildInfoSection(
              context: context,
              title: 'Account Information',
              items: [
                _InfoItem(
                  icon: Icons.calendar_today,
                  title: 'Joined',
                  value: DateFormat('MMMM dd, yyyy').format(user.createdAt),
                ),
                _InfoItem(
                  icon: Icons.access_time,
                  title: 'Last Seen',
                  value: user.lastSeen ?? 'Unknown',
                ),
                _InfoItem(
                  icon: Icons.verified_user,
                  title: 'Account Status',
                  value: user.isActive ? 'Active' : 'Inactive',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // TODO: Action Buttons
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: ElevatedButton.icon(
            //           onPressed: () {
            //             // Implementation for message function
            //           },
            //           icon: const Icon(Icons.message),
            //           label: const Text('Message'),
            //           style: ElevatedButton.styleFrom(
            //             padding: const EdgeInsets.symmetric(vertical: 12),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 12),
            //       Expanded(
            //         child: OutlinedButton.icon(
            //           onPressed: () {
            //             // Implementation for block/unblock function
            //           },
            //           icon: Icon(
            //             user.blockedUsers.isNotEmpty
            //                 ? Icons.person_add
            //                 : Icons.block,
            //           ),
            //           label: Text(
            //             user.blockedUsers.isNotEmpty ? 'Unblock' : 'Block',
            //           ),
            //           style: OutlinedButton.styleFrom(
            //             padding: const EdgeInsets.symmetric(vertical: 12),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required BuildContext context,
    required String title,
    required List<_InfoItem> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                indent: 56,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  subtitle: Text(
                    item.value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  dense: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getRoleText(UserRole role) {
    switch (role) {
      case UserRole.student:
        return 'Student';
      case UserRole.teacher:
        return 'Teacher';
      case UserRole.admin:
        return 'Admin';
      default:
        return 'User';
    }
  }

  Color _getRoleColor(UserRole role) {
    switch (role) {
      case UserRole.student:
        return Colors.blue;
      case UserRole.teacher:
        return Colors.green;
      case UserRole.admin:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

class _InfoItem {
  final IconData icon;
  final String title;
  final String value;

  _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });
}
