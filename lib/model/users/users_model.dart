import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_enums.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
sealed class UsersModel with _$UsersModel {
  const factory UsersModel({
    // Core
    required UserRole role,
    String? title,

    // Student info
    required String uid,
    required String email,
    required String fullName,
    String? address,
    String? phoneNumber,
    String? profileImageURL,
    String? batch,
    String? motherName,
    String? fatherName,

    // Messaging
    /// Use camelCase for consistency
    String? lastSeen,
    @Default(true) bool isActive,
    @Default(false) bool isOnline,

    /// Default must be a const, and you should parameterize the generic
    @Default(<String>[]) List<String> blockedUsers,
    @Default(<String>[]) List<String> contactUsers,

    // Teaching
    String? courseId,

    // Future use
    String? departmentId,
    @Default(<String>[]) List<String> searchableKeywords,

    // Moderation
    String? banReason,
    String? bannedById,

    // Metadata
    required DateTime createdAt,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}
