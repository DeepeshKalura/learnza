// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersModel {
// Core
  UserRole get role;
  String? get title; // Student info
  String get uid;
  String get email;
  String get fullName;
  String? get address;
  String? get phoneNumber;
  String? get profileImageURL;
  String? get batch;
  String? get motherName;
  String? get fatherName; // Messaging
  /// Use camelCase for consistency
  String? get lastSeen;
  bool get isActive;
  bool get isOnline;

  /// Default must be a const, and you should parameterize the generic
  List<String> get blockedUsers;
  List<String> get contactUsers; // Teaching
  String? get courseId; // Future use
  String? get departmentId;
  List<String> get searchableKeywords; // Moderation
  String? get banReason;
  String? get bannedById; // Metadata
  DateTime get createdAt;

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersModelCopyWith<UsersModel> get copyWith =>
      _$UsersModelCopyWithImpl<UsersModel>(this as UsersModel, _$identity);

  /// Serializes this UsersModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersModel &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImageURL, profileImageURL) ||
                other.profileImageURL == profileImageURL) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.motherName, motherName) ||
                other.motherName == motherName) &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            const DeepCollectionEquality()
                .equals(other.blockedUsers, blockedUsers) &&
            const DeepCollectionEquality()
                .equals(other.contactUsers, contactUsers) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            const DeepCollectionEquality()
                .equals(other.searchableKeywords, searchableKeywords) &&
            (identical(other.banReason, banReason) ||
                other.banReason == banReason) &&
            (identical(other.bannedById, bannedById) ||
                other.bannedById == bannedById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        role,
        title,
        uid,
        email,
        fullName,
        address,
        phoneNumber,
        profileImageURL,
        batch,
        motherName,
        fatherName,
        lastSeen,
        isActive,
        isOnline,
        const DeepCollectionEquality().hash(blockedUsers),
        const DeepCollectionEquality().hash(contactUsers),
        courseId,
        departmentId,
        const DeepCollectionEquality().hash(searchableKeywords),
        banReason,
        bannedById,
        createdAt
      ]);

  @override
  String toString() {
    return 'UsersModel(role: $role, title: $title, uid: $uid, email: $email, fullName: $fullName, address: $address, phoneNumber: $phoneNumber, profileImageURL: $profileImageURL, batch: $batch, motherName: $motherName, fatherName: $fatherName, lastSeen: $lastSeen, isActive: $isActive, isOnline: $isOnline, blockedUsers: $blockedUsers, contactUsers: $contactUsers, courseId: $courseId, departmentId: $departmentId, searchableKeywords: $searchableKeywords, banReason: $banReason, bannedById: $bannedById, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UsersModelCopyWith<$Res> {
  factory $UsersModelCopyWith(
          UsersModel value, $Res Function(UsersModel) _then) =
      _$UsersModelCopyWithImpl;
  @useResult
  $Res call(
      {UserRole role,
      String? title,
      String uid,
      String email,
      String fullName,
      String? address,
      String? phoneNumber,
      String? profileImageURL,
      String? batch,
      String? motherName,
      String? fatherName,
      String? lastSeen,
      bool isActive,
      bool isOnline,
      List<String> blockedUsers,
      List<String> contactUsers,
      String? courseId,
      String? departmentId,
      List<String> searchableKeywords,
      String? banReason,
      String? bannedById,
      DateTime createdAt});
}

/// @nodoc
class _$UsersModelCopyWithImpl<$Res> implements $UsersModelCopyWith<$Res> {
  _$UsersModelCopyWithImpl(this._self, this._then);

  final UsersModel _self;
  final $Res Function(UsersModel) _then;

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? title = freezed,
    Object? uid = null,
    Object? email = null,
    Object? fullName = null,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? profileImageURL = freezed,
    Object? batch = freezed,
    Object? motherName = freezed,
    Object? fatherName = freezed,
    Object? lastSeen = freezed,
    Object? isActive = null,
    Object? isOnline = null,
    Object? blockedUsers = null,
    Object? contactUsers = null,
    Object? courseId = freezed,
    Object? departmentId = freezed,
    Object? searchableKeywords = null,
    Object? banReason = freezed,
    Object? bannedById = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _self.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: freezed == batch
          ? _self.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _self.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherName: freezed == fatherName
          ? _self.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUsers: null == blockedUsers
          ? _self.blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactUsers: null == contactUsers
          ? _self.contactUsers
          : contactUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courseId: freezed == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _self.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchableKeywords: null == searchableKeywords
          ? _self.searchableKeywords
          : searchableKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      banReason: freezed == banReason
          ? _self.banReason
          : banReason // ignore: cast_nullable_to_non_nullable
              as String?,
      bannedById: freezed == bannedById
          ? _self.bannedById
          : bannedById // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UsersModel implements UsersModel {
  const _UsersModel(
      {required this.role,
      this.title,
      required this.uid,
      required this.email,
      required this.fullName,
      this.address,
      this.phoneNumber,
      this.profileImageURL,
      this.batch,
      this.motherName,
      this.fatherName,
      this.lastSeen,
      this.isActive = true,
      this.isOnline = false,
      final List<String> blockedUsers = const <String>[],
      final List<String> contactUsers = const <String>[],
      this.courseId,
      this.departmentId,
      final List<String> searchableKeywords = const <String>[],
      this.banReason,
      this.bannedById,
      required this.createdAt})
      : _blockedUsers = blockedUsers,
        _contactUsers = contactUsers,
        _searchableKeywords = searchableKeywords;
  factory _UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

// Core
  @override
  final UserRole role;
  @override
  final String? title;
// Student info
  @override
  final String uid;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? profileImageURL;
  @override
  final String? batch;
  @override
  final String? motherName;
  @override
  final String? fatherName;
// Messaging
  /// Use camelCase for consistency
  @override
  final String? lastSeen;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isOnline;

