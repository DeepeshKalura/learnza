// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentsModel {
// Core Comment Information
  String get id;
  String get postId;
  String get content;
  String get authorId;
  DateTime get createdAt;
  DateTime? get updatedAt; // Parent-Child Comment Relationship
  String? get parentCommentId;
  int get replyCount; // Comment Status and Metadata
  CommentStatus get status;
  bool get isEdited;
  bool get isPinned; // Engagement Metrics
  CommentMetrics get metrics; // Additional Metadata
  List<String> get mentionedUserIds;
  List<String> get hashTags;

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentsModelCopyWith<CommentsModel> get copyWith =>
      _$CommentsModelCopyWithImpl<CommentsModel>(
          this as CommentsModel, _$identity);

  /// Serializes this CommentsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUserIds, mentionedUserIds) &&
            const DeepCollectionEquality().equals(other.hashTags, hashTags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      postId,
      content,
      authorId,
      createdAt,
      updatedAt,
      parentCommentId,
      replyCount,
      status,
      isEdited,
      isPinned,
      metrics,
      const DeepCollectionEquality().hash(mentionedUserIds),
      const DeepCollectionEquality().hash(hashTags));

  @override
  String toString() {
    return 'CommentsModel(id: $id, postId: $postId, content: $content, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, parentCommentId: $parentCommentId, replyCount: $replyCount, status: $status, isEdited: $isEdited, isPinned: $isPinned, metrics: $metrics, mentionedUserIds: $mentionedUserIds, hashTags: $hashTags)';
  }
}

/// @nodoc
abstract mixin class $CommentsModelCopyWith<$Res> {
  factory $CommentsModelCopyWith(
          CommentsModel value, $Res Function(CommentsModel) _then) =
      _$CommentsModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String postId,
      String content,
      String authorId,
      DateTime createdAt,
      DateTime? updatedAt,
      String? parentCommentId,
      int replyCount,
      CommentStatus status,
      bool isEdited,
      bool isPinned,
      CommentMetrics metrics,
      List<String> mentionedUserIds,
      List<String> hashTags});

  $CommentMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$CommentsModelCopyWithImpl<$Res>
    implements $CommentsModelCopyWith<$Res> {
  _$CommentsModelCopyWithImpl(this._self, this._then);

  final CommentsModel _self;
  final $Res Function(CommentsModel) _then;

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? content = null,
    Object? authorId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? parentCommentId = freezed,
    Object? replyCount = null,
    Object? status = null,
    Object? isEdited = null,
    Object? isPinned = null,
    Object? metrics = null,
    Object? mentionedUserIds = null,
    Object? hashTags = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentCommentId: freezed == parentCommentId
          ? _self.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCount: null == replyCount
          ? _self.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommentStatus,
      isEdited: null == isEdited
          ? _self.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      metrics: null == metrics
          ? _self.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as CommentMetrics,
      mentionedUserIds: null == mentionedUserIds
          ? _self.mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashTags: null == hashTags
          ? _self.hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentMetricsCopyWith<$Res> get metrics {
    return $CommentMetricsCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CommentsModel implements CommentsModel {
  const _CommentsModel(
      {required this.id,
      required this.postId,
      required this.content,
      required this.authorId,
      required this.createdAt,
      this.updatedAt,
      this.parentCommentId,
      this.replyCount = 0,
      this.status = CommentStatus.active,
      this.isEdited = false,
      this.isPinned = false,
      this.metrics = const CommentMetrics(),
      final List<String> mentionedUserIds = const [],
      final List<String> hashTags = const []})
      : _mentionedUserIds = mentionedUserIds,
        _hashTags = hashTags;
  factory _CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

// Core Comment Information
  @override
  final String id;
  @override
  final String postId;
  @override
  final String content;
  @override
  final String authorId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
// Parent-Child Comment Relationship
  @override
  final String? parentCommentId;
  @override
  @JsonKey()
  final int replyCount;
// Comment Status and Metadata
  @override
  @JsonKey()
  final CommentStatus status;
  @override
  @JsonKey()
  final bool isEdited;
  @override
  @JsonKey()
  final bool isPinned;
// Engagement Metrics
  @override
  @JsonKey()
  final CommentMetrics metrics;
// Additional Metadata
  final List<String> _mentionedUserIds;
// Additional Metadata
  @override
  @JsonKey()
  List<String> get mentionedUserIds {
    if (_mentionedUserIds is EqualUnmodifiableListView)
      return _mentionedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentionedUserIds);
  }

  final List<String> _hashTags;
  @override
  @JsonKey()
  List<String> get hashTags {
    if (_hashTags is EqualUnmodifiableListView) return _hashTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashTags);
  }

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentsModelCopyWith<_CommentsModel> get copyWith =>
      __$CommentsModelCopyWithImpl<_CommentsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality()
                .equals(other._mentionedUserIds, _mentionedUserIds) &&
            const DeepCollectionEquality().equals(other._hashTags, _hashTags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      postId,
      content,
      authorId,
      createdAt,
      updatedAt,
      parentCommentId,
      replyCount,
      status,
      isEdited,
      isPinned,
      metrics,
      const DeepCollectionEquality().hash(_mentionedUserIds),
      const DeepCollectionEquality().hash(_hashTags));

  @override
  String toString() {
    return 'CommentsModel(id: $id, postId: $postId, content: $content, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, parentCommentId: $parentCommentId, replyCount: $replyCount, status: $status, isEdited: $isEdited, isPinned: $isPinned, metrics: $metrics, mentionedUserIds: $mentionedUserIds, hashTags: $hashTags)';
  }
}

/// @nodoc
abstract mixin class _$CommentsModelCopyWith<$Res>
    implements $CommentsModelCopyWith<$Res> {
  factory _$CommentsModelCopyWith(
          _CommentsModel value, $Res Function(_CommentsModel) _then) =
      __$CommentsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String postId,
      String content,
      String authorId,
      DateTime createdAt,
      DateTime? updatedAt,
      String? parentCommentId,
      int replyCount,
      CommentStatus status,
      bool isEdited,
      bool isPinned,
      CommentMetrics metrics,
      List<String> mentionedUserIds,
      List<String> hashTags});

  @override
  $CommentMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$CommentsModelCopyWithImpl<$Res>
    implements _$CommentsModelCopyWith<$Res> {
  __$CommentsModelCopyWithImpl(this._self, this._then);

  final _CommentsModel _self;
  final $Res Function(_CommentsModel) _then;

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? content = null,
    Object? authorId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? parentCommentId = freezed,
    Object? replyCount = null,
    Object? status = null,
    Object? isEdited = null,
    Object? isPinned = null,
    Object? metrics = null,
    Object? mentionedUserIds = null,
    Object? hashTags = null,
  }) {
    return _then(_CommentsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentCommentId: freezed == parentCommentId
          ? _self.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCount: null == replyCount
          ? _self.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommentStatus,
      isEdited: null == isEdited
          ? _self.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      metrics: null == metrics
          ? _self.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as CommentMetrics,
      mentionedUserIds: null == mentionedUserIds
          ? _self._mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashTags: null == hashTags
          ? _self._hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentMetricsCopyWith<$Res> get metrics {
    return $CommentMetricsCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }
}

// dart format on
