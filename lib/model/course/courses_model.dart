import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses_model.freezed.dart';
part 'courses_model.g.dart';

@freezed
class CoursesModel with _$CoursesModel {
  const factory CoursesModel({
    required String id,
    required String name,
    required int year, // how long the year last for a given course
    String? description,
    String? shortName,
    String? courseImageUrl,
    String? departmentId, // Foreign Key: References the Department
    required bool isActive, // Indicates if the course is currently active
    required DateTime createdAt, // Timestamp when the course was created
    DateTime? updatedAt,
  }) = _CoursesModel;

  factory CoursesModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesModelFromJson(json);
}
