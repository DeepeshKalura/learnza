// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentsModelImpl _$$DepartmentsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DepartmentsModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      departmentProfilePictureUrl:
          json['departmentProfilePictureUrl'] as String?,
      headTeacherId: json['headTeacherId'] as String?,
      teacherIds: (json['teacherIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DepartmentsModelImplToJson(
        _$DepartmentsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'departmentProfilePictureUrl': instance.departmentProfilePictureUrl,
      'headTeacherId': instance.headTeacherId,
      'teacherIds': instance.teacherIds,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
    };
