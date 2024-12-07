// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentMetricsImpl _$$CommentMetricsImplFromJson(Map<String, dynamic> json) =>
    _$CommentMetricsImpl(
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      dislikes: (json['dislikes'] as num?)?.toInt() ?? 0,
      replies: (json['replies'] as num?)?.toInt() ?? 0,
      interactions: (json['interactions'] as num?)?.toInt() ?? 0,
      uniqueInteractors: (json['uniqueInteractors'] as num?)?.toInt() ?? 0,
      initialTimestamp: json['initialTimestamp'] == null
          ? null
          : DateTime.parse(json['initialTimestamp'] as String),
      lastInteractionTimestamp: json['lastInteractionTimestamp'] == null
          ? null
          : DateTime.parse(json['lastInteractionTimestamp'] as String),
      engagementRate: (json['engagementRate'] as num?)?.toDouble() ?? 0,
      sentimentScore: (json['sentimentScore'] as num?)?.toDouble() ?? 0,
      reportCount: (json['reportCount'] as num?)?.toInt() ?? 0,
      isFlagged: json['isFlagged'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommentMetricsImplToJson(
        _$CommentMetricsImpl instance) =>
    <String, dynamic>{
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'replies': instance.replies,
      'interactions': instance.interactions,
      'uniqueInteractors': instance.uniqueInteractors,
      'initialTimestamp': instance.initialTimestamp?.toIso8601String(),
      'lastInteractionTimestamp':
          instance.lastInteractionTimestamp?.toIso8601String(),
      'engagementRate': instance.engagementRate,
      'sentimentScore': instance.sentimentScore,
      'reportCount': instance.reportCount,
      'isFlagged': instance.isFlagged,
    };
