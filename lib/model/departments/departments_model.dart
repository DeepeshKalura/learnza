import 'package:freezed_annotation/freezed_annotation.dart';

part 'departments_model.freezed.dart';
part 'departments_model.g.dart';

@freezed
class DepartmentsModel with _$DepartmentsModel {
  const factory DepartmentsModel({
    required String id,
    required String name,
    required String description,
    String? departmentProfilePictureUrl,
    String? headTeacherId,
    List<String>? teacherIds,
    required bool isActive,
    required DateTime createdAt,
    Map<String, dynamic>? metadata,
  }) = _DepartmentsModel;

  // Freezed automatically generates this method in departments_model.g.dart
  factory DepartmentsModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsModelFromJson(json);
}
