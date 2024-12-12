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
  List<String> get likes => throw _privateConstructorUsedError;
  List<String> get dislikes =>
      throw _privateConstructorUsedError; // Comment and Discussion Metrics
  int get totalComments => throw _privateConstructorUsedError;
  int get activeDiscussions => throw _privateConstructorUsedError;
  int get topLevelComments => throw _privateConstructorUsedError;
  int get nestedComments =>
      throw _privateConstructorUsedError; // Sharing and Distribution
  int get shares => throw _privateConstructorUsedError; // Performance Metrics
  double get engagementRate => throw _privateConstructorUsedError;
  double get reachRate =>
      throw _privateConstructorUsedError; // User Interaction Details
  int get uniqueInteractors =>
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
              as List<String>,
      dislikes: null == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      engagementRate: null == engagementRate
          ? _value.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      reachRate: null == reachRate
          ? _value.reachRate
          : reachRate // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueInteractors: null == uniqueInteractors
          ? _value.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
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
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dislikes: null == dislikes
          ? _value._dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      engagementRate: null == engagementRate
          ? _value.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      reachRate: null == reachRate
          ? _value.reachRate
          : reachRate // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueInteractors: null == uniqueInteractors
          ? _value.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
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

  @override
  String toString() {
    return 'PostEngagementMetrics(totalViews: $totalViews, uniqueViews: $uniqueViews, likes: $likes, dislikes: $dislikes, totalComments: $totalComments, activeDiscussions: $activeDiscussions, topLevelComments: $topLevelComments, nestedComments: $nestedComments, shares: $shares, engagementRate: $engagementRate, reachRate: $reachRate, uniqueInteractors: $uniqueInteractors, averageReadTime: $averageReadTime, scrollDepth: $scrollDepth)';
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
      final List<String> likes,
      final List<String> dislikes,
      final int totalComments,
      final int activeDiscussions,
      final int topLevelComments,
      final int nestedComments,
      final int shares,
      final double engagementRate,
      final double reachRate,
      final int uniqueInteractors,
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
  List<String> get likes;
  @override
  List<String> get dislikes; // Comment and Discussion Metrics
  @override
  int get totalComments;
  @override
  int get activeDiscussions;
  @override
  int get topLevelComments;
  @override
  int get nestedComments; // Sharing and Distribution
  @override
  int get shares; // Performance Metrics
  @override
  double get engagementRate;
  @override
  double get reachRate; // User Interaction Details
  @override
  int get uniqueInteractors; // Content Performance
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
