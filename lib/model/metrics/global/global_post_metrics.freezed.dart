// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_post_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GlobalPostMetrics {
// Total Post Counts
  int get totalPosts;
  int get activePosts;
  int get archivedPosts; // Engagement Aggregates
  int get totalViews;
  int get totalUniqueViews;
  int get totalLikes;
  int get totalComments;
  int get totalShares; // Performance Metrics
  double get averageEngagementRate;
  double get averageReadTime;
  double get averageInteractionRate; // Content Distribution
  Map<String, int> get postsByCategory;
  Map<String, int> get postsByTag; // User Interaction
  int get totalUniqueAuthors;
  int get totalUniqueInteractors; // Temporal Metrics
  Map<String, int> get postsByMonth;
  Map<String, int> get postsByYear; // Advanced Metrics
  double get globalViralityScore;
  double get globalRecommendationScore; // Audience Insights
  Map<String, double> get audienceSegmentEngagement;

  /// Create a copy of GlobalPostMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GlobalPostMetricsCopyWith<GlobalPostMetrics> get copyWith =>
      _$GlobalPostMetricsCopyWithImpl<GlobalPostMetrics>(
          this as GlobalPostMetrics, _$identity);

  /// Serializes this GlobalPostMetrics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GlobalPostMetrics &&
            (identical(other.totalPosts, totalPosts) ||
                other.totalPosts == totalPosts) &&
            (identical(other.activePosts, activePosts) ||
                other.activePosts == activePosts) &&
            (identical(other.archivedPosts, archivedPosts) ||
                other.archivedPosts == archivedPosts) &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.totalUniqueViews, totalUniqueViews) ||
                other.totalUniqueViews == totalUniqueViews) &&
            (identical(other.totalLikes, totalLikes) ||
                other.totalLikes == totalLikes) &&
            (identical(other.totalComments, totalComments) ||
                other.totalComments == totalComments) &&
            (identical(other.totalShares, totalShares) ||
                other.totalShares == totalShares) &&
            (identical(other.averageEngagementRate, averageEngagementRate) ||
                other.averageEngagementRate == averageEngagementRate) &&
            (identical(other.averageReadTime, averageReadTime) ||
                other.averageReadTime == averageReadTime) &&
            (identical(other.averageInteractionRate, averageInteractionRate) ||
                other.averageInteractionRate == averageInteractionRate) &&
            const DeepCollectionEquality()
                .equals(other.postsByCategory, postsByCategory) &&
            const DeepCollectionEquality()
                .equals(other.postsByTag, postsByTag) &&
            (identical(other.totalUniqueAuthors, totalUniqueAuthors) ||
                other.totalUniqueAuthors == totalUniqueAuthors) &&
            (identical(other.totalUniqueInteractors, totalUniqueInteractors) ||
                other.totalUniqueInteractors == totalUniqueInteractors) &&
            const DeepCollectionEquality()
                .equals(other.postsByMonth, postsByMonth) &&
            const DeepCollectionEquality()
                .equals(other.postsByYear, postsByYear) &&
            (identical(other.globalViralityScore, globalViralityScore) ||
                other.globalViralityScore == globalViralityScore) &&
            (identical(other.globalRecommendationScore,
                    globalRecommendationScore) ||
                other.globalRecommendationScore == globalRecommendationScore) &&
            const DeepCollectionEquality().equals(
                other.audienceSegmentEngagement, audienceSegmentEngagement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalPosts,
        activePosts,
        archivedPosts,
        totalViews,
        totalUniqueViews,
        totalLikes,
        totalComments,
        totalShares,
        averageEngagementRate,
        averageReadTime,
        averageInteractionRate,
        const DeepCollectionEquality().hash(postsByCategory),
        const DeepCollectionEquality().hash(postsByTag),
        totalUniqueAuthors,
        totalUniqueInteractors,
        const DeepCollectionEquality().hash(postsByMonth),
        const DeepCollectionEquality().hash(postsByYear),
        globalViralityScore,
        globalRecommendationScore,
        const DeepCollectionEquality().hash(audienceSegmentEngagement)
      ]);

  @override
  String toString() {
    return 'GlobalPostMetrics(totalPosts: $totalPosts, activePosts: $activePosts, archivedPosts: $archivedPosts, totalViews: $totalViews, totalUniqueViews: $totalUniqueViews, totalLikes: $totalLikes, totalComments: $totalComments, totalShares: $totalShares, averageEngagementRate: $averageEngagementRate, averageReadTime: $averageReadTime, averageInteractionRate: $averageInteractionRate, postsByCategory: $postsByCategory, postsByTag: $postsByTag, totalUniqueAuthors: $totalUniqueAuthors, totalUniqueInteractors: $totalUniqueInteractors, postsByMonth: $postsByMonth, postsByYear: $postsByYear, globalViralityScore: $globalViralityScore, globalRecommendationScore: $globalRecommendationScore, audienceSegmentEngagement: $audienceSegmentEngagement)';
  }
}

