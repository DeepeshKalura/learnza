// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_post_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalPostMetricsImpl _$$GlobalPostMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalPostMetricsImpl(
      totalPosts: (json['totalPosts'] as num?)?.toInt() ?? 0,
      activePosts: (json['activePosts'] as num?)?.toInt() ?? 0,
      archivedPosts: (json['archivedPosts'] as num?)?.toInt() ?? 0,
      totalViews: (json['totalViews'] as num?)?.toInt() ?? 0,
      totalUniqueViews: (json['totalUniqueViews'] as num?)?.toInt() ?? 0,
      totalLikes: (json['totalLikes'] as num?)?.toInt() ?? 0,
      totalComments: (json['totalComments'] as num?)?.toInt() ?? 0,
      totalShares: (json['totalShares'] as num?)?.toInt() ?? 0,
      averageEngagementRate:
          (json['averageEngagementRate'] as num?)?.toDouble() ?? 0,
      averageReadTime: (json['averageReadTime'] as num?)?.toDouble() ?? 0,
      averageInteractionRate:
          (json['averageInteractionRate'] as num?)?.toDouble() ?? 0,
      postsByCategory: (json['postsByCategory'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      postsByTag: (json['postsByTag'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      totalUniqueAuthors: (json['totalUniqueAuthors'] as num?)?.toInt() ?? 0,
      totalUniqueInteractors:
          (json['totalUniqueInteractors'] as num?)?.toInt() ?? 0,
      postsByMonth: (json['postsByMonth'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      postsByYear: (json['postsByYear'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      globalViralityScore:
          (json['globalViralityScore'] as num?)?.toDouble() ?? 0,
      globalRecommendationScore:
          (json['globalRecommendationScore'] as num?)?.toDouble() ?? 0,
      audienceSegmentEngagement:
          (json['audienceSegmentEngagement'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ) ??
              const {},
    );

Map<String, dynamic> _$$GlobalPostMetricsImplToJson(
        _$GlobalPostMetricsImpl instance) =>
    <String, dynamic>{
      'totalPosts': instance.totalPosts,
      'activePosts': instance.activePosts,
      'archivedPosts': instance.archivedPosts,
      'totalViews': instance.totalViews,
      'totalUniqueViews': instance.totalUniqueViews,
      'totalLikes': instance.totalLikes,
      'totalComments': instance.totalComments,
      'totalShares': instance.totalShares,
      'averageEngagementRate': instance.averageEngagementRate,
      'averageReadTime': instance.averageReadTime,
      'averageInteractionRate': instance.averageInteractionRate,
      'postsByCategory': instance.postsByCategory,
      'postsByTag': instance.postsByTag,
      'totalUniqueAuthors': instance.totalUniqueAuthors,
      'totalUniqueInteractors': instance.totalUniqueInteractors,
      'postsByMonth': instance.postsByMonth,
      'postsByYear': instance.postsByYear,
      'globalViralityScore': instance.globalViralityScore,
      'globalRecommendationScore': instance.globalRecommendationScore,
      'audienceSegmentEngagement': instance.audienceSegmentEngagement,
    };
