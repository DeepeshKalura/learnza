// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'departments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepartmentsModel {
  String get id;
  String get name;
  String get description;
  String? get departmentProfilePictureUrl;
  String? get headTeacherId;
  List<String>? get teacherIds;
  bool get isActive;
  DateTime get createdAt;
  Map<String, dynamic>? get metadata;

  /// Create a copy of DepartmentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DepartmentsModelCopyWith<DepartmentsModel> get copyWith =>
      _$DepartmentsModelCopyWithImpl<DepartmentsModel>(
          this as DepartmentsModel, _$identity);

  /// Serializes this DepartmentsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DepartmentsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.departmentProfilePictureUrl,
                    departmentProfilePictureUrl) ||
                other.departmentProfilePictureUrl ==
                    departmentProfilePictureUrl) &&
            (identical(other.headTeacherId, headTeacherId) ||
                other.headTeacherId == headTeacherId) &&
            const DeepCollectionEquality()
                .equals(other.teacherIds, teacherIds) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      departmentProfilePictureUrl,
      headTeacherId,
      const DeepCollectionEquality().hash(teacherIds),
      isActive,
      createdAt,
      const DeepCollectionEquality().hash(metadata));

  @override
  String toString() {
    return 'DepartmentsModel(id: $id, name: $name, description: $description, departmentProfilePictureUrl: $departmentProfilePictureUrl, headTeacherId: $headTeacherId, teacherIds: $teacherIds, isActive: $isActive, createdAt: $createdAt, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $DepartmentsModelCopyWith<$Res> {
  factory $DepartmentsModelCopyWith(
          DepartmentsModel value, $Res Function(DepartmentsModel) _then) =
      _$DepartmentsModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String? departmentProfilePictureUrl,
      String? headTeacherId,
      List<String>? teacherIds,
      bool isActive,
      DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$DepartmentsModelCopyWithImpl<$Res>
    implements $DepartmentsModelCopyWith<$Res> {
  _$DepartmentsModelCopyWithImpl(this._self, this._then);

  final DepartmentsModel _self;
  final $Res Function(DepartmentsModel) _then;

  /// Create a copy of DepartmentsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? departmentProfilePictureUrl = freezed,
    Object? headTeacherId = freezed,
    Object? teacherIds = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? metadata = freezed,
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
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departmentProfilePictureUrl: freezed == departmentProfilePictureUrl
          ? _self.departmentProfilePictureUrl
          : departmentProfilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      headTeacherId: freezed == headTeacherId
          ? _self.headTeacherId
          : headTeacherId // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherIds: freezed == teacherIds
          ? _self.teacherIds
          : teacherIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DepartmentsModel implements DepartmentsModel {
  const _DepartmentsModel(
      {required this.id,
      required this.name,
      required this.description,
      this.departmentProfilePictureUrl,
      this.headTeacherId,
      final List<String>? teacherIds,
      required this.isActive,
      required this.createdAt,
      final Map<String, dynamic>? metadata})
      : _teacherIds = teacherIds,
        _metadata = metadata;
  factory _DepartmentsModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? departmentProfilePictureUrl;
  @override
  final String? headTeacherId;
  final List<String>? _teacherIds;
  @override
  List<String>? get teacherIds {
    final value = _teacherIds;
    if (value == null) return null;
    if (_teacherIds is EqualUnmodifiableListView) return _teacherIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of DepartmentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DepartmentsModelCopyWith<_DepartmentsModel> get copyWith =>
      __$DepartmentsModelCopyWithImpl<_DepartmentsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DepartmentsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DepartmentsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.departmentProfilePictureUrl,
                    departmentProfilePictureUrl) ||
                other.departmentProfilePictureUrl ==
                    departmentProfilePictureUrl) &&
            (identical(other.headTeacherId, headTeacherId) ||
                other.headTeacherId == headTeacherId) &&
            const DeepCollectionEquality()
                .equals(other._teacherIds, _teacherIds) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      departmentProfilePictureUrl,
      headTeacherId,
      const DeepCollectionEquality().hash(_teacherIds),
      isActive,
      createdAt,
      const DeepCollectionEquality().hash(_metadata));

  @override
  String toString() {
    return 'DepartmentsModel(id: $id, name: $name, description: $description, departmentProfilePictureUrl: $departmentProfilePictureUrl, headTeacherId: $headTeacherId, teacherIds: $teacherIds, isActive: $isActive, createdAt: $createdAt, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$DepartmentsModelCopyWith<$Res>
    implements $DepartmentsModelCopyWith<$Res> {
  factory _$DepartmentsModelCopyWith(
          _DepartmentsModel value, $Res Function(_DepartmentsModel) _then) =
      __$DepartmentsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String? departmentProfilePictureUrl,
      String? headTeacherId,
      List<String>? teacherIds,
      bool isActive,
      DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$DepartmentsModelCopyWithImpl<$Res>
    implements _$DepartmentsModelCopyWith<$Res> {
  __$DepartmentsModelCopyWithImpl(this._self, this._then);

  final _DepartmentsModel _self;
  final $Res Function(_DepartmentsModel) _then;

  /// Create a copy of DepartmentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? departmentProfilePictureUrl = freezed,
    Object? headTeacherId = freezed,
    Object? teacherIds = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_DepartmentsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departmentProfilePictureUrl: freezed == departmentProfilePictureUrl
          ? _self.departmentProfilePictureUrl
          : departmentProfilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      headTeacherId: freezed == headTeacherId
          ? _self.headTeacherId
          : headTeacherId // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherIds: freezed == teacherIds
          ? _self._teacherIds
          : teacherIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
