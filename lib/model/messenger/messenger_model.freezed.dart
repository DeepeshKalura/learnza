// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messenger_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessengerModel _$MessengerModelFromJson(Map<String, dynamic> json) {
  return _MessengerModel.fromJson(json);
}

/// @nodoc
mixin _$MessengerModel {
  String get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  DateTime get lastseen => throw _privateConstructorUsedError;

  /// Serializes this MessengerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessengerModelCopyWith<MessengerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessengerModelCopyWith<$Res> {
  factory $MessengerModelCopyWith(
          MessengerModel value, $Res Function(MessengerModel) then) =
      _$MessengerModelCopyWithImpl<$Res, MessengerModel>;
  @useResult
  $Res call({String id, String? userId, String? groupId, DateTime lastseen});
}

/// @nodoc
class _$MessengerModelCopyWithImpl<$Res, $Val extends MessengerModel>
    implements $MessengerModelCopyWith<$Res> {
  _$MessengerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? groupId = freezed,
    Object? lastseen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastseen: null == lastseen
          ? _value.lastseen
          : lastseen // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessengerModelImplCopyWith<$Res>
    implements $MessengerModelCopyWith<$Res> {
  factory _$$MessengerModelImplCopyWith(_$MessengerModelImpl value,
          $Res Function(_$MessengerModelImpl) then) =
      __$$MessengerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? userId, String? groupId, DateTime lastseen});
}

/// @nodoc
class __$$MessengerModelImplCopyWithImpl<$Res>
    extends _$MessengerModelCopyWithImpl<$Res, _$MessengerModelImpl>
    implements _$$MessengerModelImplCopyWith<$Res> {
  __$$MessengerModelImplCopyWithImpl(
      _$MessengerModelImpl _value, $Res Function(_$MessengerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? groupId = freezed,
    Object? lastseen = null,
  }) {
    return _then(_$MessengerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastseen: null == lastseen
          ? _value.lastseen
          : lastseen // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessengerModelImpl implements _MessengerModel {
  const _$MessengerModelImpl(
      {required this.id, this.userId, this.groupId, required this.lastseen});

  factory _$MessengerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessengerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? userId;
  @override
  final String? groupId;
  @override
  final DateTime lastseen;

  @override
  String toString() {
    return 'MessengerModel(id: $id, userId: $userId, groupId: $groupId, lastseen: $lastseen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessengerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.lastseen, lastseen) ||
                other.lastseen == lastseen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, groupId, lastseen);

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessengerModelImplCopyWith<_$MessengerModelImpl> get copyWith =>
      __$$MessengerModelImplCopyWithImpl<_$MessengerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessengerModelImplToJson(
      this,
    );
  }
}

abstract class _MessengerModel implements MessengerModel {
  const factory _MessengerModel(
      {required final String id,
      final String? userId,
      final String? groupId,
      required final DateTime lastseen}) = _$MessengerModelImpl;

  factory _MessengerModel.fromJson(Map<String, dynamic> json) =
      _$MessengerModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get userId;
  @override
  String? get groupId;
  @override
  DateTime get lastseen;

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessengerModelImplCopyWith<_$MessengerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
