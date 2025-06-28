// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostEngagementMetrics {
// View and Interaction Metrics
  int get totalViews;
  int get uniqueViews; // Reaction Metrics
  List<String> get likes;
  List<String> get dislikes; // Comment and Discussion Metrics
  int get totalComments;
  int get activeDiscussions;
  int get topLevelComments;
  int get nestedComments; // Sharing and Distribution
  int get shares; // Performance Metrics
  double get engagementRate;
  double get reachRate; // User Interaction Details
  int get uniqueInteractors; // Content Performance
  double get averageReadTime;
  int get scrollDepth;

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostEngagementMetricsCopyWith<PostEngagementMetrics> get copyWith =>
      _$PostEngagementMetricsCopyWithImpl<PostEngagementMetrics>(
          this as PostEngagementMetrics, _$identity);

  /// Serializes this PostEngagementMetrics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostEngagementMetrics &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.uniqueViews, uniqueViews) ||
                other.uniqueViews == uniqueViews) &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality().equals(other.dislikes, dislikes) &&
            (identical(other.totalComments, totalComments) ||
                other.totalComments == totalComments) &&
            (identical(other.activeDiscussions, activeDiscussions) ||
                other.activeDiscussions == activeDiscussions) &&
            (identical(other.topLevelComments, topLevelComments) ||
                other.topLevelComments == topLevelComments) &&
            (identical(other.nestedComments, nestedComments) ||
                other.nestedComments == nestedComments) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.engagementRate, engagementRate) ||
                other.engagementRate == engagementRate) &&
            (identical(other.reachRate, reachRate) ||
                other.reachRate == reachRate) &&
            (identical(other.uniqueInteractors, uniqueInteractors) ||
                other.uniqueInteractors == uniqueInteractors) &&
            (identical(other.averageReadTime, averageReadTime) ||
                other.averageReadTime == averageReadTime) &&
            (identical(other.scrollDepth, scrollDepth) ||
                other.scrollDepth == scrollDepth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalViews,
      uniqueViews,
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(dislikes),
      totalComments,
      activeDiscussions,
      topLevelComments,
      nestedComments,
      shares,
      engagementRate,
      reachRate,
      uniqueInteractors,
      averageReadTime,
      scrollDepth);

  @override
  String toString() {
    return 'PostEngagementMetrics(totalViews: $totalViews, uniqueViews: $uniqueViews, likes: $likes, dislikes: $dislikes, totalComments: $totalComments, activeDiscussions: $activeDiscussions, topLevelComments: $topLevelComments, nestedComments: $nestedComments, shares: $shares, engagementRate: $engagementRate, reachRate: $reachRate, uniqueInteractors: $uniqueInteractors, averageReadTime: $averageReadTime, scrollDepth: $scrollDepth)';
  }
}

/// @nodoc
abstract mixin class $PostEngagementMetricsCopyWith<$Res> {
  factory $PostEngagementMetricsCopyWith(PostEngagementMetrics value,
          $Res Function(PostEngagementMetrics) _then) =
      _$PostEngagementMetricsCopyWithImpl;
  @useResult
  $Res call(
      {int totalViews,
      int uniqueViews,
      List<String> likes,
      List<String> dislikes,
      int totalComments,
      int activeDiscussions,
      int topLevelComments,
      int nestedComments,
      int shares,
      double engagementRate,
      double reachRate,
      int uniqueInteractors,
      double averageReadTime,
      int scrollDepth});
}

