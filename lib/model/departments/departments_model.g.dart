// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentsModel _$DepartmentsModelFromJson(Map<String, dynamic> json) =>
    DepartmentsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      headTeacherId: json['headTeacherId'] as String,
      teacherIds: (json['teacherIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DepartmentsModelToJson(DepartmentsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'headTeacherId': instance.headTeacherId,
      'teacherIds': instance.teacherIds,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'metadata': instance.metadata,
    };
