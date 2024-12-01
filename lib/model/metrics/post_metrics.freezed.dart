// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostEngagementMetrics _$PostEngagementMetricsFromJson(
    Map<String, dynamic> json) {
  return _PostEngagementMetrics.fromJson(json);
}

/// @nodoc
mixin _$PostEngagementMetrics {
// View and Interaction Metrics
  int get totalViews => throw _privateConstructorUsedError;
  int get uniqueViews => throw _privateConstructorUsedError; // Reaction Metrics
  int get likes => throw _privateConstructorUsedError;
  int get dislikes => throw _privateConstructorUsedError;
  Map<String, int> get reactionBreakdown =>
      throw _privateConstructorUsedError; // Comment and Discussion Metrics
  int get totalComments => throw _privateConstructorUsedError;
  int get activeDiscussions => throw _privateConstructorUsedError;
  int get topLevelComments => throw _privateConstructorUsedError;
  int get nestedComments =>
      throw _privateConstructorUsedError; // Sharing and Distribution
  int get shares => throw _privateConstructorUsedError;
  Map<String, int> get shareChannels =>
      throw _privateConstructorUsedError; // e.g., 'facebook': 10, 'twitter': 5
// Performance Metrics
  double get engagementRate => throw _privateConstructorUsedError;
  double get reachRate =>
      throw _privateConstructorUsedError; // Temporal Engagement Tracking
  Map<String, int> get dailyEngagement => throw _privateConstructorUsedError;
  Map<String, int> get hourlyEngagement =>
      throw _privateConstructorUsedError; // User Interaction Details
  int get uniqueInteractors => throw _privateConstructorUsedError;
  List<String> get topInteractors =>
      throw _privateConstructorUsedError; // Content Performance
  double get averageReadTime => throw _privateConstructorUsedError;
  int get scrollDepth => throw _privateConstructorUsedError;

  /// Serializes this PostEngagementMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostEngagementMetricsCopyWith<PostEngagementMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEngagementMetricsCopyWith<$Res> {
  factory $PostEngagementMetricsCopyWith(PostEngagementMetrics value,
          $Res Function(PostEngagementMetrics) then) =
      _$PostEngagementMetricsCopyWithImpl<$Res, PostEngagementMetrics>;
  @useResult
  $Res call(
      {int totalViews,
      int uniqueViews,
      int likes,
      int dislikes,
      Map<String, int> reactionBreakdown,
      int totalComments,
      int activeDiscussions,
      int topLevelComments,
      int nestedComments,
      int shares,
      Map<String, int> shareChannels,
      double engagementRate,
      double reachRate,
      Map<String, int> dailyEngagement,
      Map<String, int> hourlyEngagement,
      int uniqueInteractors,
      List<String> topInteractors,
      double averageReadTime,
      int scrollDepth});
}