/// @nodoc
abstract mixin class $GlobalPostMetricsCopyWith<$Res> {
  factory $GlobalPostMetricsCopyWith(
          GlobalPostMetrics value, $Res Function(GlobalPostMetrics) _then) =
      _$GlobalPostMetricsCopyWithImpl;
  @useResult
  $Res call(
      {int totalPosts,
      int activePosts,
      int archivedPosts,
      int totalViews,
      int totalUniqueViews,
      int totalLikes,
      int totalComments,
      int totalShares,
      double averageEngagementRate,
      double averageReadTime,
      double averageInteractionRate,
      Map<String, int> postsByCategory,
      Map<String, int> postsByTag,
      int totalUniqueAuthors,
      int totalUniqueInteractors,
      Map<String, int> postsByMonth,
      Map<String, int> postsByYear,
      double globalViralityScore,
      double globalRecommendationScore,
      Map<String, double> audienceSegmentEngagement});
}

/// @nodoc
class _$GlobalPostMetricsCopyWithImpl<$Res>
    implements $GlobalPostMetricsCopyWith<$Res> {
  _$GlobalPostMetricsCopyWithImpl(this._self, this._then);

  final GlobalPostMetrics _self;
  final $Res Function(GlobalPostMetrics) _then;

  /// Create a copy of GlobalPostMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPosts = null,
    Object? activePosts = null,
    Object? archivedPosts = null,
    Object? totalViews = null,
    Object? totalUniqueViews = null,
    Object? totalLikes = null,
    Object? totalComments = null,
    Object? totalShares = null,
    Object? averageEngagementRate = null,
    Object? averageReadTime = null,
    Object? averageInteractionRate = null,
    Object? postsByCategory = null,
    Object? postsByTag = null,
    Object? totalUniqueAuthors = null,
    Object? totalUniqueInteractors = null,
    Object? postsByMonth = null,
    Object? postsByYear = null,
    Object? globalViralityScore = null,
    Object? globalRecommendationScore = null,
    Object? audienceSegmentEngagement = null,
  }) {
    return _then(_self.copyWith(
      totalPosts: null == totalPosts
          ? _self.totalPosts
          : totalPosts // ignore: cast_nullable_to_non_nullable
              as int,
      activePosts: null == activePosts
          ? _self.activePosts
          : activePosts // ignore: cast_nullable_to_non_nullable
              as int,
      archivedPosts: null == archivedPosts
          ? _self.archivedPosts
          : archivedPosts // ignore: cast_nullable_to_non_nullable
              as int,
      totalViews: null == totalViews
          ? _self.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      totalUniqueViews: null == totalUniqueViews
          ? _self.totalUniqueViews
          : totalUniqueViews // ignore: cast_nullable_to_non_nullable
              as int,
      totalLikes: null == totalLikes
          ? _self.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      totalComments: null == totalComments
          ? _self.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      totalShares: null == totalShares
          ? _self.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as int,
      averageEngagementRate: null == averageEngagementRate
          ? _self.averageEngagementRate
          : averageEngagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageReadTime: null == averageReadTime
          ? _self.averageReadTime
          : averageReadTime // ignore: cast_nullable_to_non_nullable
              as double,
      averageInteractionRate: null == averageInteractionRate
          ? _self.averageInteractionRate
          : averageInteractionRate // ignore: cast_nullable_to_non_nullable
              as double,
      postsByCategory: null == postsByCategory
          ? _self.postsByCategory
          : postsByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      postsByTag: null == postsByTag
          ? _self.postsByTag
          : postsByTag // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      totalUniqueAuthors: null == totalUniqueAuthors
          ? _self.totalUniqueAuthors
          : totalUniqueAuthors // ignore: cast_nullable_to_non_nullable
              as int,
      totalUniqueInteractors: null == totalUniqueInteractors
          ? _self.totalUniqueInteractors
          : totalUniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      postsByMonth: null == postsByMonth
          ? _self.postsByMonth
          : postsByMonth // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      postsByYear: null == postsByYear
          ? _self.postsByYear
          : postsByYear // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      globalViralityScore: null == globalViralityScore
          ? _self.globalViralityScore
          : globalViralityScore // ignore: cast_nullable_to_non_nullable
              as double,
      globalRecommendationScore: null == globalRecommendationScore
          ? _self.globalRecommendationScore
          : globalRecommendationScore // ignore: cast_nullable_to_non_nullable
              as double,
      audienceSegmentEngagement: null == audienceSegmentEngagement
          ? _self.audienceSegmentEngagement
          : audienceSegmentEngagement // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GlobalPostMetrics implements GlobalPostMetrics {
  const _GlobalPostMetrics(
      {this.totalPosts = 0,
      this.activePosts = 0,
      this.archivedPosts = 0,
      this.totalViews = 0,
      this.totalUniqueViews = 0,
      this.totalLikes = 0,
      this.totalComments = 0,
      this.totalShares = 0,
      this.averageEngagementRate = 0,
      this.averageReadTime = 0,
      this.averageInteractionRate = 0,
      final Map<String, int> postsByCategory = const {},
      final Map<String, int> postsByTag = const {},
      this.totalUniqueAuthors = 0,
      this.totalUniqueInteractors = 0,
      final Map<String, int> postsByMonth = const {},
      final Map<String, int> postsByYear = const {},
      this.globalViralityScore = 0,
      this.globalRecommendationScore = 0,
      final Map<String, double> audienceSegmentEngagement = const {}})
      : _postsByCategory = postsByCategory,
        _postsByTag = postsByTag,
        _postsByMonth = postsByMonth,
        _postsByYear = postsByYear,
        _audienceSegmentEngagement = audienceSegmentEngagement;
  factory _GlobalPostMetrics.fromJson(Map<String, dynamic> json) =>
      _$GlobalPostMetricsFromJson(json);

// Total Post Counts
  @override
  @JsonKey()
  final int totalPosts;
  @override
  @JsonKey()
  final int activePosts;
  @override
  @JsonKey()
  final int archivedPosts;
// Engagement Aggregates
  @override
  @JsonKey()
  final int totalViews;
  @override
  @JsonKey()
  final int totalUniqueViews;
  @override
  @JsonKey()
  final int totalLikes;
  @override
  @JsonKey()
  final int totalComments;
  @override
  @JsonKey()
  final int totalShares;
// Performance Metrics
  @override
  @JsonKey()
  final double averageEngagementRate;
  @override
  @JsonKey()
  final double averageReadTime;
  @override
  @JsonKey()
  final double averageInteractionRate;
// Content Distribution
  final Map<String, int> _postsByCategory;
// Content Distribution
  @override
  @JsonKey()
  Map<String, int> get postsByCategory {
    if (_postsByCategory is EqualUnmodifiableMapView) return _postsByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postsByCategory);
  }

  final Map<String, int> _postsByTag;
  @override
  @JsonKey()
  Map<String, int> get postsByTag {
    if (_postsByTag is EqualUnmodifiableMapView) return _postsByTag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postsByTag);
  }

// User Interaction
  @override
  @JsonKey()
  final int totalUniqueAuthors;
  @override
  @JsonKey()
  final int totalUniqueInteractors;
// Temporal Metrics
  final Map<String, int> _postsByMonth;
// Temporal Metrics
  @override
  @JsonKey()
  Map<String, int> get postsByMonth {
    if (_postsByMonth is EqualUnmodifiableMapView) return _postsByMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postsByMonth);
  }

  final Map<String, int> _postsByYear;
  @override
  @JsonKey()
  Map<String, int> get postsByYear {
    if (_postsByYear is EqualUnmodifiableMapView) return _postsByYear;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postsByYear);
  }

