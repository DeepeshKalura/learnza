import 'dart:developer' as developer;
import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/users/users_model.dart';
import '../../course_provider.dart';

class ProfileStudentStateProvider extends ChangeNotifier {
  File? _profileImage;
  File? get profileImage => _profileImage;

  bool isEditMode = false;

  bool currentUserIsNull = false;

  void getCourseToCurrentUser(
    CourseProvider provider,
    String currentUserId,
  ) async {
    currentUserIsNull = true;
    notifyListeners();

    try {
      await provider.getCourseById(currentUserId);
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
    } finally {
      currentUserIsNull = false;
      notifyListeners();
    }
  }

  // Controllers for editable fields
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    addressController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
  }

  void toggleEditMode() {
    isEditMode = !isEditMode;
    notifyListeners();
  }

  // Reset controllers to original values when canceling edit
  void resetEditedFields() {
    phoneController.clear();
    addressController.clear();
    fatherNameController.clear();
    motherNameController.clear();
    _profileImage = null;
    notifyListeners();
  }

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void clearProfileImage() {
    _profileImage = null;
    notifyListeners();
  }

  void saveChanges(UsersModel currentUser) {
    // Validate and save changes
    // You would typically call a method in your AuthProvider or a service to update the user
    currentUser = currentUser.copyWith(
      phoneNumber: phoneController.text.isNotEmpty
          ? phoneController.text
          : currentUser.phoneNumber,
      address: addressController.text.isNotEmpty
          ? addressController.text
          : currentUser.address,
      fatherName: fatherNameController.text.isNotEmpty
          ? fatherNameController.text
          : currentUser.fatherName,
      motherName: motherNameController.text.isNotEmpty
          ? motherNameController.text
          : currentUser.motherName,
    );

    // If a new profile image is selected, handle image upload
    if (_profileImage != null) {
      // Implement image upload logic here
      // This might involve calling a method to upload the image to your backend
    }

    // Toggle edit mode off after saving
    toggleEditMode();

    // Notify listeners or call a method to update the user in your backend
    notifyListeners();
  }
}
