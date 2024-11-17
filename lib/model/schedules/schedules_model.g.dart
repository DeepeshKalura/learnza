// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulesModel _$SchedulesModelFromJson(Map<String, dynamic> json) =>
    SchedulesModel(
      id: json['id'] as String,
      schedulesUrl: json['schedulesUrl'] as String,
      departmentId: json['departmentId'] as String,
      isActive: json['isActive'] as String,
      courseId: json['courseId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SchedulesModelToJson(SchedulesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedulesUrl': instance.schedulesUrl,
      'departmentId': instance.departmentId,
      'isActive': instance.isActive,
      'courseId': instance.courseId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
