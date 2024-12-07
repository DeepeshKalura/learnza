import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_metrics.freezed.dart';
part 'comment_metrics.g.dart';

@freezed
class CommentMetrics with _$CommentMetrics {
  const factory CommentMetrics({
    // Engagement Metrics
    @Default(0) int likes,
    @Default(0) int dislikes,
    @Default(0) int replies,

    // Interaction Tracking
    @Default(0) int interactions,
    @Default(0) int uniqueInteractors,

    // Timestamp Tracking
    DateTime? initialTimestamp,
    DateTime? lastInteractionTimestamp,

    // Performance Metrics
    @Default(0) double engagementRate,
    @Default(0) double sentimentScore,

    // Spam and Moderation
    @Default(0) int reportCount,
    @Default(false) bool isFlagged,
  }) = _CommentMetrics;

  factory CommentMetrics.fromJson(Map<String, dynamic> json) =>
      _$CommentMetricsFromJson(json);
}
