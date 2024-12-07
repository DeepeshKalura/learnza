import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_enums.dart';
import '../metrics/comment_metrics.dart';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
class CommentsModel with _$CommentsModel {
  const factory CommentsModel({
    // Core Comment Information
    required String id,
    required String postId,
    required String content,
    required String authorId,
    required DateTime createdAt,
    DateTime? updatedAt,

    // Parent-Child Comment Relationship
    String? parentCommentId,
    @Default(0) int replyCount,

    // Comment Status and Metadata
    @Default(CommentStatus.active) CommentStatus status,
    @Default(false) bool isEdited,
    @Default(false) bool isPinned,

    // Engagement Metrics
    @Default(CommentMetrics()) CommentMetrics metrics,

    // Additional Metadata
    @Default([]) List<String> mentionedUserIds,
    @Default([]) List<String> hashTags,
  }) = _CommentsModel;

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
}
