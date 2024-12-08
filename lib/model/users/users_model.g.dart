// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersModelImpl _$$UsersModelImplFromJson(Map<String, dynamic> json) =>
    _$UsersModelImpl(
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
      lastseen: json['lastseen'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      isOnline: json['isOnline'] as bool? ?? false,
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      contactUsers: (json['contactUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      courseId: json['courseId'] as String?,
      departmentId: json['departmentId'] as String?,
      banReason: json['banReason'] as String?,
      bannedById: json['bannedById'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UsersModelImplToJson(_$UsersModelImpl instance) =>
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
      'lastseen': instance.lastseen,
      'isActive': instance.isActive,
      'isOnline': instance.isOnline,
      'blockedUsers': instance.blockedUsers,
      'contactUsers': instance.contactUsers,
      'courseId': instance.courseId,
      'departmentId': instance.departmentId,
      'banReason': instance.banReason,
      'bannedById': instance.bannedById,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.teacher: 'teacher',
  UserRole.student: 'student',
};
