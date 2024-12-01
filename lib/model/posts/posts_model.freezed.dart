// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) {
  return _PostsModel.fromJson(json);
}

/// @nodoc
mixin _$PostsModel {
// Core Post Information
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get scheduledAt =>
      throw _privateConstructorUsedError; // Enhanced Engagement Metrics
  PostEngagementMetrics get engagementMetrics =>
      throw _privateConstructorUsedError; // Post Categorization and Visibility
  List<String> get tags => throw _privateConstructorUsedError;
  PostVisibility get visibility =>
      throw _privateConstructorUsedError; // Advanced Post Attributes
  String? get categoryId => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;

  /// Serializes this PostsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsModelCopyWith<PostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsModelCopyWith<$Res> {
  factory $PostsModelCopyWith(
          PostsModel value, $Res Function(PostsModel) then) =
      _$PostsModelCopyWithImpl<$Res, PostsModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String authorId,
      String? thumbnailUrl,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? scheduledAt,
      PostEngagementMetrics engagementMetrics,
      List<String> tags,
      PostVisibility visibility,
      String? categoryId,
      bool isPinned,
      bool isFeatured});

  $PostEngagementMetricsCopyWith<$Res> get engagementMetrics;
}

/// @nodoc
class _$PostsModelCopyWithImpl<$Res, $Val extends PostsModel>
    implements $PostsModelCopyWith<$Res> {
  _$PostsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? authorId = null,
    Object? thumbnailUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? scheduledAt = freezed,
    Object? engagementMetrics = null,
    Object? tags = null,
    Object? visibility = null,
    Object? categoryId = freezed,
    Object? isPinned = null,
    Object? isFeatured = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementMetrics: null == engagementMetrics
          ? _value.engagementMetrics
          : engagementMetrics // ignore: cast_nullable_to_non_nullable
              as PostEngagementMetrics,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as PostVisibility,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostEngagementMetricsCopyWith<$Res> get engagementMetrics {
    return $PostEngagementMetricsCopyWith<$Res>(_value.engagementMetrics,
        (value) {
      return _then(_value.copyWith(engagementMetrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostsModelImplCopyWith<$Res>
    implements $PostsModelCopyWith<$Res> {
  factory _$$PostsModelImplCopyWith(
          _$PostsModelImpl value, $Res Function(_$PostsModelImpl) then) =
      __$$PostsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String authorId,
      String? thumbnailUrl,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? scheduledAt,
      PostEngagementMetrics engagementMetrics,
      List<String> tags,
      PostVisibility visibility,
      String? categoryId,
      bool isPinned,
      bool isFeatured});

  @override
  $PostEngagementMetricsCopyWith<$Res> get engagementMetrics;
}

/// @nodoc
class __$$PostsModelImplCopyWithImpl<$Res>
    extends _$PostsModelCopyWithImpl<$Res, _$PostsModelImpl>
    implements _$$PostsModelImplCopyWith<$Res> {
  __$$PostsModelImplCopyWithImpl(
      _$PostsModelImpl _value, $Res Function(_$PostsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? authorId = null,
    Object? thumbnailUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? scheduledAt = freezed,
    Object? engagementMetrics = null,
    Object? tags = null,
    Object? visibility = null,
    Object? categoryId = freezed,
    Object? isPinned = null,
    Object? isFeatured = null,
  }) {
    return _then(_$PostsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementMetrics: null == engagementMetrics
          ? _value.engagementMetrics
          : engagementMetrics // ignore: cast_nullable_to_non_nullable
              as PostEngagementMetrics,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as PostVisibility,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsModelImpl implements _PostsModel {
  const _$PostsModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.authorId,
      this.thumbnailUrl,
      required this.createdAt,
      required this.updatedAt,
      this.scheduledAt,
      this.engagementMetrics = const PostEngagementMetrics(),
      final List<String> tags = const [],
      this.visibility = PostVisibility.public,
      this.categoryId,
      this.isPinned = false,
      this.isFeatured = false})
      : _tags = tags;

  factory _$PostsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsModelImplFromJson(json);

// Core Post Information
  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String authorId;
  @override
  final String? thumbnailUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? scheduledAt;
// Enhanced Engagement Metrics
  @override
  @JsonKey()
  final PostEngagementMetrics engagementMetrics;
// Post Categorization and Visibility
  final List<String> _tags;
// Post Categorization and Visibility
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final PostVisibility visibility;
// Advanced Post Attributes
  @override
  final String? categoryId;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  @JsonKey()
  final bool isFeatured;

  @override
  String toString() {
    return 'PostsModel(id: $id, title: $title, content: $content, authorId: $authorId, thumbnailUrl: $thumbnailUrl, createdAt: $createdAt, updatedAt: $updatedAt, scheduledAt: $scheduledAt, engagementMetrics: $engagementMetrics, tags: $tags, visibility: $visibility, categoryId: $categoryId, isPinned: $isPinned, isFeatured: $isFeatured)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.engagementMetrics, engagementMetrics) ||
                other.engagementMetrics == engagementMetrics) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      authorId,
      thumbnailUrl,
      createdAt,
      updatedAt,
      scheduledAt,
      engagementMetrics,
      const DeepCollectionEquality().hash(_tags),
      visibility,
      categoryId,
      isPinned,
      isFeatured);

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsModelImplCopyWith<_$PostsModelImpl> get copyWith =>
      __$$PostsModelImplCopyWithImpl<_$PostsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsModelImplToJson(
      this,
    );
  }
}

abstract class _PostsModel implements PostsModel {
  const factory _PostsModel(
      {required final String id,
      required final String title,
      required final String content,
      required final String authorId,
      final String? thumbnailUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? scheduledAt,
      final PostEngagementMetrics engagementMetrics,
      final List<String> tags,
      final PostVisibility visibility,
      final String? categoryId,
      final bool isPinned,
      final bool isFeatured}) = _$PostsModelImpl;

  factory _PostsModel.fromJson(Map<String, dynamic> json) =
      _$PostsModelImpl.fromJson;

// Core Post Information
  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get authorId;
  @override
  String? get thumbnailUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get scheduledAt; // Enhanced Engagement Metrics
  @override
  PostEngagementMetrics
      get engagementMetrics; // Post Categorization and Visibility
  @override
  List<String> get tags;
  @override
  PostVisibility get visibility; // Advanced Post Attributes
  @override
  String? get categoryId;
  @override
  bool get isPinned;
  @override
  bool get isFeatured;

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsModelImplCopyWith<_$PostsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
