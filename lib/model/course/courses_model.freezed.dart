// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'courses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoursesModel {
  String get id;
  String get name;
  int get year; // how long the year last for a given course
  String? get description;
  String? get shortName;
  String? get courseImageUrl;
  String? get departmentId; // Foreign Key: References the Department
  bool get isActive; // Indicates if the course is currently active
  DateTime get createdAt; // Timestamp when the course was created
  DateTime? get updatedAt;

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoursesModelCopyWith<CoursesModel> get copyWith =>
      _$CoursesModelCopyWithImpl<CoursesModel>(
          this as CoursesModel, _$identity);

  /// Serializes this CoursesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoursesModel &&
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

  @override
  String toString() {
    return 'CoursesModel(id: $id, name: $name, year: $year, description: $description, shortName: $shortName, courseImageUrl: $courseImageUrl, departmentId: $departmentId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CoursesModelCopyWith<$Res> {
  factory $CoursesModelCopyWith(
          CoursesModel value, $Res Function(CoursesModel) _then) =
      _$CoursesModelCopyWithImpl;
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
class _$CoursesModelCopyWithImpl<$Res> implements $CoursesModelCopyWith<$Res> {
  _$CoursesModelCopyWithImpl(this._self, this._then);

  final CoursesModel _self;
  final $Res Function(CoursesModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseImageUrl: freezed == courseImageUrl
          ? _self.courseImageUrl
          : courseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _self.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CoursesModel implements CoursesModel {
  const _CoursesModel(
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
  factory _CoursesModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesModelFromJson(json);

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

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoursesModelCopyWith<_CoursesModel> get copyWith =>
      __$CoursesModelCopyWithImpl<_CoursesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoursesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoursesModel &&
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

  @override
  String toString() {
    return 'CoursesModel(id: $id, name: $name, year: $year, description: $description, shortName: $shortName, courseImageUrl: $courseImageUrl, departmentId: $departmentId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CoursesModelCopyWith<$Res>
    implements $CoursesModelCopyWith<$Res> {
  factory _$CoursesModelCopyWith(
          _CoursesModel value, $Res Function(_CoursesModel) _then) =
      __$CoursesModelCopyWithImpl;
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
class __$CoursesModelCopyWithImpl<$Res>
    implements _$CoursesModelCopyWith<$Res> {
  __$CoursesModelCopyWithImpl(this._self, this._then);

  final _CoursesModel _self;
  final $Res Function(_CoursesModel) _then;

  /// Create a copy of CoursesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_CoursesModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseImageUrl: freezed == courseImageUrl
          ? _self.courseImageUrl
          : courseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _self.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

// dart format on
