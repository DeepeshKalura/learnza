import 'package:json_annotation/json_annotation.dart';

part 'courses_model.g.dart';

@JsonSerializable()
class CoursesModel {
  final String id; // Primary Key
  final String name; // Course name
  final String departmentId; // Foreign Key: References the Department
  final List<String> teacherIds; // Array of teacher IDs (References Users)
  final List<String> studentIds; // Array of student IDs (References Users)
  final bool isActive; // Indicates if the course is currently active
  final DateTime createdAt; // Timestamp when the course was created
  final String createdBy; // Foreign Key: User who created the course
  final DateTime startDate; // Course start date
  final DateTime endDate; // Course end date
  final Map<String, dynamic>
      courseSettings; // Additional settings for the course

  CoursesModel({
    required this.id,
    required this.name,
    required this.departmentId,
    required this.teacherIds,
    required this.studentIds,
    required this.isActive,
    required this.createdAt,
    required this.createdBy,
    required this.startDate,
    required this.endDate,
    required this.courseSettings,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesModelToJson(this);
}