/// @nodoc
class _$PostEngagementMetricsCopyWithImpl<$Res,
        $Val extends PostEngagementMetrics>
    implements $PostEngagementMetricsCopyWith<$Res> {
  _$PostEngagementMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalViews = null,
    Object? uniqueViews = null,
    Object? likes = null,
    Object? dislikes = null,
    Object? reactionBreakdown = null,
    Object? totalComments = null,
    Object? activeDiscussions = null,
    Object? topLevelComments = null,
    Object? nestedComments = null,
    Object? shares = null,
    Object? shareChannels = null,
    Object? engagementRate = null,
    Object? reachRate = null,
    Object? dailyEngagement = null,
    Object? hourlyEngagement = null,
    Object? uniqueInteractors = null,
    Object? topInteractors = null,
    Object? averageReadTime = null,
    Object? scrollDepth = null,
  }) {
    return _then(_value.copyWith(
      totalViews: null == totalViews
          ? _value.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueViews: null == uniqueViews
          ? _value.uniqueViews
          : uniqueViews // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      reactionBreakdown: null == reactionBreakdown
          ? _value.reactionBreakdown
          : reactionBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      totalComments: null == totalComments
          ? _value.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      activeDiscussions: null == activeDiscussions
          ? _value.activeDiscussions
          : activeDiscussions // ignore: cast_nullable_to_non_nullable
              as int,
      topLevelComments: null == topLevelComments
          ? _value.topLevelComments
          : topLevelComments // ignore: cast_nullable_to_non_nullable
              as int,
      nestedComments: null == nestedComments
          ? _value.nestedComments
          : nestedComments // ignore: cast_nullable_to_non_nullable
              as int,
      shares: null == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      shareChannels: null == shareChannels
          ? _value.shareChannels
          : shareChannels // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      engagementRate: null == engagementRate
          ? _value.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      reachRate: null == reachRate
          ? _value.reachRate
          : reachRate // ignore: cast_nullable_to_non_nullable
              as double,
      dailyEngagement: null == dailyEngagement
          ? _value.dailyEngagement
          : dailyEngagement // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      hourlyEngagement: null == hourlyEngagement
          ? _value.hourlyEngagement
          : hourlyEngagement // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      uniqueInteractors: null == uniqueInteractors
          ? _value.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      topInteractors: null == topInteractors
          ? _value.topInteractors
          : topInteractors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      averageReadTime: null == averageReadTime
          ? _value.averageReadTime
          : averageReadTime // ignore: cast_nullable_to_non_nullable
              as double,
      scrollDepth: null == scrollDepth
          ? _value.scrollDepth
          : scrollDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostEngagementMetricsImplCopyWith<$Res>
    implements $PostEngagementMetricsCopyWith<$Res> {
  factory _$$PostEngagementMetricsImplCopyWith(
          _$PostEngagementMetricsImpl value,
          $Res Function(_$PostEngagementMetricsImpl) then) =
      __$$PostEngagementMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalViews,
      int uniqueViews,
      int likes,
      int dislikes,
      Map<String, int> reactionBreakdown,
      int totalComments,
      int activeDiscussions,
      int topLevelComments,
      int nestedComments,
      int shares,
      Map<String, int> shareChannels,
      double engagementRate,
      double reachRate,
      Map<String, int> dailyEngagement,
      Map<String, int> hourlyEngagement,
      int uniqueInteractors,
      List<String> topInteractors,
      double averageReadTime,
      int scrollDepth});
}

/// @nodoc
class __$$PostEngagementMetricsImplCopyWithImpl<$Res>
    extends _$PostEngagementMetricsCopyWithImpl<$Res,
        _$PostEngagementMetricsImpl>
    implements _$$PostEngagementMetricsImplCopyWith<$Res> {
  __$$PostEngagementMetricsImplCopyWithImpl(_$PostEngagementMetricsImpl _value,
      $Res Function(_$PostEngagementMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalViews = null,
    Object? uniqueViews = null,
    Object? likes = null,
    Object? dislikes = null,
    Object? reactionBreakdown = null,
    Object? totalComments = null,
    Object? activeDiscussions = null,
    Object? topLevelComments = null,
    Object? nestedComments = null,
    Object? shares = null,
    Object? shareChannels = null,
    Object? engagementRate = null,
    Object? reachRate = null,
    Object? dailyEngagement = null,
    Object? hourlyEngagement = null,
    Object? uniqueInteractors = null,
    Object? topInteractors = null,
    Object? averageReadTime = null,
    Object? scrollDepth = null,
  }) {
    return _then(_$PostEngagementMetricsImpl(
      totalViews: null == totalViews
          ? _value.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueViews: null == uniqueViews
          ? _value.uniqueViews
          : uniqueViews // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      reactionBreakdown: null == reactionBreakdown
          ? _value._reactionBreakdown
          : reactionBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      totalComments: null == totalComments
          ? _value.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      activeDiscussions: null == activeDiscussions
          ? _value.activeDiscussions
          : activeDiscussions // ignore: cast_nullable_to_non_nullable
              as int,
      topLevelComments: null == topLevelComments
          ? _value.topLevelComments
          : topLevelComments // ignore: cast_nullable_to_non_nullable
              as int,
      nestedComments: null == nestedComments
          ? _value.nestedComments
          : nestedComments // ignore: cast_nullable_to_non_nullable
              as int,
      shares: null == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      shareChannels: null == shareChannels
          ? _value._shareChannels
          : shareChannels // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      engagementRate: null == engagementRate
          ? _value.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      reachRate: null == reachRate
          ? _value.reachRate
          : reachRate // ignore: cast_nullable_to_non_nullable
              as double,
      dailyEngagement: null == dailyEngagement
          ? _value._dailyEngagement
          : dailyEngagement // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      hourlyEngagement: null == hourlyEngagement
          ? _value._hourlyEngagement
          : hourlyEngagement // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      uniqueInteractors: null == uniqueInteractors
          ? _value.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      topInteractors: null == topInteractors
          ? _value._topInteractors
          : topInteractors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      averageReadTime: null == averageReadTime
          ? _value.averageReadTime
          : averageReadTime // ignore: cast_nullable_to_non_nullable
              as double,
      scrollDepth: null == scrollDepth
          ? _value.scrollDepth
          : scrollDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostEngagementMetricsImpl implements _PostEngagementMetrics {
  const _$PostEngagementMetricsImpl(
      {this.totalViews = 0,
      this.uniqueViews = 0,
      this.likes = 0,
      this.dislikes = 0,
      final Map<String, int> reactionBreakdown = const {},
      this.totalComments = 0,
      this.activeDiscussions = 0,
      this.topLevelComments = 0,
      this.nestedComments = 0,
      this.shares = 0,
      final Map<String, int> shareChannels = const {},
      this.engagementRate = 0,
      this.reachRate = 0,
      final Map<String, int> dailyEngagement = const {},
      final Map<String, int> hourlyEngagement = const {},
      this.uniqueInteractors = 0,
      final List<String> topInteractors = const [],
      this.averageReadTime = 0,
      this.scrollDepth = 0})
      : _reactionBreakdown = reactionBreakdown,
        _shareChannels = shareChannels,
        _dailyEngagement = dailyEngagement,
        _hourlyEngagement = hourlyEngagement,
        _topInteractors = topInteractors;

  factory _$PostEngagementMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostEngagementMetricsImplFromJson(json);

// View and Interaction Metrics
  @override
  @JsonKey()
  final int totalViews;
  @override
  @JsonKey()
  final int uniqueViews;
// Reaction Metrics
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final int dislikes;
  final Map<String, int> _reactionBreakdown;
  @override
  @JsonKey()
  Map<String, int> get reactionBreakdown {
    if (_reactionBreakdown is EqualUnmodifiableMapView)
      return _reactionBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reactionBreakdown);
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
  final Map<String, int> _shareChannels;
  @override
  @JsonKey()
  Map<String, int> get shareChannels {
    if (_shareChannels is EqualUnmodifiableMapView) return _shareChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_shareChannels);
  }

// e.g., 'facebook': 10, 'twitter': 5
// Performance Metrics
  @override
  @JsonKey()
  final double engagementRate;
  @override
  @JsonKey()
  final double reachRate;
// Temporal Engagement Tracking
  final Map<String, int> _dailyEngagement;
// Temporal Engagement Tracking
  @override
  @JsonKey()
  Map<String, int> get dailyEngagement {
    if (_dailyEngagement is EqualUnmodifiableMapView) return _dailyEngagement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dailyEngagement);
  }

  final Map<String, int> _hourlyEngagement;
  @override
  @JsonKey()
  Map<String, int> get hourlyEngagement {
    if (_hourlyEngagement is EqualUnmodifiableMapView) return _hourlyEngagement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_hourlyEngagement);
  }

// User Interaction Details
  @override
  @JsonKey()
  final int uniqueInteractors;
  final List<String> _topInteractors;
  @override
  @JsonKey()
  List<String> get topInteractors {
    if (_topInteractors is EqualUnmodifiableListView) return _topInteractors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topInteractors);
  }

// Content Performance
  @override
  @JsonKey()
  final double averageReadTime;
  @override
  @JsonKey()
  final int scrollDepth;

  @override
  String toString() {
    return 'PostEngagementMetrics(totalViews: $totalViews, uniqueViews: $uniqueViews, likes: $likes, dislikes: $dislikes, reactionBreakdown: $reactionBreakdown, totalComments: $totalComments, activeDiscussions: $activeDiscussions, topLevelComments: $topLevelComments, nestedComments: $nestedComments, shares: $shares, shareChannels: $shareChannels, engagementRate: $engagementRate, reachRate: $reachRate, dailyEngagement: $dailyEngagement, hourlyEngagement: $hourlyEngagement, uniqueInteractors: $uniqueInteractors, topInteractors: $topInteractors, averageReadTime: $averageReadTime, scrollDepth: $scrollDepth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostEngagementMetricsImpl &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.uniqueViews, uniqueViews) ||
                other.uniqueViews == uniqueViews) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            const DeepCollectionEquality()
                .equals(other._reactionBreakdown, _reactionBreakdown) &&
            (identical(other.totalComments, totalComments) ||
                other.totalComments == totalComments) &&
            (identical(other.activeDiscussions, activeDiscussions) ||
                other.activeDiscussions == activeDiscussions) &&
            (identical(other.topLevelComments, topLevelComments) ||
                other.topLevelComments == topLevelComments) &&
            (identical(other.nestedComments, nestedComments) ||
                other.nestedComments == nestedComments) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            const DeepCollectionEquality()
                .equals(other._shareChannels, _shareChannels) &&
            (identical(other.engagementRate, engagementRate) ||
                other.engagementRate == engagementRate) &&
            (identical(other.reachRate, reachRate) ||
                other.reachRate == reachRate) &&
            const DeepCollectionEquality()
                .equals(other._dailyEngagement, _dailyEngagement) &&
            const DeepCollectionEquality()
                .equals(other._hourlyEngagement, _hourlyEngagement) &&
            (identical(other.uniqueInteractors, uniqueInteractors) ||
                other.uniqueInteractors == uniqueInteractors) &&
            const DeepCollectionEquality()
                .equals(other._topInteractors, _topInteractors) &&
            (identical(other.averageReadTime, averageReadTime) ||
                other.averageReadTime == averageReadTime) &&
            (identical(other.scrollDepth, scrollDepth) ||
                other.scrollDepth == scrollDepth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalViews,
        uniqueViews,
        likes,
        dislikes,
        const DeepCollectionEquality().hash(_reactionBreakdown),
        totalComments,
        activeDiscussions,
        topLevelComments,
        nestedComments,
        shares,
        const DeepCollectionEquality().hash(_shareChannels),
        engagementRate,
        reachRate,
        const DeepCollectionEquality().hash(_dailyEngagement),
        const DeepCollectionEquality().hash(_hourlyEngagement),
        uniqueInteractors,
        const DeepCollectionEquality().hash(_topInteractors),
        averageReadTime,
        scrollDepth
      ]);

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostEngagementMetricsImplCopyWith<_$PostEngagementMetricsImpl>
      get copyWith => __$$PostEngagementMetricsImplCopyWithImpl<
          _$PostEngagementMetricsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostEngagementMetricsImplToJson(
      this,
    );
  }
}

