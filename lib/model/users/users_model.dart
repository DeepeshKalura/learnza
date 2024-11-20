import 'package:json_annotation/json_annotation.dart';

import '../app_enums.dart';
part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  final String uid;
  final String email;
  final String fullName;
  final UserRole role;
  final bool isActive;
  final DateTime? isEmailVerified;
  final DateTime createdAt;
  final DateTime? lastLogin;

  // Common optional fields
  final String? profileImage;
  final String? phoneNumber;

  // Admin specific fields
  final bool? isSuperAdmin;
  // Teacher specific fields
  final bool? isHeadTeacher;
  final String? departmentId;
  final List<String>? assignedCourseIds;
  final bool? canInviteTeachers; // For head teachers

  // Student specific fields
  final String? enrolledDepartmentId;
  final List<String>? enrolledCourseIds;
  final bool? isOnProbation; // For academic status tracking

  // Status tracking
  final String? banReason;
  final DateTime? banExpiry;
  final String? bannedBy;
  final DateTime? lastActiveAt;
  final Map<String, dynamic>? activityLog;

  UsersModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.role,
    required this.isActive,
    required this.createdAt,
    this.isEmailVerified,
    this.lastLogin,
    this.profileImage,
    this.phoneNumber,
    // Admin fields
    this.isSuperAdmin,
    // Teacher fields
    this.isHeadTeacher,
    this.departmentId,
    this.assignedCourseIds,
    this.canInviteTeachers,
    // Student fields
    this.enrolledDepartmentId,
    this.enrolledCourseIds,
    this.isOnProbation,
    // Status fields
    this.banReason,
    this.banExpiry,
    this.bannedBy,
    this.lastActiveAt,
    this.activityLog,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  // Method for JSON serialization
  Map<String, dynamic> toJson() => _$UsersModelToJson(this);

  // ===== Role-Specific Computed Properties =====

  bool get isSuperAdminRole =>
      role == UserRole.admin && (isSuperAdmin ?? false);

  bool get isHeadTeacherRole =>
      role == UserRole.teacher && (isHeadTeacher ?? false);

  bool get isTeacherRole => role == UserRole.teacher;

  bool get isStudentRole => role == UserRole.student;
}
