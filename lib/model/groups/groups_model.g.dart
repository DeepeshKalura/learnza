// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      adminIds:
          (json['adminIds'] as List<dynamic>).map((e) => e as String).toList(),
      memberIds:
          (json['memberIds'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      privacy: $enumDecodeNullable(_$GroupPrivacyEnumMap, json['privacy']) ??
          GroupPrivacy.private,
      pendingInvites: (json['pendingInvites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'coverImageUrl': instance.coverImageUrl,
      'adminIds': instance.adminIds,
      'memberIds': instance.memberIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'privacy': _$GroupPrivacyEnumMap[instance.privacy]!,
      'pendingInvites': instance.pendingInvites,
    };

const _$GroupPrivacyEnumMap = {
  GroupPrivacy.public: 'public',
  GroupPrivacy.private: 'private',
  GroupPrivacy.restricted: 'restricted',
};
