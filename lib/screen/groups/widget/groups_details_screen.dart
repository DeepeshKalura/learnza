import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/app_enums.dart';
import '../../../model/groups/groups_model.dart';
import '../../../utils/resource_util.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key, required this.group});

  final GroupsModel group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Group Info'),
        actions: const [
          // TODO: add more options
          // IconButton(
          //   icon: const Icon(Icons.more_vert),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Group Header Section
            _buildGroupHeader(context),

            // Group Description Section
            _buildDescriptionSection(context),

            // Members Section
            _buildMembersSection(context),

            // Media, Links, and Docs Section
            // _buildMediaSection(),

            // Settings Section
            // _buildSettingsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cover Image Section
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              group.coverImageUrl ?? ResourceUtil.coverImage,
            ),
            fit: BoxFit.cover,
          )),
        ),

        // Profile Section with Avatar
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 60), // Space for avatar overflow
                Text(
                  group.name,
                  style: ShadTheme.of(context).textTheme.large.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.group,
                      size: 16,
                      color: Theme.of(context).hintColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${group.members.length} participants',
                      style: ShadTheme.of(context).textTheme.small.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      group.privacy == GroupPrivacy.private
                          ? Icons.lock_outline
                          : Icons.public,
                      size: 16,
                      color: Theme.of(context).hintColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      group.privacy.name,
                      style: ShadTheme.of(context).textTheme.small.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                  ],
                ),
                if (group.description != null) ...[
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      group.description!,
                      style: ShadTheme.of(context).textTheme.small,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),

        // Avatar overlapping the sections
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Center(
            child: Hero(
              tag: group.id,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ShadAvatar(
                  group.imageUrl ?? ResourceUtil.defaultProfileImage,
                  size: const Size(double.infinity, 80),
                  placeholder: Text(
                    group.name.substring(0, min(2, group.name.length)),
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: ShadTheme.of(context).textTheme.large),
          const SizedBox(height: 8),
          Text(group.description ?? 'Add group description',
              style: ShadTheme.of(context).textTheme.p),
        ],
      ),
    );
  }

  Widget _buildMembersSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${group.members.length} participants',
            style: ShadTheme.of(context).textTheme.p,
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: group.members.length,
            itemBuilder: (context, index) {
              final member = group.members[index];
              return ListTile(
                leading: const ShadAvatar(
                  ResourceUtil.defaultProfileImage,
                ),
                title: Text(
                  'Member ${member.id}',
                ),
                subtitle: Text(
                  member.role.toString().split('.').last,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMediaSection() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Media, links, and docs'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Mute notifications'),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          const ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Custom notifications'),
          ),
          const ListTile(
            leading: Icon(Icons.photo),
            title: Text('Media visibility'),
          ),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text('Encryption'),
            subtitle: Text('Messages are end-to-end encrypted'),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Disappearing messages'),
            subtitle: const Text('Off'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: Text('Block ${group.name}'),
            titleTextStyle: const TextStyle(color: Colors.red),
          ),
          ListTile(
            leading: const Icon(Icons.thumb_down),
            title: Text('Report ${group.name}'),
            titleTextStyle: const TextStyle(color: Colors.red),
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit group'),
            titleTextStyle: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
