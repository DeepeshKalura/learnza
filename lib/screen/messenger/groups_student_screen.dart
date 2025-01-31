import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/screen/universal/success_universal_screen.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:uuid/uuid.dart';

import '../../model/app_enums.dart';
import '../../model/groups/groups_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/state/groups/groups_state_provider.dart';
import '../../router/app_urls.dart';
import '../../utils/theme.dart';
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
      _showErrorSnackBar(context, 'Please log in to create a group');
      return;
    }

    try {
      final String groupId = const Uuid().v4();

      if (_groupsProvider.groupAvatarImage != null) {
        String imageUrl = await _groupsProvider.uploadGroupImage(
            _groupsProvider.groupAvatarImage!, groupId);

        final newGroup = GroupsModel(
          id: groupId,
          name: _groupNameController.text.trim(),
          description: _groupDescriptionController.text.trim(),
          members: [
            GroupMember(
              id: currentUser.uid,
              role: GroupRole.admin,
            ),
          ],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          privacy: _selectedPrivacy,
          imageUrl: imageUrl,
        );

        await _groupsProvider.createGroup(newGroup);
      }
      _resetForm();
      if (mounted) {
        context.pop();
        _showSuccessSnackBar(
          context,
          "Group ${_groupNameController.text} created successfully",
        );
      }
    } catch (e) {
      _showErrorSnackBar(
        context,
        'Failed to create group: ${e.toString()}',
      );
    }
  }

  void _resetForm() {
    _groupNameController.clear();
    _groupDescriptionController.clear();
    _selectedPrivacy = GroupPrivacy.private;
    _groupsProvider
      ..groupCoverImage = null
      ..groupAvatarImage = null;
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
        title: const Text(
          'Create Group',
          textAlign: TextAlign.left,
        ),
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
        child: Text(
          'Cancel',
          style: ShadTheme.of(context).textTheme.p,
        ),
      ),
      Consumer<GroupsStateProvider>(
        builder: (context, provider, _) => ShadButton(
          width: 100,
          onPressed: provider.isLoading ? null : () => _createGroup(),
          child: provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                      color: ShadTheme.of(context).colorScheme.background),
                )
              : Text(
                  'Create',
                  style: ShadTheme.of(context).textTheme.p.copyWith(
                        color: ShadTheme.of(context).colorScheme.background,
                      ),
                ),
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
            // _buildCoverImageSection(),
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
          return const Center(
            child: Text('No groups found'),
          );
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
          elevation: 2, // Slightly increased elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // More rounded corners
          ),
          child: Hero(
            tag: group.id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ShadTheme.of(context).colorScheme.muted,
                    ShadTheme.of(context).colorScheme.muted.withOpacity(
                          0.5,
                        ), // More contrast
                  ],
                  stops: const [0.2, 1.0], // Gradient distribution
                ),
              ),
              child: Stack(
                children: [
                  // Improved privacy indicator
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: group.privacy == GroupPrivacy.private
                            ? Colors.black.withOpacity(0.1)
                            : Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: group.privacy == GroupPrivacy.private
                              ? Colors.black.withOpacity(0.2)
                              : Colors.green.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            group.privacy == GroupPrivacy.private
                                ? Icons.lock_outline
                                : Icons.public,
                            size: 16,
                            color: group.privacy == GroupPrivacy.private
                                ? Colors.black54
                                : Colors.green,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            group.privacy == GroupPrivacy.private
                                ? 'Private'
                                : 'Public',
                            style: ShadTheme.of(context).textTheme.p.copyWith(
                                  fontSize: 12,
                                  color: group.privacy == GroupPrivacy.private
                                      ? Colors.black54
                                      : Colors.green,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20), // Increased padding
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Enhanced Avatar with better shadow
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                spreadRadius: 2,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 32, // Larger avatar
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
                                    style: ShadTheme.of(context)
                                        .textTheme
                                        .large
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                group.name,
                                style: ShadTheme.of(context)
                                    .textTheme
                                    .large
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18, // Larger font
                                    ),
                              ),
                              if (group.description != null) ...[
                                const SizedBox(height: 6),
                                Text(
                                  group.description!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: ShadTheme.of(context).textTheme.p,
                                ),
                              ],
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  _buildStat(
                                    context,
                                    Icons.people_outline,
                                    '${group.members.length} members',
                                  ),
                                  Container(
                                      height: 16,
                                      width: 1,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      color: ShadTheme.of(context)
                                          .colorScheme
                                          .secondary),
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
                        // Improved arrow with container
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ShadTheme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ShadTheme.of(context).colorScheme.secondary,
                            size: 20,
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
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: ShadTheme.of(context).textTheme.p.copyWith(
                fontSize: 13,
              ),
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

  void _showErrorSnackBar(BuildContext context, String message) {
    ShadToaster.of(context).show(
      ShadToast.destructive(
        title: const Text('Uh oh! Something went wrong'),
        description: Text(message),
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ShadToaster.of(context).show(
      ShadToast(
        title: const Text('Groups Successfully Created'),
        description: Text(message),
        backgroundColor: successColor,
      ),
    );
  }

  Widget _buildGroupImageSection() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer<GroupsStateProvider>(
          builder: (context, groupsProvider, _) {
            if (groupsProvider.groupAvatarImage != null) {
              return GestureDetector(
                onTap: groupsProvider.removeAvatarImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 28,
                      backgroundImage: FileImage(
                        File(groupsProvider.groupAvatarImage!.path),
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
                          onTap: groupsProvider.removeAvatarImage,
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
              onTap: groupsProvider.pickGroupAvatarImage,
              child: const CircleAvatar(
                maxRadius: 28,
                child: Icon(
                  Icons.image,
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
      title: Text(localizations?.groupsCardTitile ?? 'Messanger'),
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
      placeholder: const Text(
        'Optional group description',
      ),
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
            placeholder: const Text(
              'Select Privacy',
            ),
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
                          onTap: groupsProvider.removeCoverImage,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
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
                        UniversalAlert.commonErrorSheet(
                          context,
                          e.toString(),
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
                        style: ShadTheme.of(context).textTheme.p,
                      ),
                    ],
                  ),
                ),
                if (coverImage == null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Recommended size: 1200x400px',
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                  Text(
                    'Maximum size: 5MB',
                    style: ShadTheme.of(context).textTheme.small,
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
