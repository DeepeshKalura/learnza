// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BooksModel {
  String get id;
  String? get isbn;
  String? get bookTitle;
  String? get description;
  String? get code;
  String? get bookUrl;
  String? get thumbnail;
  String get language;
  List<String>? get author; // Changed to nullable
  List<String> get categories; // Kept as non-nullable with default
  String? get publisher; // Changed to nullable
  bool get isActive;
  DateTime get createdAt;
  DateTime? get updatedAt;
  DateTime? get publishedAt;
  bool get founded;
  String? get editor;
  String? get courseId;
  int? get year;
  List<String> get moreImageUrl;

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BooksModelCopyWith<BooksModel> get copyWith =>
      _$BooksModelCopyWithImpl<BooksModel>(this as BooksModel, _$identity);

  /// Serializes this BooksModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BooksModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.bookUrl, bookUrl) || other.bookUrl == bookUrl) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.founded, founded) || other.founded == founded) &&
            (identical(other.editor, editor) || other.editor == editor) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality()
                .equals(other.moreImageUrl, moreImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isbn,
        bookTitle,
        description,
        code,
        bookUrl,
        thumbnail,
        language,
        const DeepCollectionEquality().hash(author),
        const DeepCollectionEquality().hash(categories),
        publisher,
        isActive,
        createdAt,
        updatedAt,
        publishedAt,
        founded,
        editor,
        courseId,
        year,
        const DeepCollectionEquality().hash(moreImageUrl)
      ]);

  @override
  String toString() {
    return 'BooksModel(id: $id, isbn: $isbn, bookTitle: $bookTitle, description: $description, code: $code, bookUrl: $bookUrl, thumbnail: $thumbnail, language: $language, author: $author, categories: $categories, publisher: $publisher, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, founded: $founded, editor: $editor, courseId: $courseId, year: $year, moreImageUrl: $moreImageUrl)';
  }
}

/// @nodoc
abstract mixin class $BooksModelCopyWith<$Res> {
  factory $BooksModelCopyWith(
          BooksModel value, $Res Function(BooksModel) _then) =
      _$BooksModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? isbn,
      String? bookTitle,
      String? description,
      String? code,
      String? bookUrl,
      String? thumbnail,
      String language,
      List<String>? author,
      List<String> categories,
      String? publisher,
      bool isActive,
      DateTime createdAt,
      DateTime? updatedAt,
      DateTime? publishedAt,
      bool founded,
      String? editor,
      String? courseId,
      int? year,
      List<String> moreImageUrl});
}

/// @nodoc
class _$BooksModelCopyWithImpl<$Res> implements $BooksModelCopyWith<$Res> {
  _$BooksModelCopyWithImpl(this._self, this._then);

  final BooksModel _self;
  final $Res Function(BooksModel) _then;

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isbn = freezed,
    Object? bookTitle = freezed,
    Object? description = freezed,
    Object? code = freezed,
    Object? bookUrl = freezed,
    Object? thumbnail = freezed,
    Object? language = null,
    Object? author = freezed,
    Object? categories = null,
    Object? publisher = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? founded = null,
    Object? editor = freezed,
    Object? courseId = freezed,
    Object? year = freezed,
    Object? moreImageUrl = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: freezed == isbn
          ? _self.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _self.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUrl: freezed == bookUrl
          ? _self.bookUrl
          : bookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: freezed == publisher
          ? _self.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      founded: null == founded
          ? _self.founded
          : founded // ignore: cast_nullable_to_non_nullable
              as bool,
      editor: freezed == editor
          ? _self.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      moreImageUrl: null == moreImageUrl
          ? _self.moreImageUrl
          : moreImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BooksModel implements BooksModel {
  const _BooksModel(
      {required this.id,
      this.isbn,
      this.bookTitle,
      this.description,
      this.code,
      this.bookUrl,
      this.thumbnail,
      required this.language,
      final List<String>? author,
      final List<String> categories = const [],
      this.publisher,
      required this.isActive,
      required this.createdAt,
      this.updatedAt,
      this.publishedAt,
      required this.founded,
      this.editor,
      this.courseId,
      this.year,
      final List<String> moreImageUrl = const []})
      : _author = author,
        _categories = categories,
        _moreImageUrl = moreImageUrl;
  factory _BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);