// Advanced Metrics
  @override
  @JsonKey()
  final double globalViralityScore;
  @override
  @JsonKey()
  final double globalRecommendationScore;
// Audience Insights
  final Map<String, double> _audienceSegmentEngagement;
// Audience Insights
  @override
  @JsonKey()
  Map<String, double> get audienceSegmentEngagement {
    if (_audienceSegmentEngagement is EqualUnmodifiableMapView)
      return _audienceSegmentEngagement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_audienceSegmentEngagement);
  }

  /// Create a copy of GlobalPostMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GlobalPostMetricsCopyWith<_GlobalPostMetrics> get copyWith =>
      __$GlobalPostMetricsCopyWithImpl<_GlobalPostMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GlobalPostMetricsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GlobalPostMetrics &&
            (identical(other.totalPosts, totalPosts) ||
                other.totalPosts == totalPosts) &&
            (identical(other.activePosts, activePosts) ||
                other.activePosts == activePosts) &&
            (identical(other.archivedPosts, archivedPosts) ||
                other.archivedPosts == archivedPosts) &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.totalUniqueViews, totalUniqueViews) ||
                other.totalUniqueViews == totalUniqueViews) &&
            (identical(other.totalLikes, totalLikes) ||
                other.totalLikes == totalLikes) &&
            (identical(other.totalComments, totalComments) ||
                other.totalComments == totalComments) &&
            (identical(other.totalShares, totalShares) ||
                other.totalShares == totalShares) &&
            (identical(other.averageEngagementRate, averageEngagementRate) ||
                other.averageEngagementRate == averageEngagementRate) &&
            (identical(other.averageReadTime, averageReadTime) ||
                other.averageReadTime == averageReadTime) &&
            (identical(other.averageInteractionRate, averageInteractionRate) ||
                other.averageInteractionRate == averageInteractionRate) &&
            const DeepCollectionEquality()
                .equals(other._postsByCategory, _postsByCategory) &&
            const DeepCollectionEquality()
                .equals(other._postsByTag, _postsByTag) &&
            (identical(other.totalUniqueAuthors, totalUniqueAuthors) ||
                other.totalUniqueAuthors == totalUniqueAuthors) &&
            (identical(other.totalUniqueInteractors, totalUniqueInteractors) ||
                other.totalUniqueInteractors == totalUniqueInteractors) &&
            const DeepCollectionEquality()
                .equals(other._postsByMonth, _postsByMonth) &&
            const DeepCollectionEquality()
                .equals(other._postsByYear, _postsByYear) &&
            (identical(other.globalViralityScore, globalViralityScore) ||
                other.globalViralityScore == globalViralityScore) &&
            (identical(other.globalRecommendationScore,
                    globalRecommendationScore) ||
                other.globalRecommendationScore == globalRecommendationScore) &&
            const DeepCollectionEquality().equals(
                other._audienceSegmentEngagement, _audienceSegmentEngagement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalPosts,
        activePosts,
        archivedPosts,
        totalViews,
        totalUniqueViews,
        totalLikes,
        totalComments,
        totalShares,
        averageEngagementRate,
        averageReadTime,
        averageInteractionRate,
        const DeepCollectionEquality().hash(_postsByCategory),
        const DeepCollectionEquality().hash(_postsByTag),
        totalUniqueAuthors,
        totalUniqueInteractors,
        const DeepCollectionEquality().hash(_postsByMonth),
        const DeepCollectionEquality().hash(_postsByYear),
        globalViralityScore,
        globalRecommendationScore,
        const DeepCollectionEquality().hash(_audienceSegmentEngagement)
      ]);

  @override
  String toString() {
    return 'GlobalPostMetrics(totalPosts: $totalPosts, activePosts: $activePosts, archivedPosts: $archivedPosts, totalViews: $totalViews, totalUniqueViews: $totalUniqueViews, totalLikes: $totalLikes, totalComments: $totalComments, totalShares: $totalShares, averageEngagementRate: $averageEngagementRate, averageReadTime: $averageReadTime, averageInteractionRate: $averageInteractionRate, postsByCategory: $postsByCategory, postsByTag: $postsByTag, totalUniqueAuthors: $totalUniqueAuthors, totalUniqueInteractors: $totalUniqueInteractors, postsByMonth: $postsByMonth, postsByYear: $postsByYear, globalViralityScore: $globalViralityScore, globalRecommendationScore: $globalRecommendationScore, audienceSegmentEngagement: $audienceSegmentEngagement)';
  }
}