  /// Default must be a const, and you should parameterize the generic
  final List<String> _blockedUsers;

  /// Default must be a const, and you should parameterize the generic
  @override
  @JsonKey()
  List<String> get blockedUsers {
    if (_blockedUsers is EqualUnmodifiableListView) return _blockedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedUsers);
  }

  final List<String> _contactUsers;
  @override
  @JsonKey()
  List<String> get contactUsers {
    if (_contactUsers is EqualUnmodifiableListView) return _contactUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contactUsers);
  }

// Teaching
  @override
  final String? courseId;
// Future use
  @override
  final String? departmentId;
  final List<String> _searchableKeywords;
  @override
  @JsonKey()
  List<String> get searchableKeywords {
    if (_searchableKeywords is EqualUnmodifiableListView)
      return _searchableKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchableKeywords);
  }

// Moderation
  @override
  final String? banReason;
  @override
  final String? bannedById;
// Metadata
  @override
  final DateTime createdAt;

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsersModelCopyWith<_UsersModel> get copyWith =>
      __$UsersModelCopyWithImpl<_UsersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsersModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersModel &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImageURL, profileImageURL) ||
                other.profileImageURL == profileImageURL) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.motherName, motherName) ||
                other.motherName == motherName) &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            const DeepCollectionEquality()
                .equals(other._blockedUsers, _blockedUsers) &&
            const DeepCollectionEquality()
                .equals(other._contactUsers, _contactUsers) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            const DeepCollectionEquality()
                .equals(other._searchableKeywords, _searchableKeywords) &&
            (identical(other.banReason, banReason) ||
                other.banReason == banReason) &&
            (identical(other.bannedById, bannedById) ||
                other.bannedById == bannedById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        role,
        title,
        uid,
        email,
        fullName,
        address,
        phoneNumber,
        profileImageURL,
        batch,
        motherName,
        fatherName,
        lastSeen,
        isActive,
        isOnline,
        const DeepCollectionEquality().hash(_blockedUsers),
        const DeepCollectionEquality().hash(_contactUsers),
        courseId,
        departmentId,
        const DeepCollectionEquality().hash(_searchableKeywords),
        banReason,
        bannedById,
        createdAt
      ]);

  @override
  String toString() {
    return 'UsersModel(role: $role, title: $title, uid: $uid, email: $email, fullName: $fullName, address: $address, phoneNumber: $phoneNumber, profileImageURL: $profileImageURL, batch: $batch, motherName: $motherName, fatherName: $fatherName, lastSeen: $lastSeen, isActive: $isActive, isOnline: $isOnline, blockedUsers: $blockedUsers, contactUsers: $contactUsers, courseId: $courseId, departmentId: $departmentId, searchableKeywords: $searchableKeywords, banReason: $banReason, bannedById: $bannedById, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UsersModelCopyWith<$Res>
    implements $UsersModelCopyWith<$Res> {
  factory _$UsersModelCopyWith(
          _UsersModel value, $Res Function(_UsersModel) _then) =
      __$UsersModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserRole role,
      String? title,
      String uid,
      String email,
      String fullName,
      String? address,
      String? phoneNumber,
      String? profileImageURL,
      String? batch,
      String? motherName,
      String? fatherName,
      String? lastSeen,
      bool isActive,
      bool isOnline,
      List<String> blockedUsers,
      List<String> contactUsers,
      String? courseId,
      String? departmentId,
      List<String> searchableKeywords,
      String? banReason,
      String? bannedById,
      DateTime createdAt});
}

/// @nodoc
class __$UsersModelCopyWithImpl<$Res> implements _$UsersModelCopyWith<$Res> {
  __$UsersModelCopyWithImpl(this._self, this._then);

  final _UsersModel _self;
  final $Res Function(_UsersModel) _then;

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? role = null,
    Object? title = freezed,
    Object? uid = null,
    Object? email = null,
    Object? fullName = null,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? profileImageURL = freezed,
    Object? batch = freezed,
    Object? motherName = freezed,
    Object? fatherName = freezed,
    Object? lastSeen = freezed,
    Object? isActive = null,
    Object? isOnline = null,
    Object? blockedUsers = null,
    Object? contactUsers = null,
    Object? courseId = freezed,
    Object? departmentId = freezed,
    Object? searchableKeywords = null,
    Object? banReason = freezed,
    Object? bannedById = freezed,
    Object? createdAt = null,
  }) {
    return _then(_UsersModel(
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _self.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: freezed == batch
          ? _self.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _self.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherName: freezed == fatherName
          ? _self.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUsers: null == blockedUsers
          ? _self._blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactUsers: null == contactUsers
          ? _self._contactUsers
          : contactUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courseId: freezed == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _self.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchableKeywords: null == searchableKeywords
          ? _self._searchableKeywords
          : searchableKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      banReason: freezed == banReason
          ? _self.banReason
          : banReason // ignore: cast_nullable_to_non_nullable
              as String?,
      bannedById: freezed == bannedById
          ? _self.bannedById
          : bannedById // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
