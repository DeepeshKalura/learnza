// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsModelImpl _$$CommentsModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentsModelImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      parentCommentId: json['parentCommentId'] as String?,
      replyCount: (json['replyCount'] as num?)?.toInt() ?? 0,
      status: $enumDecodeNullable(_$CommentStatusEnumMap, json['status']) ??
          CommentStatus.active,
      isEdited: json['isEdited'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
      metrics: json['metrics'] == null
          ? const CommentMetrics()
          : CommentMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      mentionedUserIds: (json['mentionedUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hashTags: (json['hashTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CommentsModelImplToJson(_$CommentsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'content': instance.content,
      'authorId': instance.authorId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'parentCommentId': instance.parentCommentId,
      'replyCount': instance.replyCount,
      'status': _$CommentStatusEnumMap[instance.status]!,
      'isEdited': instance.isEdited,
      'isPinned': instance.isPinned,
      'metrics': instance.metrics,
      'mentionedUserIds': instance.mentionedUserIds,
      'hashTags': instance.hashTags,
    };

const _$CommentStatusEnumMap = {
  CommentStatus.active: 'active',
  CommentStatus.hidden: 'hidden',
  CommentStatus.deleted: 'deleted',
  CommentStatus.reported: 'reported',
};