abstract class _PostEngagementMetrics implements PostEngagementMetrics {
  const factory _PostEngagementMetrics(
      {final int totalViews,
      final int uniqueViews,
      final int likes,
      final int dislikes,
      final Map<String, int> reactionBreakdown,
      final int totalComments,
      final int activeDiscussions,
      final int topLevelComments,
      final int nestedComments,
      final int shares,
      final Map<String, int> shareChannels,
      final double engagementRate,
      final double reachRate,
      final Map<String, int> dailyEngagement,
      final Map<String, int> hourlyEngagement,
      final int uniqueInteractors,
      final List<String> topInteractors,
      final double averageReadTime,
      final int scrollDepth}) = _$PostEngagementMetricsImpl;

  factory _PostEngagementMetrics.fromJson(Map<String, dynamic> json) =
      _$PostEngagementMetricsImpl.fromJson;

// View and Interaction Metrics
  @override
  int get totalViews;
  @override
  int get uniqueViews; // Reaction Metrics
  @override
  int get likes;
  @override
  int get dislikes;
  @override
  Map<String, int> get reactionBreakdown; // Comment and Discussion Metrics
  @override
  int get totalComments;
  @override
  int get activeDiscussions;
  @override
  int get topLevelComments;
  @override
  int get nestedComments; // Sharing and Distribution
  @override
  int get shares;
  @override
  Map<String, int> get shareChannels; // e.g., 'facebook': 10, 'twitter': 5
// Performance Metrics
  @override
  double get engagementRate;
  @override
  double get reachRate; // Temporal Engagement Tracking
  @override
  Map<String, int> get dailyEngagement;
  @override
  Map<String, int> get hourlyEngagement; // User Interaction Details
  @override
  int get uniqueInteractors;
  @override
  List<String> get topInteractors; // Content Performance
  @override
  double get averageReadTime;
  @override
  int get scrollDepth;

  /// Create a copy of PostEngagementMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostEngagementMetricsImplCopyWith<_$PostEngagementMetricsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
