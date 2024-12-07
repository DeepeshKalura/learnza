// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) {
  return _CommentsModel.fromJson(json);
}

/// @nodoc
mixin _$CommentsModel {
// Core Comment Information
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt =>
      throw _privateConstructorUsedError; // Parent-Child Comment Relationship
  String? get parentCommentId => throw _privateConstructorUsedError;
  int get replyCount =>
      throw _privateConstructorUsedError; // Comment Status and Metadata
  CommentStatus get status => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError; // Engagement Metrics
  CommentMetrics get metrics =>
      throw _privateConstructorUsedError; // Additional Metadata
  List<String> get mentionedUserIds => throw _privateConstructorUsedError;
  List<String> get hashTags => throw _privateConstructorUsedError;

  /// Serializes this CommentsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsModelCopyWith<CommentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsModelCopyWith<$Res> {
  factory $CommentsModelCopyWith(
          CommentsModel value, $Res Function(CommentsModel) then) =
      _$CommentsModelCopyWithImpl<$Res, CommentsModel>;
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
class _$CommentsModelCopyWithImpl<$Res, $Val extends CommentsModel>
    implements $CommentsModelCopyWith<$Res> {
  _$CommentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommentStatus,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as CommentMetrics,
      mentionedUserIds: null == mentionedUserIds
          ? _value.mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashTags: null == hashTags
          ? _value.hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentMetricsCopyWith<$Res> get metrics {
    return $CommentMetricsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentsModelImplCopyWith<$Res>
    implements $CommentsModelCopyWith<$Res> {
  factory _$$CommentsModelImplCopyWith(
          _$CommentsModelImpl value, $Res Function(_$CommentsModelImpl) then) =
      __$$CommentsModelImplCopyWithImpl<$Res>;
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
class __$$CommentsModelImplCopyWithImpl<$Res>
    extends _$CommentsModelCopyWithImpl<$Res, _$CommentsModelImpl>
    implements _$$CommentsModelImplCopyWith<$Res> {
  __$$CommentsModelImplCopyWithImpl(
      _$CommentsModelImpl _value, $Res Function(_$CommentsModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$CommentsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommentStatus,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as CommentMetrics,
      mentionedUserIds: null == mentionedUserIds
          ? _value._mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashTags: null == hashTags
          ? _value._hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsModelImpl implements _CommentsModel {
  const _$CommentsModelImpl(
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

  factory _$CommentsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsModelImplFromJson(json);

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

  @override
  String toString() {
    return 'CommentsModel(id: $id, postId: $postId, content: $content, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, parentCommentId: $parentCommentId, replyCount: $replyCount, status: $status, isEdited: $isEdited, isPinned: $isPinned, metrics: $metrics, mentionedUserIds: $mentionedUserIds, hashTags: $hashTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsModelImpl &&
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

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsModelImplCopyWith<_$CommentsModelImpl> get copyWith =>
      __$$CommentsModelImplCopyWithImpl<_$CommentsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsModelImplToJson(
      this,
    );
  }
}

abstract class _CommentsModel implements CommentsModel {
  const factory _CommentsModel(
      {required final String id,
      required final String postId,
      required final String content,
      required final String authorId,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final String? parentCommentId,
      final int replyCount,
      final CommentStatus status,
      final bool isEdited,
      final bool isPinned,
      final CommentMetrics metrics,
      final List<String> mentionedUserIds,
      final List<String> hashTags}) = _$CommentsModelImpl;

  factory _CommentsModel.fromJson(Map<String, dynamic> json) =
      _$CommentsModelImpl.fromJson;

// Core Comment Information
  @override
  String get id;
  @override
  String get postId;
  @override
  String get content;
  @override
  String get authorId;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt; // Parent-Child Comment Relationship
  @override
  String? get parentCommentId;
  @override
  int get replyCount; // Comment Status and Metadata
  @override
  CommentStatus get status;
  @override
  bool get isEdited;
  @override
  bool get isPinned; // Engagement Metrics
  @override
  CommentMetrics get metrics; // Additional Metadata
  @override
  List<String> get mentionedUserIds;
  @override
  List<String> get hashTags;

  /// Create a copy of CommentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsModelImplCopyWith<_$CommentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
