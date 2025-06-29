// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentMetrics {
// Engagement Metrics
  int get likes;
  int get dislikes;
  int get replies; // Interaction Tracking
  int get interactions;
  int get uniqueInteractors; // Timestamp Tracking
  DateTime? get initialTimestamp;
  DateTime? get lastInteractionTimestamp; // Performance Metrics
  double get engagementRate;
  double get sentimentScore; // Spam and Moderation
  int get reportCount;
  bool get isFlagged;

  /// Create a copy of CommentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentMetricsCopyWith<CommentMetrics> get copyWith =>
      _$CommentMetricsCopyWithImpl<CommentMetrics>(
          this as CommentMetrics, _$identity);

  /// Serializes this CommentMetrics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentMetrics &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            (identical(other.replies, replies) || other.replies == replies) &&
            (identical(other.interactions, interactions) ||
                other.interactions == interactions) &&
            (identical(other.uniqueInteractors, uniqueInteractors) ||
                other.uniqueInteractors == uniqueInteractors) &&
            (identical(other.initialTimestamp, initialTimestamp) ||
                other.initialTimestamp == initialTimestamp) &&
            (identical(
                    other.lastInteractionTimestamp, lastInteractionTimestamp) ||
                other.lastInteractionTimestamp == lastInteractionTimestamp) &&
            (identical(other.engagementRate, engagementRate) ||
                other.engagementRate == engagementRate) &&
            (identical(other.sentimentScore, sentimentScore) ||
                other.sentimentScore == sentimentScore) &&
            (identical(other.reportCount, reportCount) ||
                other.reportCount == reportCount) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      likes,
      dislikes,
      replies,
      interactions,
      uniqueInteractors,
      initialTimestamp,
      lastInteractionTimestamp,
      engagementRate,
      sentimentScore,
      reportCount,
      isFlagged);

  @override
  String toString() {
    return 'CommentMetrics(likes: $likes, dislikes: $dislikes, replies: $replies, interactions: $interactions, uniqueInteractors: $uniqueInteractors, initialTimestamp: $initialTimestamp, lastInteractionTimestamp: $lastInteractionTimestamp, engagementRate: $engagementRate, sentimentScore: $sentimentScore, reportCount: $reportCount, isFlagged: $isFlagged)';
  }
}

/// @nodoc
abstract mixin class $CommentMetricsCopyWith<$Res> {
  factory $CommentMetricsCopyWith(
          CommentMetrics value, $Res Function(CommentMetrics) _then) =
      _$CommentMetricsCopyWithImpl;
  @useResult
  $Res call(
      {int likes,
      int dislikes,
      int replies,
      int interactions,
      int uniqueInteractors,
      DateTime? initialTimestamp,
      DateTime? lastInteractionTimestamp,
      double engagementRate,
      double sentimentScore,
      int reportCount,
      bool isFlagged});
}

