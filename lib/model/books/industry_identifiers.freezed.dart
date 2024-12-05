// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'industry_identifiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IndustryIdentifiers _$IndustryIdentifiersFromJson(Map<String, dynamic> json) {
  return _IndustryIdentifiers.fromJson(json);
}

/// @nodoc
mixin _$IndustryIdentifiers {
  String get type => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

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
  $Res call({String type, String value});
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
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
  $Res call({String type, String value});
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
    Object? value = null,
  }) {
    return _then(_$IndustryIdentifiersImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndustryIdentifiersImpl implements _IndustryIdentifiers {
  const _$IndustryIdentifiersImpl({required this.type, required this.value});

  factory _$IndustryIdentifiersImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndustryIdentifiersImplFromJson(json);

  @override
  final String type;
  @override
  final String value;

  @override
  String toString() {
    return 'IndustryIdentifiers(type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndustryIdentifiersImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

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
      {required final String type,
      required final String value}) = _$IndustryIdentifiersImpl;

  factory _IndustryIdentifiers.fromJson(Map<String, dynamic> json) =
      _$IndustryIdentifiersImpl.fromJson;

  @override
  String get type;
  @override
  String get value;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IndustryIdentifiersImplCopyWith<_$IndustryIdentifiersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
