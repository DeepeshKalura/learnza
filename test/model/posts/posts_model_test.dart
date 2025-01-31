import 'package:flutter_test/flutter_test.dart';
import 'package:learnza/model/app_enums.dart';
import 'package:learnza/model/comment/comments_model.dart';
import 'package:learnza/model/metrics/comment_metrics.dart';
import 'package:learnza/model/metrics/post_metrics.dart';
import 'package:learnza/model/posts/posts_model.dart';

void main() {
  group('PostsModel Tests', () {
    // Test data setup
    final DateTime now = DateTime.now();
    final DateTime tomorrow = now.add(const Duration(days: 1));

    test('should create a minimal valid post', () {
      final post = PostsModel(
        id: '1',
        title: 'Test Post',
        content: 'Test Content',
        authorId: 'author1',
        createdAt: now,
        updatedAt: now,
      );

      expect(post.id, '1');
      expect(post.title, 'Test Post');
      expect(post.content, 'Test Content');
      expect(post.authorId, 'author1');
      expect(post.createdAt, now);
      expect(post.updatedAt, now);
      expect(post.thumbnailUrl, null);
      expect(post.scheduledAt, null);
      expect(post.tags, isEmpty);
      expect(post.visibility, PostVisibility.public);
      expect(post.categoryId, null);
      expect(post.isPinned, false);
      expect(post.isFeatured, false);
      expect(post.comments, isEmpty);
    });

    test('should create a fully populated post', () {
      final comment = CommentsModel(
        id: 'comment1',
        postId: '1',
        content: 'Test Comment',
        authorId: 'author2',
        createdAt: now,
        metrics: const CommentMetrics(likes: 2),
      );

      const metrics = PostEngagementMetrics(
        totalViews: 100,
        uniqueViews: 80,
        likes: ['user1', 'user2'],
        totalComments: 1,
        engagementRate: 0.75,
        averageReadTime: 3.5,
      );

      final post = PostsModel(
        id: '1',
        title: 'Full Test Post',
        content: 'Detailed Content',
        authorId: 'author1',
        thumbnailUrl: 'https://example.com/thumb.jpg',
        createdAt: now,
        updatedAt: now,
        scheduledAt: tomorrow,
        engagementMetrics: metrics,
        tags: ['tech', 'tutorial'],
        visibility: PostVisibility.restricted,
        categoryId: 'category1',
        isPinned: true,
        isFeatured: true,
        comments: [comment],
      );

      // Core information tests
      expect(post.id, '1');
      expect(post.title, 'Full Test Post');
      expect(post.thumbnailUrl, 'https://example.com/thumb.jpg');
      expect(post.scheduledAt, tomorrow);

      // Metrics tests
      expect(post.engagementMetrics.totalViews, 100);
      expect(post.engagementMetrics.uniqueViews, 80);
      expect(post.engagementMetrics.likes, ['user1', 'user2']);
      expect(post.engagementMetrics.engagementRate, 0.75);

      // Categorization tests
      expect(post.tags, ['tech', 'tutorial']);
      expect(post.visibility, PostVisibility.restricted);
      expect(post.categoryId, 'category1');

      // Status tests
      expect(post.isPinned, true);
      expect(post.isFeatured, true);

      // Comments tests
      expect(post.comments.length, 1);
      expect(post.comments.first.id, 'comment1');
      expect(post.comments.first.metrics.likes, 2);
    });

    test('should handle nested comments with metrics', () {
      final nestedComment = CommentsModel(
        id: 'comment2',
        postId: '1',
        content: 'Nested Comment',
        authorId: 'author3',
        createdAt: now,
        parentCommentId: 'comment1',
        metrics: const CommentMetrics(
          likes: 10,
        ),
      );

      final parentComment = CommentsModel(
        id: 'comment1',
        postId: '1',
        content: 'Parent Comment',
        authorId: 'author2',
        createdAt: now,
        replyCount: 1,
        metrics: const CommentMetrics(
          likes: 2,
        ),
      );

      final post = PostsModel(
        id: '1',
        title: 'Nested Comments Test',
        content: 'Test Content',
        authorId: 'author1',
        createdAt: now,
        updatedAt: now,
        comments: [parentComment, nestedComment],
        engagementMetrics: const PostEngagementMetrics(
          totalComments: 2,
          topLevelComments: 1,
          nestedComments: 1,
        ),
      );

      expect(post.comments.length, 2);
      expect(post.engagementMetrics.totalComments, 2);
      expect(post.engagementMetrics.topLevelComments, 1);
      expect(post.engagementMetrics.nestedComments, 1);

      final foundNestedComment = post.comments.firstWhere(
        (comment) => comment.parentCommentId != null,
      );
      expect(foundNestedComment.id, 'comment2');
      expect(foundNestedComment.parentCommentId, 'comment1');
    });

    test('should handle all PostVisibility values', () {
      for (final visibility in PostVisibility.values) {
        final post = PostsModel(
          id: '1',
          title: 'Visibility Test',
          content: 'Test Content',
          authorId: 'author1',
          createdAt: now,
          updatedAt: now,
          visibility: visibility,
        );

        expect(post.visibility, visibility);
      }
    });
  });
}
