// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      isActive: json['isActive'] as bool,
      isEmailVerified: json['isEmailVerified'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      profileImage: json['profileImage'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isSuperAdmin: json['isSuperAdmin'] as bool?,
      isHeadTeacher: json['isHeadTeacher'] as bool?,
      departmentId: json['departmentId'] as String?,
      assignedCourseIds: (json['assignedCourseIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      canInviteTeachers: json['canInviteTeachers'] as bool?,
      enrolledDepartmentId: json['enrolledDepartmentId'] as String?,
      enrolledCourseIds: (json['enrolledCourseIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isOnProbation: json['isOnProbation'] as bool?,
      banReason: json['banReason'] as String?,
      banExpiry: json['banExpiry'] == null
          ? null
          : DateTime.parse(json['banExpiry'] as String),
      bannedBy: json['bannedBy'] as String?,
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
      activityLog: json['activityLog'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'fullName': instance.fullName,
      'role': _$UserRoleEnumMap[instance.role]!,
      'isActive': instance.isActive,
      'isEmailVerified': instance.isEmailVerified,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
      'isSuperAdmin': instance.isSuperAdmin,
      'isHeadTeacher': instance.isHeadTeacher,
      'departmentId': instance.departmentId,
      'assignedCourseIds': instance.assignedCourseIds,
      'canInviteTeachers': instance.canInviteTeachers,
      'enrolledDepartmentId': instance.enrolledDepartmentId,
      'enrolledCourseIds': instance.enrolledCourseIds,
      'isOnProbation': instance.isOnProbation,
      'banReason': instance.banReason,
      'banExpiry': instance.banExpiry?.toIso8601String(),
      'bannedBy': instance.bannedBy,
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
      'activityLog': instance.activityLog,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.teacher: 'teacher',
  UserRole.student: 'student',
};
