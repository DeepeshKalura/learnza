import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses_model.freezed.dart';
part 'courses_model.g.dart';

@freezed
class CoursesModel with _$CoursesModel {
  const factory CoursesModel({
    required String id, // Primary Key
    required String name, // Course name
    required String departmentId, // Foreign Key: References the Department
    required bool isActive, // Indicates if the course is currently active
    required DateTime createdAt, // Timestamp when the course was created
    Map<String, dynamic>? courseSettings, // Additional settings for the course
  }) = _CoursesModel;

  factory CoursesModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesModelFromJson(json);
}
