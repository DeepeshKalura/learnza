import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_post_metrics.freezed.dart';
part 'global_post_metrics.g.dart';

@freezed
class GlobalPostMetrics with _$GlobalPostMetrics {
  const factory GlobalPostMetrics({
    // Total Post Counts
    @Default(0) int totalPosts,
    @Default(0) int activePosts,
    @Default(0) int archivedPosts,

    // Engagement Aggregates
    @Default(0) int totalViews,
    @Default(0) int totalUniqueViews,
    @Default(0) int totalLikes,
    @Default(0) int totalComments,
    @Default(0) int totalShares,

    // Performance Metrics
    @Default(0) double averageEngagementRate,
    @Default(0) double averageReadTime,
    @Default(0) double averageInteractionRate,

    // Content Distribution
    @Default({}) Map<String, int> postsByCategory,
    @Default({}) Map<String, int> postsByTag,

    // User Interaction
    @Default(0) int totalUniqueAuthors,
    @Default(0) int totalUniqueInteractors,

    // Temporal Metrics
    @Default({}) Map<String, int> postsByMonth,
    @Default({}) Map<String, int> postsByYear,

    // Advanced Metrics
    @Default(0) double globalViralityScore,
    @Default(0) double globalRecommendationScore,

    // Audience Insights
    @Default({}) Map<String, double> audienceSegmentEngagement,
  }) = _GlobalPostMetrics;

  factory GlobalPostMetrics.fromJson(Map<String, dynamic> json) =>
      _$GlobalPostMetricsFromJson(json);
}
