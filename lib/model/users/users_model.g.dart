// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => _UsersModel(
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      title: json['title'] as String?,
      uid: json['uid'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImageURL: json['profileImageURL'] as String?,
      batch: json['batch'] as String?,
      motherName: json['motherName'] as String?,
      fatherName: json['fatherName'] as String?,
      lastSeen: json['lastSeen'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      isOnline: json['isOnline'] as bool? ?? false,
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      contactUsers: (json['contactUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      courseId: json['courseId'] as String?,
      departmentId: json['departmentId'] as String?,
      searchableKeywords: (json['searchableKeywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      banReason: json['banReason'] as String?,
      bannedById: json['bannedById'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UsersModelToJson(_UsersModel instance) =>
    <String, dynamic>{
      'role': _$UserRoleEnumMap[instance.role]!,
      'title': instance.title,
      'uid': instance.uid,
      'email': instance.email,
      'fullName': instance.fullName,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'profileImageURL': instance.profileImageURL,
      'batch': instance.batch,
      'motherName': instance.motherName,
      'fatherName': instance.fatherName,
      'lastSeen': instance.lastSeen,
      'isActive': instance.isActive,
      'isOnline': instance.isOnline,
      'blockedUsers': instance.blockedUsers,
      'contactUsers': instance.contactUsers,
      'courseId': instance.courseId,
      'departmentId': instance.departmentId,
      'searchableKeywords': instance.searchableKeywords,
      'banReason': instance.banReason,
      'bannedById': instance.bannedById,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.teacher: 'teacher',
  UserRole.student: 'student',
  UserRole.bot: 'bot',
};
