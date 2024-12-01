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
  String get isbm =>
      throw _privateConstructorUsedError; // 13 digits for easier usage
  String get bookTitle => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get bookUrl => throw _privateConstructorUsedError;
  List<String> get author => throw _privateConstructorUsedError;
  List<String> get category =>
      throw _privateConstructorUsedError; // Defaults to an empty list
  String? get publisher => throw _privateConstructorUsedError;
  List<IndustryIdentifiers>? get identifier =>
      throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;
  bool get founded => throw _privateConstructorUsedError;
  List<String>? get moreImageUrl => throw _privateConstructorUsedError;

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
      String isbm,
      String bookTitle,
      String description,
      String? code,
      String? bookUrl,
      List<String> author,
      List<String> category,
      String? publisher,
      List<IndustryIdentifiers>? identifier,
      bool isActive,
      DateTime createdAt,
      DateTime? updatedAt,
      DateTime? publishedAt,
      String language,
      String? coverImageUrl,
      bool founded,
      List<String>? moreImageUrl});
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
    Object? isbm = null,
    Object? bookTitle = null,
    Object? description = null,
    Object? code = freezed,
    Object? bookUrl = freezed,
    Object? author = null,
    Object? category = null,
    Object? publisher = freezed,
    Object? identifier = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? language = null,
    Object? coverImageUrl = freezed,
    Object? founded = null,
    Object? moreImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isbm: null == isbm
          ? _value.isbm
          : isbm // ignore: cast_nullable_to_non_nullable
              as String,
      bookTitle: null == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUrl: freezed == bookUrl
          ? _value.bookUrl
          : bookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<IndustryIdentifiers>?,
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
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      founded: null == founded
          ? _value.founded
          : founded // ignore: cast_nullable_to_non_nullable
              as bool,
      moreImageUrl: freezed == moreImageUrl
          ? _value.moreImageUrl
          : moreImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      String isbm,
      String bookTitle,
      String description,
      String? code,
      String? bookUrl,
      List<String> author,
      List<String> category,
      String? publisher,
      List<IndustryIdentifiers>? identifier,
      bool isActive,
      DateTime createdAt,
      DateTime? updatedAt,
      DateTime? publishedAt,
      String language,
      String? coverImageUrl,
      bool founded,
      List<String>? moreImageUrl});
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
    Object? isbm = null,
    Object? bookTitle = null,
    Object? description = null,
    Object? code = freezed,
    Object? bookUrl = freezed,
    Object? author = null,
    Object? category = null,
    Object? publisher = freezed,
    Object? identifier = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? language = null,
    Object? coverImageUrl = freezed,
    Object? founded = null,
    Object? moreImageUrl = freezed,
  }) {
    return _then(_$BooksModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isbm: null == isbm
          ? _value.isbm
          : isbm // ignore: cast_nullable_to_non_nullable
              as String,
      bookTitle: null == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUrl: freezed == bookUrl
          ? _value.bookUrl
          : bookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value._identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<IndustryIdentifiers>?,
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
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      founded: null == founded
          ? _value.founded
          : founded // ignore: cast_nullable_to_non_nullable
              as bool,
      moreImageUrl: freezed == moreImageUrl
          ? _value._moreImageUrl
          : moreImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BooksModelImpl implements _BooksModel {
  const _$BooksModelImpl(
      {required this.id,
      required this.isbm,
      required this.bookTitle,
      required this.description,
      this.code,
      this.bookUrl,
      required final List<String> author,
      final List<String> category = const [],
      this.publisher,
      final List<IndustryIdentifiers>? identifier,
      required this.isActive,
      required this.createdAt,
      this.updatedAt,
      this.publishedAt,
      required this.language,
      this.coverImageUrl,
      required this.founded,
      final List<String>? moreImageUrl})
      : _author = author,
        _category = category,
        _identifier = identifier,
        _moreImageUrl = moreImageUrl;

  factory _$BooksModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BooksModelImplFromJson(json);

  @override
  final String id;
  @override
  final String isbm;
// 13 digits for easier usage
  @override
  final String bookTitle;
  @override
  final String description;
  @override
  final String? code;
  @override
  final String? bookUrl;
  final List<String> _author;
  @override
  List<String> get author {
    if (_author is EqualUnmodifiableListView) return _author;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_author);
  }

  final List<String> _category;
  @override
  @JsonKey()
  List<String> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

// Defaults to an empty list
  @override
  final String? publisher;
  final List<IndustryIdentifiers>? _identifier;
  @override
  List<IndustryIdentifiers>? get identifier {
    final value = _identifier;
    if (value == null) return null;
    if (_identifier is EqualUnmodifiableListView) return _identifier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? publishedAt;
  @override
  final String language;
  @override
  final String? coverImageUrl;
  @override
  final bool founded;
  final List<String>? _moreImageUrl;
  @override
  List<String>? get moreImageUrl {
    final value = _moreImageUrl;
    if (value == null) return null;
    if (_moreImageUrl is EqualUnmodifiableListView) return _moreImageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BooksModel(id: $id, isbm: $isbm, bookTitle: $bookTitle, description: $description, code: $code, bookUrl: $bookUrl, author: $author, category: $category, publisher: $publisher, identifier: $identifier, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, language: $language, coverImageUrl: $coverImageUrl, founded: $founded, moreImageUrl: $moreImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isbm, isbm) || other.isbm == isbm) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.bookUrl, bookUrl) || other.bookUrl == bookUrl) &&
            const DeepCollectionEquality().equals(other._author, _author) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.founded, founded) || other.founded == founded) &&
            const DeepCollectionEquality()
                .equals(other._moreImageUrl, _moreImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isbm,
      bookTitle,
      description,
      code,
      bookUrl,
      const DeepCollectionEquality().hash(_author),
      const DeepCollectionEquality().hash(_category),
      publisher,
      const DeepCollectionEquality().hash(_identifier),
      isActive,
      createdAt,
      updatedAt,
      publishedAt,
      language,
      coverImageUrl,
      founded,
      const DeepCollectionEquality().hash(_moreImageUrl));

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
      required final String isbm,
      required final String bookTitle,
      required final String description,
      final String? code,
      final String? bookUrl,
      required final List<String> author,
      final List<String> category,
      final String? publisher,
      final List<IndustryIdentifiers>? identifier,
      required final bool isActive,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final DateTime? publishedAt,
      required final String language,
      final String? coverImageUrl,
      required final bool founded,
      final List<String>? moreImageUrl}) = _$BooksModelImpl;

  factory _BooksModel.fromJson(Map<String, dynamic> json) =
      _$BooksModelImpl.fromJson;

  @override
  String get id;
  @override
  String get isbm; // 13 digits for easier usage
  @override
  String get bookTitle;
  @override
  String get description;
  @override
  String? get code;
  @override
  String? get bookUrl;
  @override
  List<String> get author;
  @override
  List<String> get category; // Defaults to an empty list
  @override
  String? get publisher;
  @override
  List<IndustryIdentifiers>? get identifier;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get publishedAt;
  @override
  String get language;
  @override
  String? get coverImageUrl;
  @override
  bool get founded;
  @override
  List<String>? get moreImageUrl;

  /// Create a copy of BooksModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BooksModelImplCopyWith<_$BooksModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IndustryIdentifiers _$IndustryIdentifiersFromJson(Map<String, dynamic> json) {
  return _IndustryIdentifiers.fromJson(json);
}

