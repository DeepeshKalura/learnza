// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BooksModel _$BooksModelFromJson(Map<String, dynamic> json) {
  return _BooksModel.fromJson(json);
}

/// @nodoc
mixin _$BooksModel {
  String get id => throw _privateConstructorUsedError;
  String? get isbn => throw _privateConstructorUsedError;
  String? get bookTitle => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get bookUrl => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  List<String>? get author =>
      throw _privateConstructorUsedError; // Changed to nullable
  List<String> get categories =>
      throw _privateConstructorUsedError; // Kept as non-nullable with default
  String? get publisher =>
      throw _privateConstructorUsedError; // Changed to nullable
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  bool get founded => throw _privateConstructorUsedError;
  String? get editor => throw _privateConstructorUsedError;
  String? get courseId => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  List<String> get moreImageUrl => throw _privateConstructorUsedError;

  /// Serializes this BooksModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BooksModelCopyWith<BooksModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksModelCopyWith<$Res> {
  factory $BooksModelCopyWith(
          BooksModel value, $Res Function(BooksModel) then) =
      _$BooksModelCopyWithImpl<$Res, BooksModel>;
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
class _$BooksModelCopyWithImpl<$Res, $Val extends BooksModel>
    implements $BooksModelCopyWith<$Res> {
  _$BooksModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUrl: freezed == bookUrl
          ? _value.bookUrl
          : bookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      founded: null == founded
          ? _value.founded
          : founded // ignore: cast_nullable_to_non_nullable
              as bool,
      editor: freezed == editor
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      moreImageUrl: null == moreImageUrl
          ? _value.moreImageUrl
          : moreImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooksModelImplCopyWith<$Res>
    implements $BooksModelCopyWith<$Res> {
  factory _$$BooksModelImplCopyWith(
          _$BooksModelImpl value, $Res Function(_$BooksModelImpl) then) =
      __$$BooksModelImplCopyWithImpl<$Res>;
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
class __$$BooksModelImplCopyWithImpl<$Res>
    extends _$BooksModelCopyWithImpl<$Res, _$BooksModelImpl>
    implements _$$BooksModelImplCopyWith<$Res> {
  __$$BooksModelImplCopyWithImpl(
      _$BooksModelImpl _value, $Res Function(_$BooksModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$BooksModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUrl: freezed == bookUrl
          ? _value.bookUrl
          : bookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      founded: null == founded
          ? _value.founded
          : founded // ignore: cast_nullable_to_non_nullable
              as bool,
      editor: freezed == editor
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      moreImageUrl: null == moreImageUrl
          ? _value._moreImageUrl
          : moreImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BooksModelImpl implements _BooksModel {
  const _$BooksModelImpl(
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

  factory _$BooksModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BooksModelImplFromJson(json);

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

  @override
  String toString() {
    return 'BooksModel(id: $id, isbn: $isbn, bookTitle: $bookTitle, description: $description, code: $code, bookUrl: $bookUrl, thumbnail: $thumbnail, language: $language, author: $author, categories: $categories, publisher: $publisher, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, founded: $founded, editor: $editor, courseId: $courseId, year: $year, moreImageUrl: $moreImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksModelImpl &&
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

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksModelImplCopyWith<_$BooksModelImpl> get copyWith =>
      __$$BooksModelImplCopyWithImpl<_$BooksModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BooksModelImplToJson(
      this,
    );
  }
}

abstract class _BooksModel implements BooksModel {
  const factory _BooksModel(
      {required final String id,
      final String? isbn,
      final String? bookTitle,
      final String? description,
      final String? code,
      final String? bookUrl,
      final String? thumbnail,
      required final String language,
      final List<String>? author,
      final List<String> categories,
      final String? publisher,
      required final bool isActive,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final DateTime? publishedAt,
      required final bool founded,
      final String? editor,
      final String? courseId,
      final int? year,
      final List<String> moreImageUrl}) = _$BooksModelImpl;

  factory _BooksModel.fromJson(Map<String, dynamic> json) =
      _$BooksModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get isbn;
  @override
  String? get bookTitle;
  @override
  String? get description;
  @override
  String? get code;
  @override
  String? get bookUrl;
  @override
  String? get thumbnail;
  @override
  String get language;
  @override
  List<String>? get author; // Changed to nullable
  @override
  List<String> get categories; // Kept as non-nullable with default
  @override
  String? get publisher; // Changed to nullable
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get publishedAt;
  @override
  bool get founded;
  @override
  String? get editor;
  @override
  String? get courseId;
  @override
  int? get year;
  @override
  List<String> get moreImageUrl;

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BooksModelImplCopyWith<_$BooksModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
