import 'package:json_annotation/json_annotation.dart';

part 'departments_model.g.dart';

@JsonSerializable()
class DepartmentsModel {
  final String id;
  final String name;
  final String description;
  final String headTeacherId;
  final List<String> teacherIds;
  final bool isActive;
  final DateTime createdAt;
  final String createdBy;
  final Map<String, dynamic> metadata;

  DepartmentsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.headTeacherId,
    required this.teacherIds,
    required this.isActive,
    required this.createdAt,
    required this.createdBy,
    required this.metadata,
  });

  factory DepartmentsModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentsModelToJson(this);
}