/// @nodoc
class _$PostEngagementMetricsCopyWithImpl<$Res>
    implements $PostEngagementMetricsCopyWith<$Res> {
  _$PostEngagementMetricsCopyWithImpl(this._self, this._then);

  final PostEngagementMetrics _self;
  final $Res Function(PostEngagementMetrics) _then;

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalViews = null,
    Object? uniqueViews = null,
    Object? likes = null,
    Object? dislikes = null,
    Object? totalComments = null,
    Object? activeDiscussions = null,
    Object? topLevelComments = null,
    Object? nestedComments = null,
    Object? shares = null,
    Object? engagementRate = null,
    Object? reachRate = null,
    Object? uniqueInteractors = null,
    Object? averageReadTime = null,
    Object? scrollDepth = null,
  }) {
    return _then(_self.copyWith(
      totalViews: null == totalViews
          ? _self.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueViews: null == uniqueViews
          ? _self.uniqueViews
          : uniqueViews // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dislikes: null == dislikes
          ? _self.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalComments: null == totalComments
          ? _self.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      activeDiscussions: null == activeDiscussions
          ? _self.activeDiscussions
          : activeDiscussions // ignore: cast_nullable_to_non_nullable
              as int,
      topLevelComments: null == topLevelComments
          ? _self.topLevelComments
          : topLevelComments // ignore: cast_nullable_to_non_nullable
              as int,
      nestedComments: null == nestedComments
          ? _self.nestedComments
          : nestedComments // ignore: cast_nullable_to_non_nullable
              as int,
      shares: null == shares
          ? _self.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      engagementRate: null == engagementRate
          ? _self.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      reachRate: null == reachRate
          ? _self.reachRate
          : reachRate // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueInteractors: null == uniqueInteractors
          ? _self.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      averageReadTime: null == averageReadTime
          ? _self.averageReadTime
          : averageReadTime // ignore: cast_nullable_to_non_nullable
              as double,
      scrollDepth: null == scrollDepth
          ? _self.scrollDepth
          : scrollDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PostEngagementMetrics implements PostEngagementMetrics {
  const _PostEngagementMetrics(
      {this.totalViews = 0,
      this.uniqueViews = 0,
      final List<String> likes = const [],
      final List<String> dislikes = const [],
      this.totalComments = 0,
      this.activeDiscussions = 0,
      this.topLevelComments = 0,
      this.nestedComments = 0,
      this.shares = 0,
      this.engagementRate = 0,
      this.reachRate = 0,
      this.uniqueInteractors = 0,
      this.averageReadTime = 0,
      this.scrollDepth = 0})
      : _likes = likes,
        _dislikes = dislikes;
  factory _PostEngagementMetrics.fromJson(Map<String, dynamic> json) =>
      _$PostEngagementMetricsFromJson(json);

// View and Interaction Metrics
  @override
  @JsonKey()
  final int totalViews;
  @override
  @JsonKey()
  final int uniqueViews;
// Reaction Metrics
  final List<String> _likes;
// Reaction Metrics
  @override
  @JsonKey()
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  final List<String> _dislikes;
  @override
  @JsonKey()
  List<String> get dislikes {
    if (_dislikes is EqualUnmodifiableListView) return _dislikes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dislikes);
  }

// Comment and Discussion Metrics
  @override
  @JsonKey()
  final int totalComments;
  @override
  @JsonKey()
  final int activeDiscussions;
  @override
  @JsonKey()
  final int topLevelComments;
  @override
  @JsonKey()
  final int nestedComments;
// Sharing and Distribution
  @override
  @JsonKey()
  final int shares;
// Performance Metrics
  @override
  @JsonKey()
  final double engagementRate;
  @override
  @JsonKey()
  final double reachRate;
// User Interaction Details
  @override
  @JsonKey()
  final int uniqueInteractors;
// Content Performance
  @override
  @JsonKey()
  final double averageReadTime;
  @override
  @JsonKey()
  final int scrollDepth;

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostEngagementMetricsCopyWith<_PostEngagementMetrics> get copyWith =>
      __$PostEngagementMetricsCopyWithImpl<_PostEngagementMetrics>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostEngagementMetricsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostEngagementMetrics &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.uniqueViews, uniqueViews) ||
                other.uniqueViews == uniqueViews) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._dislikes, _dislikes) &&
            (identical(other.totalComments, totalComments) ||
                other.totalComments == totalComments) &&
            (identical(other.activeDiscussions, activeDiscussions) ||
                other.activeDiscussions == activeDiscussions) &&
            (identical(other.topLevelComments, topLevelComments) ||
                other.topLevelComments == topLevelComments) &&
            (identical(other.nestedComments, nestedComments) ||
                other.nestedComments == nestedComments) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.engagementRate, engagementRate) ||
                other.engagementRate == engagementRate) &&
            (identical(other.reachRate, reachRate) ||
                other.reachRate == reachRate) &&
            (identical(other.uniqueInteractors, uniqueInteractors) ||
                other.uniqueInteractors == uniqueInteractors) &&
            (identical(other.averageReadTime, averageReadTime) ||
                other.averageReadTime == averageReadTime) &&
            (identical(other.scrollDepth, scrollDepth) ||
                other.scrollDepth == scrollDepth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalViews,
      uniqueViews,
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_dislikes),
      totalComments,
      activeDiscussions,
      topLevelComments,
      nestedComments,
      shares,
      engagementRate,
      reachRate,
      uniqueInteractors,
      averageReadTime,
      scrollDepth);

  @override
  String toString() {
    return 'PostEngagementMetrics(totalViews: $totalViews, uniqueViews: $uniqueViews, likes: $likes, dislikes: $dislikes, totalComments: $totalComments, activeDiscussions: $activeDiscussions, topLevelComments: $topLevelComments, nestedComments: $nestedComments, shares: $shares, engagementRate: $engagementRate, reachRate: $reachRate, uniqueInteractors: $uniqueInteractors, averageReadTime: $averageReadTime, scrollDepth: $scrollDepth)';
  }
}

