// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messenger_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessengerModel {
  String get id;
  String? get userId;
  String? get groupId;
  DateTime get lastseen;

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessengerModelCopyWith<MessengerModel> get copyWith =>
      _$MessengerModelCopyWithImpl<MessengerModel>(
          this as MessengerModel, _$identity);

  /// Serializes this MessengerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessengerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.lastseen, lastseen) ||
                other.lastseen == lastseen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, groupId, lastseen);

  @override
  String toString() {
    return 'MessengerModel(id: $id, userId: $userId, groupId: $groupId, lastseen: $lastseen)';
  }
}

/// @nodoc
abstract mixin class $MessengerModelCopyWith<$Res> {
  factory $MessengerModelCopyWith(
          MessengerModel value, $Res Function(MessengerModel) _then) =
      _$MessengerModelCopyWithImpl;
  @useResult
  $Res call({String id, String? userId, String? groupId, DateTime lastseen});
}

/// @nodoc
class _$MessengerModelCopyWithImpl<$Res>
    implements $MessengerModelCopyWith<$Res> {
  _$MessengerModelCopyWithImpl(this._self, this._then);

  final MessengerModel _self;
  final $Res Function(MessengerModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastseen: null == lastseen
          ? _self.lastseen
          : lastseen // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MessengerModel implements MessengerModel {
  const _MessengerModel(
      {required this.id, this.userId, this.groupId, required this.lastseen});
  factory _MessengerModel.fromJson(Map<String, dynamic> json) =>
      _$MessengerModelFromJson(json);

  @override
  final String id;
  @override
  final String? userId;
  @override
  final String? groupId;
  @override
  final DateTime lastseen;

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessengerModelCopyWith<_MessengerModel> get copyWith =>
      __$MessengerModelCopyWithImpl<_MessengerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessengerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessengerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.lastseen, lastseen) ||
                other.lastseen == lastseen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, groupId, lastseen);

  @override
  String toString() {
    return 'MessengerModel(id: $id, userId: $userId, groupId: $groupId, lastseen: $lastseen)';
  }
}

/// @nodoc
abstract mixin class _$MessengerModelCopyWith<$Res>
    implements $MessengerModelCopyWith<$Res> {
  factory _$MessengerModelCopyWith(
          _MessengerModel value, $Res Function(_MessengerModel) _then) =
      __$MessengerModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String? userId, String? groupId, DateTime lastseen});
}

/// @nodoc
class __$MessengerModelCopyWithImpl<$Res>
    implements _$MessengerModelCopyWith<$Res> {
  __$MessengerModelCopyWithImpl(this._self, this._then);

  final _MessengerModel _self;
  final $Res Function(_MessengerModel) _then;

  /// Create a copy of MessengerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? groupId = freezed,
    Object? lastseen = null,
  }) {
    return _then(_MessengerModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastseen: null == lastseen
          ? _self.lastseen
          : lastseen // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
