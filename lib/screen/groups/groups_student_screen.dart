import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

import '../../model/app_enums.dart';
import '../../model/groups/groups_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/groups_provider.dart';
import '../../router/app_urls.dart';
import '../../utils/theme.dart';
import '../common/widget/drawer_widget.dart';
import '../post/widget/build_navigation.dart';

class GroupsStudentScreen extends StatefulWidget {
  const GroupsStudentScreen({super.key});

  @override
  State<GroupsStudentScreen> createState() => _GroupsStudentScreenState();
}

class _GroupsStudentScreenState extends State<GroupsStudentScreen> {
  final scafoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<ShadFormState>();

  final _groupNameController = TextEditingController();
  final _groupDescriptionController = TextEditingController();
  GroupPrivacy _selectedPrivacy = GroupPrivacy.private;
  final _shadPopoverController = ShadPopoverController();

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupDescriptionController.dispose();
    super.dispose();
  }

  void _showCreateGroupDialog() {
    showShadDialog(
      context: context,
      builder: (context) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, Object? result) {
          _groupNameController.clear();
          _groupDescriptionController.clear();
          context.read<GroupsProvider>().groupCoverImage = null;
          context.read<GroupsProvider>().groupImage = null;
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: ShadDialog(
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
            radius: BorderRadius.circular(10),
            actionsAxis: Axis.horizontal,
            title: const Text(
              'Create Group',
              textAlign: TextAlign.left,
            ),
            actions: [
              ShadButton.outline(
                width: 100,
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  _groupNameController.clear();
                  _groupDescriptionController.clear();
                  context.read<GroupsProvider>().groupCoverImage = null;
                  context.read<GroupsProvider>().groupImage = null;
                  context.pop();
                },
              ),
              Consumer<GroupsProvider>(
                builder: (context, groupsProvider, child) {
                  return ShadButton(
                    width: 100,
                    onPressed: groupsProvider.isLoading
                        ? null
                        : () => _createGroup(context, groupsProvider),
                    child: groupsProvider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Create',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                  );
                },
              ),
            ],
            child: ShadForm(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Consumer<GroupsProvider>(
                          builder: (context, groupsProvider, child) {
                            if (groupsProvider.groupImage != null) {
                              return GestureDetector(
                                onTap: groupsProvider.removeGroupImage,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 28,
                                      backgroundImage: FileImage(
                                        File(
                                          groupsProvider.groupImage!.path,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: groupsProvider.removeGroupImage,
                                      child: Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: groupsProvider.removeImage,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: groupsProvider.pickGroupCoverImage,
                                child: const CircleAvatar(
                                  maxRadius: 28,
                                  child: Icon(
                                    LucideIcons.image,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const CircleAvatar(
                            maxRadius: 28,
                            child: Icon(
                              LucideIcons.image,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ShadInputFormField(
                            id: 'groupName',
                            label: const Text("Group Name"),
                            placeholder: const Text(
                              "Enter group name",
                            ),
                            controller: _groupNameController,
                            validator: (value) => value.isEmpty == true
                                ? 'Group name cannot be empty'
                                : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ShadInputFormField(
                      label: const Text("Description"),
                      controller: _groupDescriptionController,
                      placeholder: const Text(
                        'Optional group description',
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Cover Image',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(
                            width: 12,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: ShadSelect<GroupPrivacy>(
                            controller: _shadPopoverController,
                            placeholder: const Text('Select Group Privacy'),
                            options: [
                              ...GroupPrivacy.values.map(
                                (privacy) => ShadOption(
                                  value: privacy,
                                  child: Column(
                                    children: [
                                      Text(
                                        privacy.toString().split('.').last,
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                ),
                              )
                            ],
                            selectedOptionBuilder: (context, value) {
                              return Text(value.toString().split('.').last);
                            },
                            onChanged: (value) {
                              if (value != null) {
                                _selectedPrivacy = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Consumer<GroupsProvider>(
                      builder: (context, groupsProvider, child) {
                        final thumbnail = groupsProvider.groupCoverImage;
                        return Column(
                          children: [
                            if (thumbnail != null) ...[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(thumbnail.path),
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () => groupsProvider.removeImage(),
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
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
                            ],
                            ShadButton.outline(
                              onPressed: groupsProvider.pickImage,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(LucideIcons.image),
                                  const SizedBox(width: 8),
                                  Text(
                                    thumbnail == null
                                        ? 'Select Group Image'
                                        : 'Change Group Image',
                                  ),
                                ],
                              ),
                            ),
                            if (thumbnail == null) ...[
                              const SizedBox(height: 8),
                              Text(
                                'Recommended size: 1200x1200px',
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
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createGroup(BuildContext context, GroupsProvider groupsProvider) async {
    // Validate form
    if (_formKey.currentState!.validate()) {
      try {
        // Get current user
        final currentUser = context.read<AuthProvider>().user;
        if (currentUser == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please log in to create a group')),
          );
          return;
        }

        // Create group model
        final newGroup = GroupsModel(
          id: const Uuid().v4(),
          name: _groupNameController.text.trim(),
          description: _groupDescriptionController.text.trim(),
          adminIds: [currentUser.uid],
          memberIds: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          privacy: _selectedPrivacy,
          coverImageUrl: groupsProvider.groupCoverImage != null
              ? await groupsProvider
                  .uploadGroupImage(groupsProvider.groupCoverImage!)
              : null,
          imageUrl: groupsProvider.groupImage != null
              ? await groupsProvider
                  .uploadGroupImage(groupsProvider.groupCoverImage!)
              : null,
        );

        // Create the group
        await groupsProvider.createGroups(groupsModel: newGroup);

        // Clear input fields
        _groupNameController.clear();
        _groupDescriptionController.clear();

        _selectedPrivacy = GroupPrivacy.private;

        context.read<GroupsProvider>().groupCoverImage = null;
        context.read<GroupsProvider>().groupImage = null;

        // Close dialog
        if (context.mounted) context.pop();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Group "${newGroup.name}" created successfully',
            ),
          ),
        );
      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to create group: ${e.toString()}',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return LayoutBuilder(builder: (context, constrain) {
      final isWeb = constrain.maxWidth > 600;
      return Scaffold(
        key: scafoldKey,
        drawer: const DrawerWidget(
          currentIndex: 2,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(
                icon: const Icon(LucideIcons.menu),
                onPressed: () {
                  scafoldKey.currentState!.openDrawer();
                },
              ),
              title: Text(localizations?.groupsCardTitile ?? 'Groups'),
              actions: [
                // TODO: add the create group button[PR#27]
                // IconButton(
                //   icon: const Icon(
                //     LucideIcons.plus,
                //     color: Colors.black,
                //   ),
                //   onPressed: _showCreateGroupDialog,
                // ),
                if (isWeb)
                  buildNavigationItem(
                    context,
                    icon: Icons.home_outlined,
                    label: AppLocalizations.of(context)?.homeNavigationBar ??
                        'Home',
                    index: 0,
                    selectedIndex: 2,
                    primaryColor: primaryColor,
                    tap: () {
                      context.pushReplacementNamed(AppUrls.postStudentScreen);
                    },
                  ),
                if (isWeb)
                  buildNavigationItem(
                    context,
                    icon: Icons.library_books,
                    label: AppLocalizations.of(context)?.libraryNavigationBar ??
                        'Library',
                    index: 1,
                    selectedIndex: 2,
                    primaryColor: primaryColor,
                    tap: () {
                      context.pushReplacementNamed(AppUrls.libraryHallScreen);
                    },
                  ),
                if (isWeb)
                  buildNavigationItem(
                    context,
                    icon: Icons.group,
                    label: AppLocalizations.of(context)?.groupNavigationBar ??
                        'Groups',
                    index: 2,
                    selectedIndex: 2,
                    primaryColor: primaryColor,
                    tap: () {
                      context.pushReplacementNamed(AppUrls.groupsStudentScreen);
                    },
                  ),
              ],
            ),
            SliverFillRemaining(
              child: StreamBuilder(
                stream: context
                    .read<GroupsProvider>()
                    .getGroupsWithPagination(limit: 25),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  final groups = snapshot.data as List<GroupsModel>;

                  if (groups.isEmpty) {
                    return const Center(
                      child: Text('No groups found'),
                    );
                  }

                  return ListView.builder(
                    itemCount: groups.length,
                    itemBuilder: (context, index) {
                      final group = groups[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            AppUrls.groupDetailStudentScreen,
                            extra: {
                              'group': group,
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          child: ShadCard(
                            child: Hero(
                              tag: group.id,
                              child: Row(
                                children: [
                                  ShadAvatar(
                                    size: const Size(50, 50),
                                    group.imageUrl ??
                                        "https://www.pngitem.com/pimgs/m/522-5220445_anonymous-profile-grey-person-sticker-glitch-empty-profile.png",
                                    placeholder: Text(
                                      group.name.substring(
                                        0,
                                        2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        group.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          group.description ?? 'No description',
                                          maxLines: 3,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
