// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentMetrics _$CommentMetricsFromJson(Map<String, dynamic> json) {
  return _CommentMetrics.fromJson(json);
}

/// @nodoc
mixin _$CommentMetrics {
// Engagement Metrics
  int get likes => throw _privateConstructorUsedError;
  int get dislikes => throw _privateConstructorUsedError;
  int get replies => throw _privateConstructorUsedError; // Interaction Tracking
  int get interactions => throw _privateConstructorUsedError;
  int get uniqueInteractors =>
      throw _privateConstructorUsedError; // Timestamp Tracking
  DateTime? get initialTimestamp => throw _privateConstructorUsedError;
  DateTime? get lastInteractionTimestamp =>
      throw _privateConstructorUsedError; // Performance Metrics
  double get engagementRate => throw _privateConstructorUsedError;
  double get sentimentScore =>
      throw _privateConstructorUsedError; // Spam and Moderation
  int get reportCount => throw _privateConstructorUsedError;
  bool get isFlagged => throw _privateConstructorUsedError;

  /// Serializes this CommentMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentMetricsCopyWith<CommentMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentMetricsCopyWith<$Res> {
  factory $CommentMetricsCopyWith(
          CommentMetrics value, $Res Function(CommentMetrics) then) =
      _$CommentMetricsCopyWithImpl<$Res, CommentMetrics>;
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
class _$CommentMetricsCopyWithImpl<$Res, $Val extends CommentMetrics>
    implements $CommentMetricsCopyWith<$Res> {
  _$CommentMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
      interactions: null == interactions
          ? _value.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueInteractors: null == uniqueInteractors
          ? _value.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      initialTimestamp: freezed == initialTimestamp
          ? _value.initialTimestamp
          : initialTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastInteractionTimestamp: freezed == lastInteractionTimestamp
          ? _value.lastInteractionTimestamp
          : lastInteractionTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementRate: null == engagementRate
          ? _value.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      sentimentScore: null == sentimentScore
          ? _value.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentMetricsImplCopyWith<$Res>
    implements $CommentMetricsCopyWith<$Res> {
  factory _$$CommentMetricsImplCopyWith(_$CommentMetricsImpl value,
          $Res Function(_$CommentMetricsImpl) then) =
      __$$CommentMetricsImplCopyWithImpl<$Res>;
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
class __$$CommentMetricsImplCopyWithImpl<$Res>
    extends _$CommentMetricsCopyWithImpl<$Res, _$CommentMetricsImpl>
    implements _$$CommentMetricsImplCopyWith<$Res> {
  __$$CommentMetricsImplCopyWithImpl(
      _$CommentMetricsImpl _value, $Res Function(_$CommentMetricsImpl) _then)
      : super(_value, _then);

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
    return _then(_$CommentMetricsImpl(
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
      interactions: null == interactions
          ? _value.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueInteractors: null == uniqueInteractors
          ? _value.uniqueInteractors
          : uniqueInteractors // ignore: cast_nullable_to_non_nullable
              as int,
      initialTimestamp: freezed == initialTimestamp
          ? _value.initialTimestamp
          : initialTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastInteractionTimestamp: freezed == lastInteractionTimestamp
          ? _value.lastInteractionTimestamp
          : lastInteractionTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementRate: null == engagementRate
          ? _value.engagementRate
          : engagementRate // ignore: cast_nullable_to_non_nullable
              as double,
      sentimentScore: null == sentimentScore
          ? _value.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentMetricsImpl implements _CommentMetrics {
  const _$CommentMetricsImpl(
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

  factory _$CommentMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentMetricsImplFromJson(json);

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

  @override
  String toString() {
    return 'CommentMetrics(likes: $likes, dislikes: $dislikes, replies: $replies, interactions: $interactions, uniqueInteractors: $uniqueInteractors, initialTimestamp: $initialTimestamp, lastInteractionTimestamp: $lastInteractionTimestamp, engagementRate: $engagementRate, sentimentScore: $sentimentScore, reportCount: $reportCount, isFlagged: $isFlagged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentMetricsImpl &&
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

  /// Create a copy of CommentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentMetricsImplCopyWith<_$CommentMetricsImpl> get copyWith =>
      __$$CommentMetricsImplCopyWithImpl<_$CommentMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentMetricsImplToJson(
      this,
    );
  }
}

abstract class _CommentMetrics implements CommentMetrics {
  const factory _CommentMetrics(
      {final int likes,
      final int dislikes,
      final int replies,
      final int interactions,
      final int uniqueInteractors,
      final DateTime? initialTimestamp,
      final DateTime? lastInteractionTimestamp,
      final double engagementRate,
      final double sentimentScore,
      final int reportCount,
      final bool isFlagged}) = _$CommentMetricsImpl;

  factory _CommentMetrics.fromJson(Map<String, dynamic> json) =
      _$CommentMetricsImpl.fromJson;

// Engagement Metrics
  @override
  int get likes;
  @override
  int get dislikes;
  @override
  int get replies; // Interaction Tracking
  @override
  int get interactions;
  @override
  int get uniqueInteractors; // Timestamp Tracking
  @override
  DateTime? get initialTimestamp;
  @override
  DateTime? get lastInteractionTimestamp; // Performance Metrics
  @override
  double get engagementRate;
  @override
  double get sentimentScore; // Spam and Moderation
  @override
  int get reportCount;
  @override
  bool get isFlagged;

  /// Create a copy of CommentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentMetricsImplCopyWith<_$CommentMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