/// @nodoc
abstract mixin class _$PostEngagementMetricsCopyWith<$Res>
    implements $PostEngagementMetricsCopyWith<$Res> {
  factory _$PostEngagementMetricsCopyWith(_PostEngagementMetrics value,
          $Res Function(_PostEngagementMetrics) _then) =
      __$PostEngagementMetricsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalViews,
      int uniqueViews,
      List<String> likes,
      List<String> dislikes,
      int totalComments,
      int activeDiscussions,
      int topLevelComments,
      int nestedComments,
      int shares,
      double engagementRate,
      double reachRate,
      int uniqueInteractors,
      double averageReadTime,
      int scrollDepth});
}

/// @nodoc
class __$PostEngagementMetricsCopyWithImpl<$Res>
    implements _$PostEngagementMetricsCopyWith<$Res> {
  __$PostEngagementMetricsCopyWithImpl(this._self, this._then);

  final _PostEngagementMetrics _self;
  final $Res Function(_PostEngagementMetrics) _then;

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalViews = null,
    Object? uniqueViews = null,
    Object? likes = null,
    Object? dislikes = null,
    Object? totalComments = null,
    Object? activeDiscussions = null,
    Object? topLevelComments = null,
    Object? nestedComments = null,
    Object? shares = null,
    Object? engagementRate = null,
    Object? reachRate = null,
    Object? uniqueInteractors = null,
    Object? averageReadTime = null,
    Object? scrollDepth = null,
  }) {
    return _then(_PostEngagementMetrics(
      totalViews: null == totalViews
          ? _self.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueViews: null == uniqueViews
          ? _self.uniqueViews
          : uniqueViews // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _self._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dislikes: null == dislikes
          ? _self._dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalComments: null == totalComments
          ? _self.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      activeDiscussions: null == activeDiscussions
          ? _self.activeDiscussions
          : activeDiscussions // ignore: cast_nullable_to_non_nullable
              as int,
      topLevelComments: null == topLevelComments
          ? _self.topLevelComments
          : topLevelComments // ignore: cast_nullable_to_non_nullable
              as int,
      nestedComments: null == nestedComments
          ? _self.nestedComments
          : nestedComments // ignore: cast_nullable_to_non_nullable
              as int,
      shares: null == shares
          ? _self.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      engagementRate: null == engagementRate
          ? _self.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      reachRate: null == reachRate
          ? _self.reachRate
          : reachRate // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueInteractors: null == uniqueInteractors
          ? _self.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      averageReadTime: null == averageReadTime
          ? _self.averageReadTime
          : averageReadTime // ignore: cast_nullable_to_non_nullable
              as double,
      scrollDepth: null == scrollDepth
          ? _self.scrollDepth
          : scrollDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
