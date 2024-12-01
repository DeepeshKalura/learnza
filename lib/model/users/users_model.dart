import 'package:freezed_annotation/freezed_annotation.dart';
import '../app_enums.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
class UsersModel with _$UsersModel {
  const factory UsersModel({
    required UserRole role,
    String? title,

    // Students
    required String uid,
    required String email,
    required String fullName,
    String? address,
    String? phoneNumber,
    String? profileImageURL,
    String? batch,
    String? motherName,
    String? fatherName,

    // Message
    String? lastseen,
    @Default(true) bool isActive,
    required bool isOnline,
    @Default([]) List<String> blockedUsers,
    @Default([]) List<String> contactUsers,

    // Teachers
    String? courseId,

    // Future purpose
    String? departmentId,

    // Status tracking
    String? banReason,
    String? bannedById,
    required DateTime createdAt,
  }) = _UsersModel;

  // For JSON serialization
  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}
