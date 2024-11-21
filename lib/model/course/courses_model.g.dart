// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoursesModelImpl _$$CoursesModelImplFromJson(Map<String, dynamic> json) =>
    _$CoursesModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      departmentId: json['departmentId'] as String,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      courseSettings: json['courseSettings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CoursesModelImplToJson(_$CoursesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'departmentId': instance.departmentId,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'courseSettings': instance.courseSettings,
    };
