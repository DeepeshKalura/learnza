import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_enums.dart';
import '../metrics/post_metrics.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  const factory PostsModel({
    // Core Post Information
    required String id,
    required String title,
    required String content,
    required String authorId,
    String? thumbnailUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? scheduledAt,

    // Enhanced Engagement Metrics
    @Default(PostEngagementMetrics()) PostEngagementMetrics engagementMetrics,

    // Post Categorization and Visibility
    @Default([]) List<String> tags,
    @Default(PostVisibility.public) PostVisibility visibility,

    // Advanced Post Attributes
    String? categoryId,
    @Default(false) bool isPinned,
    @Default(false) bool isFeatured,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);
}
