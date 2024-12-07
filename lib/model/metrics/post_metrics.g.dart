// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostEngagementMetricsImpl _$$PostEngagementMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$PostEngagementMetricsImpl(
      totalViews: (json['totalViews'] as num?)?.toInt() ?? 0,
      uniqueViews: (json['uniqueViews'] as num?)?.toInt() ?? 0,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      dislikes: (json['dislikes'] as num?)?.toInt() ?? 0,
      totalComments: (json['totalComments'] as num?)?.toInt() ?? 0,
      activeDiscussions: (json['activeDiscussions'] as num?)?.toInt() ?? 0,
      topLevelComments: (json['topLevelComments'] as num?)?.toInt() ?? 0,
      nestedComments: (json['nestedComments'] as num?)?.toInt() ?? 0,
      shares: (json['shares'] as num?)?.toInt() ?? 0,
      engagementRate: (json['engagementRate'] as num?)?.toDouble() ?? 0,
      reachRate: (json['reachRate'] as num?)?.toDouble() ?? 0,
      uniqueInteractors: (json['uniqueInteractors'] as num?)?.toInt() ?? 0,
      averageReadTime: (json['averageReadTime'] as num?)?.toDouble() ?? 0,
      scrollDepth: (json['scrollDepth'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PostEngagementMetricsImplToJson(
        _$PostEngagementMetricsImpl instance) =>
    <String, dynamic>{
      'totalViews': instance.totalViews,
      'uniqueViews': instance.uniqueViews,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'totalComments': instance.totalComments,
      'activeDiscussions': instance.activeDiscussions,
      'topLevelComments': instance.topLevelComments,
      'nestedComments': instance.nestedComments,
      'shares': instance.shares,
      'engagementRate': instance.engagementRate,
      'reachRate': instance.reachRate,
      'uniqueInteractors': instance.uniqueInteractors,
      'averageReadTime': instance.averageReadTime,
      'scrollDepth': instance.scrollDepth,
    };
