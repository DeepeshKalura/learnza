// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostsModel {
// Core Post Information
  String get id;
  String get title;
  String get content;
  String get authorId;
  String? get thumbnailUrl;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get scheduledAt; // Enhanced Engagement Metrics
  PostEngagementMetrics
      get engagementMetrics; // Post Categorization and Visibility
  List<String> get tags;
  PostVisibility get visibility; // Advanced Post Attributes
  String? get categoryId;
  bool get isPinned;
  bool get isFeatured;
  List<CommentsModel> get comments;

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostsModelCopyWith<PostsModel> get copyWith =>
      _$PostsModelCopyWithImpl<PostsModel>(this as PostsModel, _$identity);

  /// Serializes this PostsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostsModel &&
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
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            const DeepCollectionEquality().equals(other.comments, comments));
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
      const DeepCollectionEquality().hash(tags),
      visibility,
      categoryId,
      isPinned,
      isFeatured,
      const DeepCollectionEquality().hash(comments));

  @override
  String toString() {
    return 'PostsModel(id: $id, title: $title, content: $content, authorId: $authorId, thumbnailUrl: $thumbnailUrl, createdAt: $createdAt, updatedAt: $updatedAt, scheduledAt: $scheduledAt, engagementMetrics: $engagementMetrics, tags: $tags, visibility: $visibility, categoryId: $categoryId, isPinned: $isPinned, isFeatured: $isFeatured, comments: $comments)';
  }
}

/// @nodoc
abstract mixin class $PostsModelCopyWith<$Res> {
  factory $PostsModelCopyWith(
          PostsModel value, $Res Function(PostsModel) _then) =
      _$PostsModelCopyWithImpl;
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
      bool isFeatured,
      List<CommentsModel> comments});

  $PostEngagementMetricsCopyWith<$Res> get engagementMetrics;
}

/// @nodoc
class _$PostsModelCopyWithImpl<$Res> implements $PostsModelCopyWith<$Res> {
  _$PostsModelCopyWithImpl(this._self, this._then);

  final PostsModel _self;
  final $Res Function(PostsModel) _then;

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
    Object? comments = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementMetrics: null == engagementMetrics
          ? _self.engagementMetrics
          : engagementMetrics // ignore: cast_nullable_to_non_nullable
              as PostEngagementMetrics,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visibility: null == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as PostVisibility,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel>,
    ));
  }

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostEngagementMetricsCopyWith<$Res> get engagementMetrics {
    return $PostEngagementMetricsCopyWith<$Res>(_self.engagementMetrics,
        (value) {
      return _then(_self.copyWith(engagementMetrics: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PostsModel implements PostsModel {
  const _PostsModel(
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
      this.isFeatured = false,
      final List<CommentsModel> comments = const []})
      : _tags = tags,
        _comments = comments;
  factory _PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

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
  final List<CommentsModel> _comments;
  @override
  @JsonKey()
  List<CommentsModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostsModelCopyWith<_PostsModel> get copyWith =>
      __$PostsModelCopyWithImpl<_PostsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostsModel &&
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
                other.isFeatured == isFeatured) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
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
      isFeatured,
      const DeepCollectionEquality().hash(_comments));

  @override
  String toString() {
    return 'PostsModel(id: $id, title: $title, content: $content, authorId: $authorId, thumbnailUrl: $thumbnailUrl, createdAt: $createdAt, updatedAt: $updatedAt, scheduledAt: $scheduledAt, engagementMetrics: $engagementMetrics, tags: $tags, visibility: $visibility, categoryId: $categoryId, isPinned: $isPinned, isFeatured: $isFeatured, comments: $comments)';
  }
}

/// @nodoc
abstract mixin class _$PostsModelCopyWith<$Res>
    implements $PostsModelCopyWith<$Res> {
  factory _$PostsModelCopyWith(
          _PostsModel value, $Res Function(_PostsModel) _then) =
      __$PostsModelCopyWithImpl;
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
      bool isFeatured,
      List<CommentsModel> comments});

  @override
  $PostEngagementMetricsCopyWith<$Res> get engagementMetrics;
}

/// @nodoc
class __$PostsModelCopyWithImpl<$Res> implements _$PostsModelCopyWith<$Res> {
  __$PostsModelCopyWithImpl(this._self, this._then);

  final _PostsModel _self;
  final $Res Function(_PostsModel) _then;

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? comments = null,
  }) {
    return _then(_PostsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      engagementMetrics: null == engagementMetrics
          ? _self.engagementMetrics
          : engagementMetrics // ignore: cast_nullable_to_non_nullable
              as PostEngagementMetrics,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visibility: null == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as PostVisibility,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _self._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel>,
    ));
  }

  /// Create a copy of PostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostEngagementMetricsCopyWith<$Res> get engagementMetrics {
    return $PostEngagementMetricsCopyWith<$Res>(_self.engagementMetrics,
        (value) {
      return _then(_self.copyWith(engagementMetrics: value));
    });
  }
}

// dart format on
