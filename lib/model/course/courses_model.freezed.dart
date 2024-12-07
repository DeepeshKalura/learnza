// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'courses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoursesModel _$CoursesModelFromJson(Map<String, dynamic> json) {
  return _CoursesModel.fromJson(json);
}

/// @nodoc
mixin _$CoursesModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get year =>
      throw _privateConstructorUsedError; // how long the year last for a given course
  String? get description => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  String? get courseImageUrl => throw _privateConstructorUsedError;
  String? get departmentId =>
      throw _privateConstructorUsedError; // Foreign Key: References the Department
  bool get isActive =>
      throw _privateConstructorUsedError; // Indicates if the course is currently active
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // Timestamp when the course was created
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CoursesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoursesModelCopyWith<CoursesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursesModelCopyWith<$Res> {
  factory $CoursesModelCopyWith(
          CoursesModel value, $Res Function(CoursesModel) then) =
      _$CoursesModelCopyWithImpl<$Res, CoursesModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      int year,
      String? description,
      String? shortName,
      String? courseImageUrl,
      String? departmentId,
      bool isActive,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CoursesModelCopyWithImpl<$Res, $Val extends CoursesModel>
    implements $CoursesModelCopyWith<$Res> {
  _$CoursesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? year = null,
    Object? description = freezed,
    Object? shortName = freezed,
    Object? courseImageUrl = freezed,
    Object? departmentId = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseImageUrl: freezed == courseImageUrl
          ? _value.courseImageUrl
          : courseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoursesModelImplCopyWith<$Res>
    implements $CoursesModelCopyWith<$Res> {
  factory _$$CoursesModelImplCopyWith(
          _$CoursesModelImpl value, $Res Function(_$CoursesModelImpl) then) =
      __$$CoursesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int year,
      String? description,
      String? shortName,
      String? courseImageUrl,
      String? departmentId,
      bool isActive,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CoursesModelImplCopyWithImpl<$Res>
    extends _$CoursesModelCopyWithImpl<$Res, _$CoursesModelImpl>
    implements _$$CoursesModelImplCopyWith<$Res> {
  __$$CoursesModelImplCopyWithImpl(
      _$CoursesModelImpl _value, $Res Function(_$CoursesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? year = null,
    Object? description = freezed,
    Object? shortName = freezed,
    Object? courseImageUrl = freezed,
    Object? departmentId = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CoursesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseImageUrl: freezed == courseImageUrl
          ? _value.courseImageUrl
          : courseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoursesModelImpl implements _CoursesModel {
  const _$CoursesModelImpl(
      {required this.id,
      required this.name,
      required this.year,
      this.description,
      this.shortName,
      this.courseImageUrl,
      this.departmentId,
      required this.isActive,
      required this.createdAt,
      this.updatedAt});

  factory _$CoursesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoursesModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int year;
// how long the year last for a given course
  @override
  final String? description;
  @override
  final String? shortName;
  @override
  final String? courseImageUrl;
  @override
  final String? departmentId;
// Foreign Key: References the Department
  @override
  final bool isActive;
// Indicates if the course is currently active
  @override
  final DateTime createdAt;
// Timestamp when the course was created
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CoursesModel(id: $id, name: $name, year: $year, description: $description, shortName: $shortName, courseImageUrl: $courseImageUrl, departmentId: $departmentId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoursesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.courseImageUrl, courseImageUrl) ||
                other.courseImageUrl == courseImageUrl) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, year, description,
      shortName, courseImageUrl, departmentId, isActive, createdAt, updatedAt);

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoursesModelImplCopyWith<_$CoursesModelImpl> get copyWith =>
      __$$CoursesModelImplCopyWithImpl<_$CoursesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoursesModelImplToJson(
      this,
    );
  }
}

abstract class _CoursesModel implements CoursesModel {
  const factory _CoursesModel(
      {required final String id,
      required final String name,
      required final int year,
      final String? description,
      final String? shortName,
      final String? courseImageUrl,
      final String? departmentId,
      required final bool isActive,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$CoursesModelImpl;

  factory _CoursesModel.fromJson(Map<String, dynamic> json) =
      _$CoursesModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get year; // how long the year last for a given course
  @override
  String? get description;
  @override
  String? get shortName;
  @override
  String? get courseImageUrl;
  @override
  String? get departmentId; // Foreign Key: References the Department
  @override
  bool get isActive; // Indicates if the course is currently active
  @override
  DateTime get createdAt; // Timestamp when the course was created
  @override
  DateTime? get updatedAt;

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoursesModelImplCopyWith<_$CoursesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
