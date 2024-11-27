import 'package:freezed_annotation/freezed_annotation.dart';
import '../app_enums.dart';

part 'groups_model.freezed.dart';
part 'groups_model.g.dart';

@freezed
class GroupsModel with _$GroupsModel {
  const factory GroupsModel({
    required String id,
    required String name,
    String? description,
    String? imageUrl,
    String? coverImageUrl,
    required List<String> adminIds,
    required List<String> memberIds,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(GroupPrivacy.private) GroupPrivacy privacy,
    @Default([]) List<String> pendingInvites,
  }) = _GroupModel;

  factory GroupsModel.fromJson(Map<String, dynamic> json) =>
      _$GroupsModelFromJson(json);
}
