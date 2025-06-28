// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groups_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GroupsModel _$GroupsModelFromJson(Map<String, dynamic> json) {
  return _GroupModel.fromJson(json);
}

/// @nodoc
mixin _$GroupsModel {
  String get id;
  String get name;
  String? get description;
  String? get imageUrl;
  String? get coverImageUrl;
  List<GroupMember> get members;
  DateTime get createdAt;
  DateTime get updatedAt;
  GroupPrivacy get privacy;
  List<String> get pendingInvites;

  /// Create a copy of GroupsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupsModelCopyWith<GroupsModel> get copyWith =>
      _$GroupsModelCopyWithImpl<GroupsModel>(this as GroupsModel, _$identity);

  /// Serializes this GroupsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            const DeepCollectionEquality()
                .equals(other.pendingInvites, pendingInvites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      imageUrl,
      coverImageUrl,
      const DeepCollectionEquality().hash(members),
      createdAt,
      updatedAt,
      privacy,
      const DeepCollectionEquality().hash(pendingInvites));

  @override
  String toString() {
    return 'GroupsModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, coverImageUrl: $coverImageUrl, members: $members, createdAt: $createdAt, updatedAt: $updatedAt, privacy: $privacy, pendingInvites: $pendingInvites)';
  }
}

/// @nodoc
abstract mixin class $GroupsModelCopyWith<$Res> {
  factory $GroupsModelCopyWith(
          GroupsModel value, $Res Function(GroupsModel) _then) =
      _$GroupsModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? imageUrl,
      String? coverImageUrl,
      List<GroupMember> members,
      DateTime createdAt,
      DateTime updatedAt,
      GroupPrivacy privacy,
      List<String> pendingInvites});
}

/// @nodoc
class _$GroupsModelCopyWithImpl<$Res> implements $GroupsModelCopyWith<$Res> {
  _$GroupsModelCopyWithImpl(this._self, this._then);

  final GroupsModel _self;
  final $Res Function(GroupsModel) _then;

  /// Create a copy of GroupsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? coverImageUrl = freezed,
    Object? members = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? privacy = null,
    Object? pendingInvites = null,
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
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImageUrl: freezed == coverImageUrl
          ? _self.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      privacy: null == privacy
          ? _self.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as GroupPrivacy,
      pendingInvites: null == pendingInvites
          ? _self.pendingInvites
          : pendingInvites // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GroupModel implements GroupsModel {
  const _GroupModel(
      {required this.id,
      required this.name,
      this.description,
      this.imageUrl,
      this.coverImageUrl,
      required final List<GroupMember> members,
      required this.createdAt,
      required this.updatedAt,
      this.privacy = GroupPrivacy.private,
      final List<String> pendingInvites = const []})
      : _members = members,
        _pendingInvites = pendingInvites;
  factory _GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? coverImageUrl;
  final List<GroupMember> _members;
  @override
  List<GroupMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final GroupPrivacy privacy;
  final List<String> _pendingInvites;
  @override
  @JsonKey()
  List<String> get pendingInvites {
    if (_pendingInvites is EqualUnmodifiableListView) return _pendingInvites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingInvites);
  }

  /// Create a copy of GroupsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupModelCopyWith<_GroupModel> get copyWith =>
      __$GroupModelCopyWithImpl<_GroupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            const DeepCollectionEquality()
                .equals(other._pendingInvites, _pendingInvites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      imageUrl,
      coverImageUrl,
      const DeepCollectionEquality().hash(_members),
      createdAt,
      updatedAt,
      privacy,
      const DeepCollectionEquality().hash(_pendingInvites));

  @override
  String toString() {
    return 'GroupsModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, coverImageUrl: $coverImageUrl, members: $members, createdAt: $createdAt, updatedAt: $updatedAt, privacy: $privacy, pendingInvites: $pendingInvites)';
  }
}

/// @nodoc
abstract mixin class _$GroupModelCopyWith<$Res>
    implements $GroupsModelCopyWith<$Res> {
  factory _$GroupModelCopyWith(
          _GroupModel value, $Res Function(_GroupModel) _then) =
      __$GroupModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? imageUrl,
      String? coverImageUrl,
      List<GroupMember> members,
      DateTime createdAt,
      DateTime updatedAt,
      GroupPrivacy privacy,
      List<String> pendingInvites});
}

/// @nodoc
class __$GroupModelCopyWithImpl<$Res> implements _$GroupModelCopyWith<$Res> {
  __$GroupModelCopyWithImpl(this._self, this._then);

  final _GroupModel _self;
  final $Res Function(_GroupModel) _then;

  /// Create a copy of GroupsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? coverImageUrl = freezed,
    Object? members = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? privacy = null,
    Object? pendingInvites = null,
  }) {
    return _then(_GroupModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImageUrl: freezed == coverImageUrl
          ? _self.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      privacy: null == privacy
          ? _self.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as GroupPrivacy,
      pendingInvites: null == pendingInvites
          ? _self._pendingInvites
          : pendingInvites // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$GroupMember {
  String get id;
  GroupRole get role;

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupMemberCopyWith<GroupMember> get copyWith =>
      _$GroupMemberCopyWithImpl<GroupMember>(this as GroupMember, _$identity);

  /// Serializes this GroupMember to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupMember &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, role);

  @override
  String toString() {
    return 'GroupMember(id: $id, role: $role)';
  }
}

/// @nodoc
abstract mixin class $GroupMemberCopyWith<$Res> {
  factory $GroupMemberCopyWith(
          GroupMember value, $Res Function(GroupMember) _then) =
      _$GroupMemberCopyWithImpl;
  @useResult
  $Res call({String id, GroupRole role});
}

/// @nodoc
class _$GroupMemberCopyWithImpl<$Res> implements $GroupMemberCopyWith<$Res> {
  _$GroupMemberCopyWithImpl(this._self, this._then);

  final GroupMember _self;
  final $Res Function(GroupMember) _then;

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as GroupRole,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GroupMember implements GroupMember {
  const _GroupMember({required this.id, required this.role});
  factory _GroupMember.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberFromJson(json);

  @override
  final String id;
  @override
  final GroupRole role;

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupMemberCopyWith<_GroupMember> get copyWith =>
      __$GroupMemberCopyWithImpl<_GroupMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupMemberToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupMember &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, role);

  @override
  String toString() {
    return 'GroupMember(id: $id, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$GroupMemberCopyWith<$Res>
    implements $GroupMemberCopyWith<$Res> {
  factory _$GroupMemberCopyWith(
          _GroupMember value, $Res Function(_GroupMember) _then) =
      __$GroupMemberCopyWithImpl;
  @override
  @useResult
  $Res call({String id, GroupRole role});
}

/// @nodoc
class __$GroupMemberCopyWithImpl<$Res> implements _$GroupMemberCopyWith<$Res> {
  __$GroupMemberCopyWithImpl(this._self, this._then);

  final _GroupMember _self;
  final $Res Function(_GroupMember) _then;

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? role = null,
  }) {
    return _then(_GroupMember(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as GroupRole,
    ));
  }
}

// dart format on
