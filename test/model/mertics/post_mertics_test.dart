import 'package:flutter_test/flutter_test.dart';
import 'package:learnza/model/metrics/post_metrics.dart';

void main() {
  test('Default PostEngagementMetrics serialization works', () {
    // Arrange
    const metrics = PostEngagementMetrics();

    // Act
    final json = metrics.toJson();

    // Assert
    expect(json, {
      'totalViews': 0,
      'uniqueViews': 0,
      'likes': [],
      'dislikes': [],
      'totalComments': 0,
      'activeDiscussions': 0,
      'topLevelComments': 0,
      'nestedComments': 0,
      'shares': 0,
      'engagementRate': 0.0,
      'reachRate': 0.0,
      'uniqueInteractors': 0,
      'averageReadTime': 0.0,
      'scrollDepth': 0,
    });
  });
}
