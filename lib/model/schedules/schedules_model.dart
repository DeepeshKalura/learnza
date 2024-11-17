import 'package:json_annotation/json_annotation.dart';

part 'schedules_model.g.dart';

@JsonSerializable()
class SchedulesModel {
  final String id;
  final String schedulesUrl;
  final String departmentId;
  final String isActive;
  final String courseId;
  final DateTime createdAt;
  final DateTime updatedAt;

  SchedulesModel({
    required this.id,
    required this.schedulesUrl,
    required this.departmentId,
    required this.isActive,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SchedulesModel.fromJson(Map<String, dynamic> json) =>
      _$SchedulesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchedulesModelToJson(this);
}
