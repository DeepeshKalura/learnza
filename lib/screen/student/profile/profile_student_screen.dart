import 'package:flutter/material.dart';
import 'package:learnza/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../model/course/courses_model.dart';
import '../../../model/users/users_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/course_provider.dart';
import '../../../providers/state/student/profile_student_state_provider.dart';

class ProfileStudentScreen extends StatefulWidget {
  const ProfileStudentScreen({super.key});

  @override
  State<ProfileStudentScreen> createState() => _ProfileStudentScreenState();
}

class _ProfileStudentScreenState extends State<ProfileStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileStudentStateProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ProfileStudentStateProvider>(
            builder: (context, profileStateProvider, child) {
              return Text(
                profileStateProvider.isEditMode
                    ? 'Edit Student Screen'
                    : 'Student Profile',
                style: ShadTheme.of(context).textTheme.h3,
              );
            },
          ),
          actions: const [
            // TODO: Implement edit profile functionality
            // Padding(
            //   padding: const EdgeInsets.only(right: 8.0),
            //   child: Consumer<ProfileStudentStateProvider>(
            //     builder: (context, value, child) {
            //       if (value.isEditMode) {
            //         return ShadButton(
            //           backgroundColor: primaryColor,
            //           icon: const Icon(
            //             Icons.close,
            //             color: Colors.white,
            //           ),
            //           onPressed: () {
            //             value.toggleEditMode();
            //             value.resetEditedFields();
            //           },
            //         );
            //       } else {
            //         return ShadButton(
            //           backgroundColor: primaryColor,
            //           icon: const Icon(
            //             Icons.edit,
            //             color: Colors.white,
            //           ),
            //           onPressed: () {
            //             value.toggleEditMode();
            //           },
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
        body: const ProfileStudentBody(),
      ),
    );
  }
}

class ProfileStudentBody extends StatefulWidget {
  const ProfileStudentBody({super.key});

  @override
  State<ProfileStudentBody> createState() => _ProfileStudentBodyState();
}

class _ProfileStudentBodyState extends State<ProfileStudentBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final studentProvider = Provider.of<AuthProvider>(context, listen: false);
      final courseProvider =
          Provider.of<CourseProvider>(context, listen: false);
      final profileStateProvider =
          Provider.of<ProfileStudentStateProvider>(context, listen: false);

      UsersModel? currentUser = studentProvider.user;
      CoursesModel? currentCourse = courseProvider.currentUserCourse;

      callingGame(
        currentCourse,
        currentUser,
        courseProvider,
        profileStateProvider,
      );
    });
  }

  void callingGame(
      CoursesModel? currentCourse,
      UsersModel? currentUser,
      CourseProvider courseProvider,
      ProfileStudentStateProvider profileStateProvider) {
    if (currentCourse == null) {
      if (currentUser != null) {
        if (currentUser.courseId != null) {
          profileStateProvider.getCourseToCurrentUser(
              courseProvider, currentUser.courseId!);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<AuthProvider>(context);

    UsersModel? currentUser = studentProvider.user;

    return Consumer<ProfileStudentStateProvider>(
        builder: (context, value, child) {
      if (value.currentUserIsNull) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ProfileStudentStateProvider>(
            builder: (context, profileStateProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Image Section
                  GestureDetector(
                    onTap: profileStateProvider.isEditMode
                        ? () => profileStateProvider.pickProfileImage()
                        : null,
                    child: Stack(
                      children: [
                        (!profileStateProvider.isEditMode)
                            ? ShadAvatar(
                                size: const Size(160, 160),
                                currentUser?.profileImageURL ??
                                    "https://www.pngitem.com/pimgs/m/522-5220445_anonymous-profile-grey-person-sticker-glitch-empty-profile.png",
                                placeholder:
                                    const Icon(Icons.camera_alt, size: 50),
                              )
                            : Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF62cff4),
                                      Color(0xFF0077b6)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(160),
                                  border: Border.all(
                                    color: darkPrimaryColor,
                                    width: 2,
                                  ),
                                ),
                                width: 160,
                                height: 160,
                                child: profileStateProvider.profileImage == null
                                    ? const Icon(
                                        Icons.camera_alt,
                                        size: 50,
                                        color: Colors.white,
                                      )
                                    : Image.file(
                                        profileStateProvider.profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                        if (profileStateProvider.isEditMode &&
                            profileStateProvider.profileImage != null)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.close,
                                  color: Colors.red, size: 32),
                              onPressed: () =>
                                  profileStateProvider.clearProfileImage(),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Personal Information
                  ProfileInfoCard(
                    title: 'Personal Details',
                    children: [
                      _buildInfoRow('Full Name', currentUser?.fullName ?? 'N/A',
                          isEditable: false),
                      _buildInfoRow('Email', currentUser?.email ?? 'N/A',
                          isEditable: false),
                      _buildInfoRow(
                        'Phone',
                        currentUser?.phoneNumber ?? 'N/A',
                        isEditable: profileStateProvider.isEditMode,
                        controller: profileStateProvider.phoneController,
                      ),
                      _buildInfoRow(
                        'Address',
                        currentUser?.address ?? 'N/A',
                        isEditable: profileStateProvider.isEditMode,
                        controller: profileStateProvider.addressController,
                      ),
                    ],
                  ),

                  // Family Information
                  ProfileInfoCard(
                    title: 'Family Details',
                    children: [
                      _buildInfoRow(
                        'Father\'s Name',
                        currentUser?.fatherName ?? 'N/A',
                        isEditable: profileStateProvider.isEditMode,
                        controller: profileStateProvider.fatherNameController,
                      ),
                      _buildInfoRow(
                        'Mother\'s Name',
                        currentUser?.motherName ?? 'N/A',
                        isEditable: profileStateProvider.isEditMode,
                        controller: profileStateProvider.motherNameController,
                      ),
                    ],
                  ),

                  // Course Information
                  ProfileInfoCard(
                    title: 'Course Details',
                    children: [
                      _buildInfoRow(
                          'Course Name',
                          context
                                  .read<CourseProvider>()
                                  .currentUserCourse
                                  ?.name ??
                              'N/A',
                          isEditable: false),
                      _buildInfoRow('Batch', currentUser?.batch ?? 'N/A',
                          isEditable: false),
                    ],
                  ),

                  // Save Changes Button
                  if (profileStateProvider.isEditMode)
                    SizedBox(
                      width: double.infinity,
                      child: ShadButton(
                        backgroundColor: primaryColor,
                        child: const Text(
                          'Save Changes',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          profileStateProvider.saveChanges(currentUser!);
                        },
                      ),
                    )
                ],
              );
            },
          ),
        ),
      );
    });
  }

  Widget _buildInfoRow(
    String label,
    String value, {
    bool isEditable = false,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (!isEditable)
            Text(
              value,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          if (isEditable)
            Expanded(
              child: TextField(
                controller: controller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: value,
                  border: InputBorder.none,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: primaryColor.withOpacity(0.2),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}