/// @nodoc
mixin _$IndustryIdentifiers {
  BookIdentityType get type => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;

  /// Serializes this IndustryIdentifiers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IndustryIdentifiersCopyWith<IndustryIdentifiers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndustryIdentifiersCopyWith<$Res> {
  factory $IndustryIdentifiersCopyWith(
          IndustryIdentifiers value, $Res Function(IndustryIdentifiers) then) =
      _$IndustryIdentifiersCopyWithImpl<$Res, IndustryIdentifiers>;
  @useResult
  $Res call({BookIdentityType type, String identifier});
}

/// @nodoc
class _$IndustryIdentifiersCopyWithImpl<$Res, $Val extends IndustryIdentifiers>
    implements $IndustryIdentifiersCopyWith<$Res> {
  _$IndustryIdentifiersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? identifier = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BookIdentityType,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndustryIdentifiersImplCopyWith<$Res>
    implements $IndustryIdentifiersCopyWith<$Res> {
  factory _$$IndustryIdentifiersImplCopyWith(_$IndustryIdentifiersImpl value,
          $Res Function(_$IndustryIdentifiersImpl) then) =
      __$$IndustryIdentifiersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookIdentityType type, String identifier});
}

/// @nodoc
class __$$IndustryIdentifiersImplCopyWithImpl<$Res>
    extends _$IndustryIdentifiersCopyWithImpl<$Res, _$IndustryIdentifiersImpl>
    implements _$$IndustryIdentifiersImplCopyWith<$Res> {
  __$$IndustryIdentifiersImplCopyWithImpl(_$IndustryIdentifiersImpl _value,
      $Res Function(_$IndustryIdentifiersImpl) _then)
      : super(_value, _then);

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? identifier = null,
  }) {
    return _then(_$IndustryIdentifiersImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BookIdentityType,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndustryIdentifiersImpl implements _IndustryIdentifiers {
  const _$IndustryIdentifiersImpl(
      {required this.type, required this.identifier});

  factory _$IndustryIdentifiersImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndustryIdentifiersImplFromJson(json);

  @override
  final BookIdentityType type;
  @override
  final String identifier;

  @override
  String toString() {
    return 'IndustryIdentifiers(type: $type, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndustryIdentifiersImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, identifier);

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IndustryIdentifiersImplCopyWith<_$IndustryIdentifiersImpl> get copyWith =>
      __$$IndustryIdentifiersImplCopyWithImpl<_$IndustryIdentifiersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndustryIdentifiersImplToJson(
      this,
    );
  }
}

abstract class _IndustryIdentifiers implements IndustryIdentifiers {
  const factory _IndustryIdentifiers(
      {required final BookIdentityType type,
      required final String identifier}) = _$IndustryIdentifiersImpl;

  factory _IndustryIdentifiers.fromJson(Map<String, dynamic> json) =
      _$IndustryIdentifiersImpl.fromJson;

  @override
  BookIdentityType get type;
  @override
  String get identifier;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IndustryIdentifiersImplCopyWith<_$IndustryIdentifiersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
