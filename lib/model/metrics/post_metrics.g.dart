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
      reactionBreakdown:
          (json['reactionBreakdown'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toInt()),
              ) ??
              const {},
      totalComments: (json['totalComments'] as num?)?.toInt() ?? 0,
      activeDiscussions: (json['activeDiscussions'] as num?)?.toInt() ?? 0,
      topLevelComments: (json['topLevelComments'] as num?)?.toInt() ?? 0,
      nestedComments: (json['nestedComments'] as num?)?.toInt() ?? 0,
      shares: (json['shares'] as num?)?.toInt() ?? 0,
      shareChannels: (json['shareChannels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      engagementRate: (json['engagementRate'] as num?)?.toDouble() ?? 0,
      reachRate: (json['reachRate'] as num?)?.toDouble() ?? 0,
      dailyEngagement: (json['dailyEngagement'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      hourlyEngagement:
          (json['hourlyEngagement'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toInt()),
              ) ??
              const {},
      uniqueInteractors: (json['uniqueInteractors'] as num?)?.toInt() ?? 0,
      topInteractors: (json['topInteractors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
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
      'reactionBreakdown': instance.reactionBreakdown,
      'totalComments': instance.totalComments,
      'activeDiscussions': instance.activeDiscussions,
      'topLevelComments': instance.topLevelComments,
      'nestedComments': instance.nestedComments,
      'shares': instance.shares,
      'shareChannels': instance.shareChannels,
      'engagementRate': instance.engagementRate,
      'reachRate': instance.reachRate,
      'dailyEngagement': instance.dailyEngagement,
      'hourlyEngagement': instance.hourlyEngagement,
      'uniqueInteractors': instance.uniqueInteractors,
      'topInteractors': instance.topInteractors,
      'averageReadTime': instance.averageReadTime,
      'scrollDepth': instance.scrollDepth,
    };
