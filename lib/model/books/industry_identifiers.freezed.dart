// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'industry_identifiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IndustryIdentifiers {
  String get type;
  String get value;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IndustryIdentifiersCopyWith<IndustryIdentifiers> get copyWith =>
      _$IndustryIdentifiersCopyWithImpl<IndustryIdentifiers>(
          this as IndustryIdentifiers, _$identity);

  /// Serializes this IndustryIdentifiers to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IndustryIdentifiers &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @override
  String toString() {
    return 'IndustryIdentifiers(type: $type, value: $value)';
  }
}

/// @nodoc
abstract mixin class $IndustryIdentifiersCopyWith<$Res> {
  factory $IndustryIdentifiersCopyWith(
          IndustryIdentifiers value, $Res Function(IndustryIdentifiers) _then) =
      _$IndustryIdentifiersCopyWithImpl;
  @useResult
  $Res call({String type, String value});
}

/// @nodoc
class _$IndustryIdentifiersCopyWithImpl<$Res>
    implements $IndustryIdentifiersCopyWith<$Res> {
  _$IndustryIdentifiersCopyWithImpl(this._self, this._then);

  final IndustryIdentifiers _self;
  final $Res Function(IndustryIdentifiers) _then;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _IndustryIdentifiers implements IndustryIdentifiers {
  const _IndustryIdentifiers({required this.type, required this.value});
  factory _IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);

  @override
  final String type;
  @override
  final String value;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IndustryIdentifiersCopyWith<_IndustryIdentifiers> get copyWith =>
      __$IndustryIdentifiersCopyWithImpl<_IndustryIdentifiers>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IndustryIdentifiersToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IndustryIdentifiers &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @override
  String toString() {
    return 'IndustryIdentifiers(type: $type, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$IndustryIdentifiersCopyWith<$Res>
    implements $IndustryIdentifiersCopyWith<$Res> {
  factory _$IndustryIdentifiersCopyWith(_IndustryIdentifiers value,
          $Res Function(_IndustryIdentifiers) _then) =
      __$IndustryIdentifiersCopyWithImpl;
  @override
  @useResult
  $Res call({String type, String value});
}

/// @nodoc
class __$IndustryIdentifiersCopyWithImpl<$Res>
    implements _$IndustryIdentifiersCopyWith<$Res> {
  __$IndustryIdentifiersCopyWithImpl(this._self, this._then);

  final _IndustryIdentifiers _self;
  final $Res Function(_IndustryIdentifiers) _then;

  /// Create a copy of IndustryIdentifiers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_IndustryIdentifiers(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
