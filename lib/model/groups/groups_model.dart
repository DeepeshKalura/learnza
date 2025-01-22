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
    required List<GroupMember> members,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(GroupPrivacy.private) GroupPrivacy privacy,
    @Default([]) List<String> pendingInvites,
  }) = _GroupModel;

  factory GroupsModel.fromJson(Map<String, dynamic> json) =>
      _$GroupsModelFromJson(json);
}

@freezed
class GroupMember with _$GroupMember {
  const factory GroupMember({
    required String id,
    required GroupRole role,
  }) = _GroupMember;

  factory GroupMember.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberFromJson(json);
}

// 703b4ed3-04da-4fb8-9304-6ed4381307db
