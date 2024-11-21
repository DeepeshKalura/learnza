// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'departments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepartmentsModel _$DepartmentsModelFromJson(Map<String, dynamic> json) {
  return _DepartmentsModel.fromJson(json);
}

/// @nodoc
mixin _$DepartmentsModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get departmentProfilePictureUrl => throw _privateConstructorUsedError;
  String? get headTeacherId => throw _privateConstructorUsedError;
  List<String>? get teacherIds => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this DepartmentsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepartmentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentsModelCopyWith<DepartmentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentsModelCopyWith<$Res> {
  factory $DepartmentsModelCopyWith(
          DepartmentsModel value, $Res Function(DepartmentsModel) then) =
      _$DepartmentsModelCopyWithImpl<$Res, DepartmentsModel>;
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
class _$DepartmentsModelCopyWithImpl<$Res, $Val extends DepartmentsModel>
    implements $DepartmentsModelCopyWith<$Res> {
  _$DepartmentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departmentProfilePictureUrl: freezed == departmentProfilePictureUrl
          ? _value.departmentProfilePictureUrl
          : departmentProfilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      headTeacherId: freezed == headTeacherId
          ? _value.headTeacherId
          : headTeacherId // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherIds: freezed == teacherIds
          ? _value.teacherIds
          : teacherIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartmentsModelImplCopyWith<$Res>
    implements $DepartmentsModelCopyWith<$Res> {
  factory _$$DepartmentsModelImplCopyWith(_$DepartmentsModelImpl value,
          $Res Function(_$DepartmentsModelImpl) then) =
      __$$DepartmentsModelImplCopyWithImpl<$Res>;
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
class __$$DepartmentsModelImplCopyWithImpl<$Res>
    extends _$DepartmentsModelCopyWithImpl<$Res, _$DepartmentsModelImpl>
    implements _$$DepartmentsModelImplCopyWith<$Res> {
  __$$DepartmentsModelImplCopyWithImpl(_$DepartmentsModelImpl _value,
      $Res Function(_$DepartmentsModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$DepartmentsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departmentProfilePictureUrl: freezed == departmentProfilePictureUrl
          ? _value.departmentProfilePictureUrl
          : departmentProfilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      headTeacherId: freezed == headTeacherId
          ? _value.headTeacherId
          : headTeacherId // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherIds: freezed == teacherIds
          ? _value._teacherIds
          : teacherIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentsModelImpl implements _DepartmentsModel {
  const _$DepartmentsModelImpl(
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

  factory _$DepartmentsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentsModelImplFromJson(json);

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

  @override
  String toString() {
    return 'DepartmentsModel(id: $id, name: $name, description: $description, departmentProfilePictureUrl: $departmentProfilePictureUrl, headTeacherId: $headTeacherId, teacherIds: $teacherIds, isActive: $isActive, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentsModelImpl &&
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

  /// Create a copy of DepartmentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentsModelImplCopyWith<_$DepartmentsModelImpl> get copyWith =>
      __$$DepartmentsModelImplCopyWithImpl<_$DepartmentsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentsModelImplToJson(
      this,
    );
  }
}

abstract class _DepartmentsModel implements DepartmentsModel {
  const factory _DepartmentsModel(
      {required final String id,
      required final String name,
      required final String description,
      final String? departmentProfilePictureUrl,
      final String? headTeacherId,
      final List<String>? teacherIds,
      required final bool isActive,
      required final DateTime createdAt,
      final Map<String, dynamic>? metadata}) = _$DepartmentsModelImpl;

  factory _DepartmentsModel.fromJson(Map<String, dynamic> json) =
      _$DepartmentsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get departmentProfilePictureUrl;
  @override
  String? get headTeacherId;
  @override
  List<String>? get teacherIds;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of DepartmentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentsModelImplCopyWith<_$DepartmentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
