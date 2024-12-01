// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) {
  return _UsersModel.fromJson(json);
}

/// @nodoc
mixin _$UsersModel {
  UserRole get role => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError; // Students
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get profileImageURL => throw _privateConstructorUsedError;
  String? get batch => throw _privateConstructorUsedError;
  String? get motherName => throw _privateConstructorUsedError;
  String? get fatherName => throw _privateConstructorUsedError; // Message
  String? get lastseen => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  List<String> get blockedUsers => throw _privateConstructorUsedError;
  List<String> get contactUsers =>
      throw _privateConstructorUsedError; // Teachers
  String? get courseId => throw _privateConstructorUsedError; // Future purpose
  String? get departmentId =>
      throw _privateConstructorUsedError; // Status tracking
  String? get banReason => throw _privateConstructorUsedError;
  String? get bannedById => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UsersModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersModelCopyWith<UsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersModelCopyWith<$Res> {
  factory $UsersModelCopyWith(
          UsersModel value, $Res Function(UsersModel) then) =
      _$UsersModelCopyWithImpl<$Res, UsersModel>;
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
      String? lastseen,
      bool isActive,
      bool isOnline,
      List<String> blockedUsers,
      List<String> contactUsers,
      String? courseId,
      String? departmentId,
      String? banReason,
      String? bannedById,
      DateTime createdAt});
}

/// @nodoc
class _$UsersModelCopyWithImpl<$Res, $Val extends UsersModel>
    implements $UsersModelCopyWith<$Res> {
  _$UsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? lastseen = freezed,
    Object? isActive = null,
    Object? isOnline = null,
    Object? blockedUsers = null,
    Object? contactUsers = null,
    Object? courseId = freezed,
    Object? departmentId = freezed,
    Object? banReason = freezed,
    Object? bannedById = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastseen: freezed == lastseen
          ? _value.lastseen
          : lastseen // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUsers: null == blockedUsers
          ? _value.blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactUsers: null == contactUsers
          ? _value.contactUsers
          : contactUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      banReason: freezed == banReason
          ? _value.banReason
          : banReason // ignore: cast_nullable_to_non_nullable
              as String?,
      bannedById: freezed == bannedById
          ? _value.bannedById
          : bannedById // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersModelImplCopyWith<$Res>
    implements $UsersModelCopyWith<$Res> {
  factory _$$UsersModelImplCopyWith(
          _$UsersModelImpl value, $Res Function(_$UsersModelImpl) then) =
      __$$UsersModelImplCopyWithImpl<$Res>;
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
      String? lastseen,
      bool isActive,
      bool isOnline,
      List<String> blockedUsers,
      List<String> contactUsers,
      String? courseId,
      String? departmentId,
      String? banReason,
      String? bannedById,
      DateTime createdAt});
}

/// @nodoc
class __$$UsersModelImplCopyWithImpl<$Res>
    extends _$UsersModelCopyWithImpl<$Res, _$UsersModelImpl>
    implements _$$UsersModelImplCopyWith<$Res> {
  __$$UsersModelImplCopyWithImpl(
      _$UsersModelImpl _value, $Res Function(_$UsersModelImpl) _then)
      : super(_value, _then);

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
    Object? lastseen = freezed,
    Object? isActive = null,
    Object? isOnline = null,
    Object? blockedUsers = null,
    Object? contactUsers = null,
    Object? courseId = freezed,
    Object? departmentId = freezed,
    Object? banReason = freezed,
    Object? bannedById = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$UsersModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastseen: freezed == lastseen
          ? _value.lastseen
          : lastseen // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUsers: null == blockedUsers
          ? _value._blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactUsers: null == contactUsers
          ? _value._contactUsers
          : contactUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      banReason: freezed == banReason
          ? _value.banReason
          : banReason // ignore: cast_nullable_to_non_nullable
              as String?,
      bannedById: freezed == bannedById
          ? _value.bannedById
          : bannedById // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersModelImpl implements _UsersModel {
  const _$UsersModelImpl(
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
      this.lastseen,
      this.isActive = true,
      required this.isOnline,
      final List<String> blockedUsers = const [],
      final List<String> contactUsers = const [],
      this.courseId,
      this.departmentId,
      this.banReason,
      this.bannedById,
      required this.createdAt})
      : _blockedUsers = blockedUsers,
        _contactUsers = contactUsers;

  factory _$UsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersModelImplFromJson(json);

  @override
  final UserRole role;
  @override
  final String? title;
// Students
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
// Message
  @override
  final String? lastseen;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final bool isOnline;
  final List<String> _blockedUsers;
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

// Teachers
  @override
  final String? courseId;
// Future purpose
  @override
  final String? departmentId;
// Status tracking
  @override
  final String? banReason;
  @override
  final String? bannedById;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'UsersModel(role: $role, title: $title, uid: $uid, email: $email, fullName: $fullName, address: $address, phoneNumber: $phoneNumber, profileImageURL: $profileImageURL, batch: $batch, motherName: $motherName, fatherName: $fatherName, lastseen: $lastseen, isActive: $isActive, isOnline: $isOnline, blockedUsers: $blockedUsers, contactUsers: $contactUsers, courseId: $courseId, departmentId: $departmentId, banReason: $banReason, bannedById: $bannedById, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersModelImpl &&
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
            (identical(other.lastseen, lastseen) ||
                other.lastseen == lastseen) &&
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
        lastseen,
        isActive,
        isOnline,
        const DeepCollectionEquality().hash(_blockedUsers),
        const DeepCollectionEquality().hash(_contactUsers),
        courseId,
        departmentId,
        banReason,
        bannedById,
        createdAt
      ]);

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersModelImplCopyWith<_$UsersModelImpl> get copyWith =>
      __$$UsersModelImplCopyWithImpl<_$UsersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersModelImplToJson(
      this,
    );
  }
}

abstract class _UsersModel implements UsersModel {
  const factory _UsersModel(
      {required final UserRole role,
      final String? title,
      required final String uid,
      required final String email,
      required final String fullName,
      final String? address,
      final String? phoneNumber,
      final String? profileImageURL,
      final String? batch,
      final String? motherName,
      final String? fatherName,
      final String? lastseen,
      final bool isActive,
      required final bool isOnline,
      final List<String> blockedUsers,
      final List<String> contactUsers,
      final String? courseId,
      final String? departmentId,
      final String? banReason,
      final String? bannedById,
      required final DateTime createdAt}) = _$UsersModelImpl;

  factory _UsersModel.fromJson(Map<String, dynamic> json) =
      _$UsersModelImpl.fromJson;

  @override
  UserRole get role;
  @override
  String? get title; // Students
  @override
  String get uid;
  @override
  String get email;
  @override
  String get fullName;
  @override
  String? get address;
  @override
  String? get phoneNumber;
  @override
  String? get profileImageURL;
  @override
  String? get batch;
  @override
  String? get motherName;
  @override
  String? get fatherName; // Message
  @override
  String? get lastseen;
  @override
  bool get isActive;
  @override
  bool get isOnline;
  @override
  List<String> get blockedUsers;
  @override
  List<String> get contactUsers; // Teachers
  @override
  String? get courseId; // Future purpose
  @override
  String? get departmentId; // Status tracking
  @override
  String? get banReason;
  @override
  String? get bannedById;
  @override
  DateTime get createdAt;

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersModelImplCopyWith<_$UsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
