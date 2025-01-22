import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:uuid/uuid.dart';

import '../../model/app_enums.dart';
import '../../model/groups/groups_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/state/groups/groups_state_provider.dart';
import '../../router/app_urls.dart';
import '../common/widget/drawer_widget.dart';
import 'error/groups_error_widget.dart';

class GroupsStudentScreen extends StatefulWidget {
  const GroupsStudentScreen({super.key});

  @override
  State<GroupsStudentScreen> createState() => _GroupsStudentScreenState();
}

class _GroupsStudentScreenState extends State<GroupsStudentScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<ShadFormState>();
  late final GroupsStateProvider _groupsProvider;

  final _groupNameController = TextEditingController();
  final _groupDescriptionController = TextEditingController();
  final _popoverController = ShadPopoverController();

  GroupPrivacy _selectedPrivacy = GroupPrivacy.private;
  String? _error;

  @override
  void initState() {
    super.initState();
    _groupsProvider = context.read<GroupsStateProvider>();
    _loadGroups();
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupDescriptionController.dispose();
    _popoverController.dispose();
    super.dispose();
  }

  Future<void> _loadGroups() async {
    try {
      await _groupsProvider.getTheGroup();
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  Future<void> _createGroup() async {
    if (!_formKey.currentState!.validate()) return;

    final currentUser = context.read<AuthProvider>().user;
    if (currentUser == null) {
      _showErrorSnackBar('Please log in to create a group');
      return;
    }

    try {
      final newGroup = GroupsModel(
        id: const Uuid().v4(),
        name: _groupNameController.text.trim(),
        description: _groupDescriptionController.text.trim(),
        members: [
          GroupMember(id: currentUser.uid, role: GroupRole.admin),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        privacy: _selectedPrivacy,
      );

      await _groupsProvider.createGroup(newGroup);
      _resetForm();
      if (mounted) {
        context.pop();
        _showSuccessSnackBar('Group "${newGroup.name}" created successfully');
      }
    } catch (e) {
      _showErrorSnackBar('Failed to create group: ${e.toString()}');
    }
  }

  void _resetForm() {
    _groupNameController.clear();
    _groupDescriptionController.clear();
    _selectedPrivacy = GroupPrivacy.private;
    _groupsProvider
      ..groupCoverImage = null
      ..groupImage = null;
  }

  void _showCreateGroupDialog() {
    showShadDialog(
      context: context,
      builder: (context) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, _) => _resetForm(),
        child: _buildCreateGroupDialog(),
      ),
    );
  }

  Widget _buildCreateGroupDialog() {
    return Container(
      margin: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 500),
      child: ShadDialog(
        shadows: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        radius: BorderRadius.circular(10),
        actionsAxis: Axis.horizontal,
        title: const Text('Create Group', textAlign: TextAlign.left),
        actions: _buildDialogActions(),
        child: _buildDialogContent(),
      ),
    );
  }

  List<Widget> _buildDialogActions() {
    return [
      ShadButton.outline(
        width: 100,
        onPressed: () {
          _resetForm();
          context.pop();
        },
        child: const Text('Cancel',
            style: TextStyle(color: Colors.black, fontSize: 15)),
      ),
      Consumer<GroupsStateProvider>(
        builder: (context, provider, _) => ShadButton(
          width: 100,
          onPressed: provider.isLoading ? null : () => _createGroup(),
          child: provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white))
              : const Text('Create',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
        ),
      ),
    ];
  }

  Widget _buildDialogContent() {
    return ShadForm(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildGroupImageSection(),
            const SizedBox(height: 10),
            _buildDescriptionField(),
            const SizedBox(height: 10),
            _buildPrivacySection(),
            const SizedBox(height: 10),
            _buildCoverImageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupList() {
    return Consumer<GroupsStateProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_error != null) {
          return GroupsErrorWidget(
            error: _error!,
            onRetry: _loadGroups,
          );
        }

        if (provider.groups.isEmpty) {
          return const Center(child: Text('No groups found'));
        }

        return ListView.builder(
          itemCount: provider.groups.length,
          itemBuilder: (context, index) =>
              _buildGroupCard(provider.groups[index]),
        );
      },
    );
  }

  Widget _buildGroupCard(GroupsModel group) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppUrls.groupMessageStudentScreen,
        extra: {'group': group},
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Hero(
            tag: group.id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ShadTheme.of(context).colorScheme.muted,
                    ShadTheme.of(context).colorScheme.muted.withOpacity(0.7),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Privacy indicator with subtle background
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ShadTheme.of(context)
                            .colorScheme
                            .muted
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        group.privacy == GroupPrivacy.private
                            ? Icons.lock_outline
                            : Icons.public,
                        size: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Enhanced Avatar section
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius:
                                28, // Slightly smaller for better proportions
                            backgroundColor: ShadTheme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            backgroundImage: group.imageUrl != null
                                ? NetworkImage(group.imageUrl!)
                                : null,
                            child: group.imageUrl == null
                                ? Text(
                                    group.name.substring(0, 2).toUpperCase(),
                                    style: ShadTheme.of(context).textTheme.p,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Refined Content section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                group.name,
                                style: ShadTheme.of(context).textTheme.large,
                              ),
                              if (group.description != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  group.description!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: ShadTheme.of(context).textTheme.p,
                                ),
                              ],
                              const SizedBox(height: 8),
                              // Enhanced stats row
                              Row(
                                children: [
                                  _buildStat(
                                    context,
                                    Icons.people_outline,
                                    '${group.members.length}',
                                  ),
                                  const SizedBox(width: 16),
                                  _buildStat(
                                    context,
                                    Icons.calendar_today_outlined,
                                    _formatDate(group.createdAt),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Refined arrow icon
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: ShadTheme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.5),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStat(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: ShadTheme.of(context).colorScheme.secondary.withOpacity(0.6),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: ShadTheme.of(context).textTheme.p,
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = constraints.maxWidth > 600;
        return Scaffold(
          key: _scaffoldKey,
          drawer: const DrawerWidget(currentIndex: 2),
          body: CustomScrollView(
            slivers: [
              _buildAppBar(isWeb, localizations),
              SliverFillRemaining(child: _buildGroupList()),
            ],
          ),
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  Widget _buildGroupImageSection() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer<GroupsStateProvider>(
          builder: (context, groupsProvider, _) {
            if (groupsProvider.groupImage != null) {
              return GestureDetector(
                onTap: groupsProvider.removeGroupImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 28,
                      backgroundImage: FileImage(
                        File(groupsProvider.groupImage!.path),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: groupsProvider.removeGroupImage,
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return GestureDetector(
              onTap: groupsProvider.pickGroupCoverImage,
              child: const CircleAvatar(
                maxRadius: 28,
                child: Icon(
                  Icons.image,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ShadInputFormField(
            id: 'groupName',
            label: const Text("Group Name"),
            placeholder: const Text("Enter group name"),
            controller: _groupNameController,
            validator: (value) =>
                value.isEmpty ? 'Group name cannot be empty' : null,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(bool isWeb, AppLocalizations? localizations) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      title: Text(localizations?.groupsCardTitile ?? 'Groups'),
      actions: [
        ShadButton(
          icon: const Icon(Icons.add),
          onPressed: _showCreateGroupDialog,
        ),
        if (isWeb) ...[
          // TODO: Add the buildNavigationItem heloper Function
        ],
      ],
    );
  }

  Widget _buildDescriptionField() {
    return ShadInputFormField(
      id: 'groupDescription',
      label: const Text("Description"),
      controller: _groupDescriptionController,
      placeholder: const Text('Optional group description'),
      maxLines: 4,
    );
  }

  Widget _buildPrivacySection() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Group Privacy',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Expanded(child: SizedBox(width: 12)),
        Align(
          alignment: Alignment.topRight,
          child: ShadSelect<GroupPrivacy>(
            controller: _popoverController,
            placeholder: const Text('Select Privacy'),
            initialValue: _selectedPrivacy,
            options: [
              ...GroupPrivacy.values.map(
                (privacy) => ShadOption(
                  value: privacy,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _getPrivacyDisplayText(privacy),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        _getPrivacyDescription(privacy),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      if (privacy != GroupPrivacy.values.last) const Divider(),
                    ],
                  ),
                ),
              )
            ],
            selectedOptionBuilder: (context, value) {
              return Text(_getPrivacyDisplayText(value));
            },
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedPrivacy = value);
              }
            },
          ),
        ),
      ],
    );
  }

  String _getPrivacyDisplayText(GroupPrivacy privacy) {
    switch (privacy) {
      case GroupPrivacy.public:
        return 'Public';
      case GroupPrivacy.private:
        return 'Private';
      case GroupPrivacy.restricted:
        return 'Restricted';
    }
  }

  String _getPrivacyDescription(GroupPrivacy privacy) {
    switch (privacy) {
      case GroupPrivacy.public:
        return 'Anyone can see and join the group';
      case GroupPrivacy.private:
        return 'Only members can see posts, approval required to join';
      case GroupPrivacy.restricted:
        return 'Only members can see posts, approval required to join';
    }
  }

  Widget _buildCoverImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cover Image',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Consumer<GroupsStateProvider>(
          builder: (context, groupsProvider, _) {
            final coverImage = groupsProvider.groupCoverImage;

            return Column(
              children: [
                if (coverImage != null) ...[
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(coverImage.path),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: groupsProvider.removeImage,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
                ShadButton.outline(
                  onPressed: () async {
                    try {
                      await groupsProvider.pickGroupCoverImage();
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Error picking image: ${e.toString()}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.image),
                      const SizedBox(width: 8),
                      Text(
                        coverImage == null
                            ? 'Select Cover Image'
                            : 'Change Cover Image',
                      ),
                    ],
                  ),
                ),
                if (coverImage == null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Recommended size: 1200x400px',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    'Maximum size: 5MB',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}
