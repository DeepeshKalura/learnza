import 'package:freezed_annotation/freezed_annotation.dart';
import '../app_enums.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
class UsersModel with _$UsersModel {
  const factory UsersModel({
    required String uid,
    required String email,
    required String fullName,
    required UserRole role,
    required bool isActive,
    required DateTime createdAt,
    DateTime? isEmailVerified,
    DateTime? lastLogin,

    // Common optional fields
    String? profileImage,
    String? phoneNumber,

    // Admin specific fields
    bool? isSuperAdmin,

    // Teacher specific fields
    bool? isHeadTeacher,
    String? departmentId,
    List<String>? assignedCourseIds,
    bool? canInviteTeachers, // For head teachers

    // Student specific fields
    String? enrolledDepartmentId,
    List<String>? enrolledCourseIds,
    bool? isOnProbation, // For academic status tracking

    // Status tracking
    String? banReason,
    DateTime? banExpiry,
    String? bannedBy,
    DateTime? lastActiveAt,
    Map<String, dynamic>? activityLog,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  // ===== Role-Specific Computed Properties =====

  const UsersModel._(); // Private constructor for custom getters

  bool get isSuperAdminRole =>
      role == UserRole.admin && (isSuperAdmin ?? false);

  bool get isHeadTeacherRole =>
      role == UserRole.teacher && (isHeadTeacher ?? false);

  bool get isTeacherRole => role == UserRole.teacher;

  bool get isStudentRole => role == UserRole.student;
}
