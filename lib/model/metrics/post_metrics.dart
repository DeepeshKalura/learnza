import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_metrics.freezed.dart';
part 'post_metrics.g.dart';

@freezed
class PostEngagementMetrics with _$PostEngagementMetrics {
  const factory PostEngagementMetrics({
    // View and Interaction Metrics
    @Default(0) int totalViews,
    @Default(0) int uniqueViews,

    // Reaction Metrics
    @Default(0) int likes,
    @Default(0) int dislikes,
    @Default({}) Map<String, int> reactionBreakdown,

    // Comment and Discussion Metrics
    @Default(0) int totalComments,
    @Default(0) int activeDiscussions,
    @Default(0) int topLevelComments,
    @Default(0) int nestedComments,

    // Sharing and Distribution
    @Default(0) int shares,
    @Default({})
    Map<String, int> shareChannels, // e.g., 'facebook': 10, 'twitter': 5

    // Performance Metrics
    @Default(0) double engagementRate,
    @Default(0) double reachRate,

    // Temporal Engagement Tracking
    @Default({}) Map<String, int> dailyEngagement,
    @Default({}) Map<String, int> hourlyEngagement,

    // User Interaction Details
    @Default(0) int uniqueInteractors,
    @Default([]) List<String> topInteractors,

    // Content Performance
    @Default(0) double averageReadTime,
    @Default(0) int scrollDepth,
  }) = _PostEngagementMetrics;

  factory PostEngagementMetrics.fromJson(Map<String, dynamic> json) =>
      _$PostEngagementMetricsFromJson(json);
}
