// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostsModelImpl _$$PostsModelImplFromJson(Map<String, dynamic> json) =>
    _$PostsModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
      engagementMetrics: json['engagementMetrics'] == null
          ? const PostEngagementMetrics()
          : PostEngagementMetrics.fromJson(
              json['engagementMetrics'] as Map<String, dynamic>),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      visibility:
          $enumDecodeNullable(_$PostVisibilityEnumMap, json['visibility']) ??
              PostVisibility.public,
      categoryId: json['categoryId'] as String?,
      isPinned: json['isPinned'] as bool? ?? false,
      isFeatured: json['isFeatured'] as bool? ?? false,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PostsModelImplToJson(_$PostsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'authorId': instance.authorId,
      'thumbnailUrl': instance.thumbnailUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'engagementMetrics': instance.engagementMetrics,
      'tags': instance.tags,
      'visibility': _$PostVisibilityEnumMap[instance.visibility]!,
      'categoryId': instance.categoryId,
      'isPinned': instance.isPinned,
      'isFeatured': instance.isFeatured,
      'comments': instance.comments,
    };

const _$PostVisibilityEnumMap = {
  PostVisibility.public: 'public',
  PostVisibility.private: 'private',
  PostVisibility.restricted: 'restricted',
  PostVisibility.draft: 'draft',
};