/// @nodoc
abstract mixin class _$GlobalPostMetricsCopyWith<$Res>
    implements $GlobalPostMetricsCopyWith<$Res> {
  factory _$GlobalPostMetricsCopyWith(
          _GlobalPostMetrics value, $Res Function(_GlobalPostMetrics) _then) =
      __$GlobalPostMetricsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalPosts,
      int activePosts,
      int archivedPosts,
      int totalViews,
      int totalUniqueViews,
      int totalLikes,
      int totalComments,
      int totalShares,
      double averageEngagementRate,
      double averageReadTime,
      double averageInteractionRate,
      Map<String, int> postsByCategory,
      Map<String, int> postsByTag,
      int totalUniqueAuthors,
      int totalUniqueInteractors,
      Map<String, int> postsByMonth,
      Map<String, int> postsByYear,
      double globalViralityScore,
      double globalRecommendationScore,
      Map<String, double> audienceSegmentEngagement});
}

/// @nodoc
class __$GlobalPostMetricsCopyWithImpl<$Res>
    implements _$GlobalPostMetricsCopyWith<$Res> {
  __$GlobalPostMetricsCopyWithImpl(this._self, this._then);

  final _GlobalPostMetrics _self;
  final $Res Function(_GlobalPostMetrics) _then;

  /// Create a copy of GlobalPostMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalPosts = null,
    Object? activePosts = null,
    Object? archivedPosts = null,
    Object? totalViews = null,
    Object? totalUniqueViews = null,
    Object? totalLikes = null,
    Object? totalComments = null,
    Object? totalShares = null,
    Object? averageEngagementRate = null,
    Object? averageReadTime = null,
    Object? averageInteractionRate = null,
    Object? postsByCategory = null,
    Object? postsByTag = null,
    Object? totalUniqueAuthors = null,
    Object? totalUniqueInteractors = null,
    Object? postsByMonth = null,
    Object? postsByYear = null,
    Object? globalViralityScore = null,
    Object? globalRecommendationScore = null,
    Object? audienceSegmentEngagement = null,
  }) {
    return _then(_GlobalPostMetrics(
      totalPosts: null == totalPosts
          ? _self.totalPosts
          : totalPosts // ignore: cast_nullable_to_non_nullable
              as int,
      activePosts: null == activePosts
          ? _self.activePosts
          : activePosts // ignore: cast_nullable_to_non_nullable
              as int,
      archivedPosts: null == archivedPosts
          ? _self.archivedPosts
          : archivedPosts // ignore: cast_nullable_to_non_nullable
              as int,
      totalViews: null == totalViews
          ? _self.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      totalUniqueViews: null == totalUniqueViews
          ? _self.totalUniqueViews
          : totalUniqueViews // ignore: cast_nullable_to_non_nullable
              as int,
      totalLikes: null == totalLikes
          ? _self.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      totalComments: null == totalComments
          ? _self.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      totalShares: null == totalShares
          ? _self.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as int,
      averageEngagementRate: null == averageEngagementRate
          ? _self.averageEngagementRate
          : averageEngagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageReadTime: null == averageReadTime
          ? _self.averageReadTime
          : averageReadTime // ignore: cast_nullable_to_non_nullable
              as double,
      averageInteractionRate: null == averageInteractionRate
          ? _self.averageInteractionRate
          : averageInteractionRate // ignore: cast_nullable_to_non_nullable
              as double,
      postsByCategory: null == postsByCategory
          ? _self._postsByCategory
          : postsByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      postsByTag: null == postsByTag
          ? _self._postsByTag
          : postsByTag // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      totalUniqueAuthors: null == totalUniqueAuthors
          ? _self.totalUniqueAuthors
          : totalUniqueAuthors // ignore: cast_nullable_to_non_nullable
              as int,
      totalUniqueInteractors: null == totalUniqueInteractors
          ? _self.totalUniqueInteractors
          : totalUniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      postsByMonth: null == postsByMonth
          ? _self._postsByMonth
          : postsByMonth // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      postsByYear: null == postsByYear
          ? _self._postsByYear
          : postsByYear // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      globalViralityScore: null == globalViralityScore
          ? _self.globalViralityScore
          : globalViralityScore // ignore: cast_nullable_to_non_nullable
              as double,
      globalRecommendationScore: null == globalRecommendationScore
          ? _self.globalRecommendationScore
          : globalRecommendationScore // ignore: cast_nullable_to_non_nullable
              as double,
      audienceSegmentEngagement: null == audienceSegmentEngagement
          ? _self._audienceSegmentEngagement
          : audienceSegmentEngagement // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

// dart format on