  @override
  final String id;
  @override
  final String? isbn;
  @override
  final String? bookTitle;
  @override
  final String? description;
  @override
  final String? code;
  @override
  final String? bookUrl;
  @override
  final String? thumbnail;
  @override
  final String language;
  final List<String>? _author;
  @override
  List<String>? get author {
    final value = _author;
    if (value == null) return null;
    if (_author is EqualUnmodifiableListView) return _author;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Changed to nullable
  final List<String> _categories;
// Changed to nullable
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

// Kept as non-nullable with default
  @override
  final String? publisher;
// Changed to nullable
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? publishedAt;
  @override
  final bool founded;
  @override
  final String? editor;
  @override
  final String? courseId;
  @override
  final int? year;
  final List<String> _moreImageUrl;
  @override
  @JsonKey()
  List<String> get moreImageUrl {
    if (_moreImageUrl is EqualUnmodifiableListView) return _moreImageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moreImageUrl);
  }

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BooksModelCopyWith<_BooksModel> get copyWith =>
      __$BooksModelCopyWithImpl<_BooksModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BooksModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BooksModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.bookUrl, bookUrl) || other.bookUrl == bookUrl) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._author, _author) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.founded, founded) || other.founded == founded) &&
            (identical(other.editor, editor) || other.editor == editor) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality()
                .equals(other._moreImageUrl, _moreImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isbn,
        bookTitle,
        description,
        code,
        bookUrl,
        thumbnail,
        language,
        const DeepCollectionEquality().hash(_author),
        const DeepCollectionEquality().hash(_categories),
        publisher,
        isActive,
        createdAt,
        updatedAt,
        publishedAt,
        founded,
        editor,
        courseId,
        year,
        const DeepCollectionEquality().hash(_moreImageUrl)
      ]);

  @override
  String toString() {
    return 'BooksModel(id: $id, isbn: $isbn, bookTitle: $bookTitle, description: $description, code: $code, bookUrl: $bookUrl, thumbnail: $thumbnail, language: $language, author: $author, categories: $categories, publisher: $publisher, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, founded: $founded, editor: $editor, courseId: $courseId, year: $year, moreImageUrl: $moreImageUrl)';
  }
}

/// @nodoc
abstract mixin class _$BooksModelCopyWith<$Res>
    implements $BooksModelCopyWith<$Res> {
  factory _$BooksModelCopyWith(
          _BooksModel value, $Res Function(_BooksModel) _then) =
      __$BooksModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? isbn,
      String? bookTitle,
      String? description,
      String? code,
      String? bookUrl,
      String? thumbnail,
      String language,
      List<String>? author,
      List<String> categories,
      String? publisher,
      bool isActive,
      DateTime createdAt,
      DateTime? updatedAt,
      DateTime? publishedAt,
      bool founded,
      String? editor,
      String? courseId,
      int? year,
      List<String> moreImageUrl});
}

/// @nodoc
class __$BooksModelCopyWithImpl<$Res> implements _$BooksModelCopyWith<$Res> {
  __$BooksModelCopyWithImpl(this._self, this._then);

  final _BooksModel _self;
  final $Res Function(_BooksModel) _then;

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isbn = freezed,
    Object? bookTitle = freezed,
    Object? description = freezed,
    Object? code = freezed,
    Object? bookUrl = freezed,
    Object? thumbnail = freezed,
    Object? language = null,
    Object? author = freezed,
    Object? categories = null,
    Object? publisher = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? founded = null,
    Object? editor = freezed,
    Object? courseId = freezed,
    Object? year = freezed,
    Object? moreImageUrl = null,
  }) {
    return _then(_BooksModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: freezed == isbn
          ? _self.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _self.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUrl: freezed == bookUrl
          ? _self.bookUrl
          : bookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _self._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: freezed == publisher
          ? _self.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      founded: null == founded
          ? _self.founded
          : founded // ignore: cast_nullable_to_non_nullable
              as bool,
      editor: freezed == editor
          ? _self.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      moreImageUrl: null == moreImageUrl
          ? _self._moreImageUrl
          : moreImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
