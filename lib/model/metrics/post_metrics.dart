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
    @Default([]) List<String> likes,
    @Default([]) List<String> dislikes,

    // Comment and Discussion Metrics
    @Default(0) int totalComments,
    @Default(0) int activeDiscussions,
    @Default(0) int topLevelComments,
    @Default(0) int nestedComments,

    // Sharing and Distribution
    @Default(0) int shares,

    // Performance Metrics
    @Default(0) double engagementRate,
    @Default(0) double reachRate,

    // User Interaction Details
    @Default(0) int uniqueInteractors,

    // Content Performance
    @Default(0) double averageReadTime,
    @Default(0) int scrollDepth,
  }) = _PostEngagementMetrics;

  factory PostEngagementMetrics.fromJson(Map<String, dynamic> json) =>
      _$PostEngagementMetricsFromJson(json);
}