/// @nodoc
class _$CommentMetricsCopyWithImpl<$Res>
    implements $CommentMetricsCopyWith<$Res> {
  _$CommentMetricsCopyWithImpl(this._self, this._then);

  final CommentMetrics _self;
  final $Res Function(CommentMetrics) _then;

  /// Create a copy of CommentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likes = null,
    Object? dislikes = null,
    Object? replies = null,
    Object? interactions = null,
    Object? uniqueInteractors = null,
    Object? initialTimestamp = freezed,
    Object? lastInteractionTimestamp = freezed,
    Object? engagementRate = null,
    Object? sentimentScore = null,
    Object? reportCount = null,
    Object? isFlagged = null,
  }) {
    return _then(_self.copyWith(
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _self.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
      interactions: null == interactions
          ? _self.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueInteractors: null == uniqueInteractors
          ? _self.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      initialTimestamp: freezed == initialTimestamp
          ? _self.initialTimestamp
          : initialTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastInteractionTimestamp: freezed == lastInteractionTimestamp
          ? _self.lastInteractionTimestamp
          : lastInteractionTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementRate: null == engagementRate
          ? _self.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      sentimentScore: null == sentimentScore
          ? _self.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      reportCount: null == reportCount
          ? _self.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFlagged: null == isFlagged
          ? _self.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CommentMetrics implements CommentMetrics {
  const _CommentMetrics(
      {this.likes = 0,
      this.dislikes = 0,
      this.replies = 0,
      this.interactions = 0,
      this.uniqueInteractors = 0,
      this.initialTimestamp,
      this.lastInteractionTimestamp,
      this.engagementRate = 0,
      this.sentimentScore = 0,
      this.reportCount = 0,
      this.isFlagged = false});
  factory _CommentMetrics.fromJson(Map<String, dynamic> json) =>
      _$CommentMetricsFromJson(json);

// Engagement Metrics
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final int dislikes;
  @override
  @JsonKey()
  final int replies;
// Interaction Tracking
  @override
  @JsonKey()
  final int interactions;
  @override
  @JsonKey()
  final int uniqueInteractors;
// Timestamp Tracking
  @override
  final DateTime? initialTimestamp;
  @override
  final DateTime? lastInteractionTimestamp;
// Performance Metrics
  @override
  @JsonKey()
  final double engagementRate;
  @override
  @JsonKey()
  final double sentimentScore;
// Spam and Moderation
  @override
  @JsonKey()
  final int reportCount;
  @override
  @JsonKey()
  final bool isFlagged;

  /// Create a copy of CommentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentMetricsCopyWith<_CommentMetrics> get copyWith =>
      __$CommentMetricsCopyWithImpl<_CommentMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentMetricsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentMetrics &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            (identical(other.replies, replies) || other.replies == replies) &&
            (identical(other.interactions, interactions) ||
                other.interactions == interactions) &&
            (identical(other.uniqueInteractors, uniqueInteractors) ||
                other.uniqueInteractors == uniqueInteractors) &&
            (identical(other.initialTimestamp, initialTimestamp) ||
                other.initialTimestamp == initialTimestamp) &&
            (identical(
                    other.lastInteractionTimestamp, lastInteractionTimestamp) ||
                other.lastInteractionTimestamp == lastInteractionTimestamp) &&
            (identical(other.engagementRate, engagementRate) ||
                other.engagementRate == engagementRate) &&
            (identical(other.sentimentScore, sentimentScore) ||
                other.sentimentScore == sentimentScore) &&
            (identical(other.reportCount, reportCount) ||
                other.reportCount == reportCount) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      likes,
      dislikes,
      replies,
      interactions,
      uniqueInteractors,
      initialTimestamp,
      lastInteractionTimestamp,
      engagementRate,
      sentimentScore,
      reportCount,
      isFlagged);

  @override
  String toString() {
    return 'CommentMetrics(likes: $likes, dislikes: $dislikes, replies: $replies, interactions: $interactions, uniqueInteractors: $uniqueInteractors, initialTimestamp: $initialTimestamp, lastInteractionTimestamp: $lastInteractionTimestamp, engagementRate: $engagementRate, sentimentScore: $sentimentScore, reportCount: $reportCount, isFlagged: $isFlagged)';
  }
}

/// @nodoc
abstract mixin class _$CommentMetricsCopyWith<$Res>
    implements $CommentMetricsCopyWith<$Res> {
  factory _$CommentMetricsCopyWith(
          _CommentMetrics value, $Res Function(_CommentMetrics) _then) =
      __$CommentMetricsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int likes,
      int dislikes,
      int replies,
      int interactions,
      int uniqueInteractors,
      DateTime? initialTimestamp,
      DateTime? lastInteractionTimestamp,
      double engagementRate,
      double sentimentScore,
      int reportCount,
      bool isFlagged});
}

/// @nodoc
class __$CommentMetricsCopyWithImpl<$Res>
    implements _$CommentMetricsCopyWith<$Res> {
  __$CommentMetricsCopyWithImpl(this._self, this._then);

  final _CommentMetrics _self;
  final $Res Function(_CommentMetrics) _then;

  /// Create a copy of CommentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? likes = null,
    Object? dislikes = null,
    Object? replies = null,
    Object? interactions = null,
    Object? uniqueInteractors = null,
    Object? initialTimestamp = freezed,
    Object? lastInteractionTimestamp = freezed,
    Object? engagementRate = null,
    Object? sentimentScore = null,
    Object? reportCount = null,
    Object? isFlagged = null,
  }) {
    return _then(_CommentMetrics(
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _self.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
      interactions: null == interactions
          ? _self.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueInteractors: null == uniqueInteractors
          ? _self.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      initialTimestamp: freezed == initialTimestamp
          ? _self.initialTimestamp
          : initialTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastInteractionTimestamp: freezed == lastInteractionTimestamp
          ? _self.lastInteractionTimestamp
          : lastInteractionTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementRate: null == engagementRate
          ? _self.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      sentimentScore: null == sentimentScore
          ? _self.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      reportCount: null == reportCount
          ? _self.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFlagged: null == isFlagged
          ? _self.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
