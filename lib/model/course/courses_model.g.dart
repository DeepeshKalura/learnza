// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoursesModelImpl _$$CoursesModelImplFromJson(Map<String, dynamic> json) =>
    _$CoursesModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      year: (json['year'] as num).toInt(),
      description: json['description'] as String?,
      shortName: json['shortName'] as String?,
      courseImageUrl: json['courseImageUrl'] as String?,
      departmentId: json['departmentId'] as String?,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CoursesModelImplToJson(_$CoursesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'description': instance.description,
      'shortName': instance.shortName,
      'courseImageUrl': instance.courseImageUrl,
      'departmentId': instance.departmentId,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
