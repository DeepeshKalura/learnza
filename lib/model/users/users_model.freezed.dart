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
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get isEmailVerified => throw _privateConstructorUsedError;
  DateTime? get lastLogin =>
      throw _privateConstructorUsedError; // Common optional fields
  String? get profileImage => throw _privateConstructorUsedError;
  String? get phoneNumber =>
      throw _privateConstructorUsedError; // Admin specific fields
  bool? get isSuperAdmin =>
      throw _privateConstructorUsedError; // Teacher specific fields
  bool? get isHeadTeacher => throw _privateConstructorUsedError;
  String? get departmentId => throw _privateConstructorUsedError;
  List<String>? get assignedCourseIds => throw _privateConstructorUsedError;
  bool? get canInviteTeachers =>
      throw _privateConstructorUsedError; // For head teachers
// Student specific fields
  String? get enrolledDepartmentId => throw _privateConstructorUsedError;
  List<String>? get enrolledCourseIds => throw _privateConstructorUsedError;
  bool? get isOnProbation =>
      throw _privateConstructorUsedError; // For academic status tracking
// Status tracking
  String? get banReason => throw _privateConstructorUsedError;
  DateTime? get banExpiry => throw _privateConstructorUsedError;
  String? get bannedBy => throw _privateConstructorUsedError;
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get activityLog => throw _privateConstructorUsedError;

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
      {String uid,
      String email,
      String fullName,
      UserRole role,
      bool isActive,
      DateTime createdAt,
      DateTime? isEmailVerified,
      DateTime? lastLogin,
      String? profileImage,
      String? phoneNumber,
      bool? isSuperAdmin,
      bool? isHeadTeacher,
      String? departmentId,
      List<String>? assignedCourseIds,
      bool? canInviteTeachers,
      String? enrolledDepartmentId,
      List<String>? enrolledCourseIds,
      bool? isOnProbation,
      String? banReason,
      DateTime? banExpiry,
      String? bannedBy,
      DateTime? lastActiveAt,
      Map<String, dynamic>? activityLog});
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
    Object? uid = null,
    Object? email = null,
    Object? fullName = null,
    Object? role = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? isEmailVerified = freezed,
    Object? lastLogin = freezed,
    Object? profileImage = freezed,
    Object? phoneNumber = freezed,
    Object? isSuperAdmin = freezed,
    Object? isHeadTeacher = freezed,
    Object? departmentId = freezed,
    Object? assignedCourseIds = freezed,
    Object? canInviteTeachers = freezed,
    Object? enrolledDepartmentId = freezed,
    Object? enrolledCourseIds = freezed,
    Object? isOnProbation = freezed,
    Object? banReason = freezed,
    Object? banExpiry = freezed,
    Object? bannedBy = freezed,
    Object? lastActiveAt = freezed,
    Object? activityLog = freezed,
  }) {
    return _then(_value.copyWith(
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuperAdmin: freezed == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHeadTeacher: freezed == isHeadTeacher
          ? _value.isHeadTeacher
          : isHeadTeacher // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedCourseIds: freezed == assignedCourseIds
          ? _value.assignedCourseIds
          : assignedCourseIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      canInviteTeachers: freezed == canInviteTeachers
          ? _value.canInviteTeachers
          : canInviteTeachers // ignore: cast_nullable_to_non_nullable
              as bool?,
      enrolledDepartmentId: freezed == enrolledDepartmentId
          ? _value.enrolledDepartmentId
          : enrolledDepartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      enrolledCourseIds: freezed == enrolledCourseIds
          ? _value.enrolledCourseIds
          : enrolledCourseIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isOnProbation: freezed == isOnProbation
          ? _value.isOnProbation
          : isOnProbation // ignore: cast_nullable_to_non_nullable
              as bool?,
      banReason: freezed == banReason
          ? _value.banReason
          : banReason // ignore: cast_nullable_to_non_nullable
              as String?,
      banExpiry: freezed == banExpiry
          ? _value.banExpiry
          : banExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bannedBy: freezed == bannedBy
          ? _value.bannedBy
          : bannedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activityLog: freezed == activityLog
          ? _value.activityLog
          : activityLog // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      {String uid,
      String email,
      String fullName,
      UserRole role,
      bool isActive,
      DateTime createdAt,
      DateTime? isEmailVerified,
      DateTime? lastLogin,
      String? profileImage,
      String? phoneNumber,
      bool? isSuperAdmin,
      bool? isHeadTeacher,
      String? departmentId,
      List<String>? assignedCourseIds,
      bool? canInviteTeachers,
      String? enrolledDepartmentId,
      List<String>? enrolledCourseIds,
      bool? isOnProbation,
      String? banReason,
      DateTime? banExpiry,
      String? bannedBy,
      DateTime? lastActiveAt,
      Map<String, dynamic>? activityLog});
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
    Object? uid = null,
    Object? email = null,
    Object? fullName = null,
    Object? role = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? isEmailVerified = freezed,
    Object? lastLogin = freezed,
    Object? profileImage = freezed,
    Object? phoneNumber = freezed,
    Object? isSuperAdmin = freezed,
    Object? isHeadTeacher = freezed,
    Object? departmentId = freezed,
    Object? assignedCourseIds = freezed,
    Object? canInviteTeachers = freezed,
    Object? enrolledDepartmentId = freezed,
    Object? enrolledCourseIds = freezed,
    Object? isOnProbation = freezed,
    Object? banReason = freezed,
    Object? banExpiry = freezed,
    Object? bannedBy = freezed,
    Object? lastActiveAt = freezed,
    Object? activityLog = freezed,
  }) {
    return _then(_$UsersModelImpl(
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuperAdmin: freezed == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHeadTeacher: freezed == isHeadTeacher
          ? _value.isHeadTeacher
          : isHeadTeacher // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedCourseIds: freezed == assignedCourseIds
          ? _value._assignedCourseIds
          : assignedCourseIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      canInviteTeachers: freezed == canInviteTeachers
          ? _value.canInviteTeachers
          : canInviteTeachers // ignore: cast_nullable_to_non_nullable
              as bool?,
      enrolledDepartmentId: freezed == enrolledDepartmentId
          ? _value.enrolledDepartmentId
          : enrolledDepartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      enrolledCourseIds: freezed == enrolledCourseIds
          ? _value._enrolledCourseIds
          : enrolledCourseIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isOnProbation: freezed == isOnProbation
          ? _value.isOnProbation
          : isOnProbation // ignore: cast_nullable_to_non_nullable
              as bool?,
      banReason: freezed == banReason
          ? _value.banReason
          : banReason // ignore: cast_nullable_to_non_nullable
              as String?,
      banExpiry: freezed == banExpiry
          ? _value.banExpiry
          : banExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bannedBy: freezed == bannedBy
          ? _value.bannedBy
          : bannedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activityLog: freezed == activityLog
          ? _value._activityLog
          : activityLog // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersModelImpl extends _UsersModel {
  const _$UsersModelImpl(
      {required this.uid,
      required this.email,
      required this.fullName,
      required this.role,
      required this.isActive,
      required this.createdAt,
      this.isEmailVerified,
      this.lastLogin,
      this.profileImage,
      this.phoneNumber,
      this.isSuperAdmin,
      this.isHeadTeacher,
      this.departmentId,
      final List<String>? assignedCourseIds,
      this.canInviteTeachers,
      this.enrolledDepartmentId,
      final List<String>? enrolledCourseIds,
      this.isOnProbation,
      this.banReason,
      this.banExpiry,
      this.bannedBy,
      this.lastActiveAt,
      final Map<String, dynamic>? activityLog})
      : _assignedCourseIds = assignedCourseIds,
        _enrolledCourseIds = enrolledCourseIds,
        _activityLog = activityLog,
        super._();

  factory _$UsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final UserRole role;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime? isEmailVerified;
  @override
  final DateTime? lastLogin;
// Common optional fields
  @override
  final String? profileImage;
  @override
  final String? phoneNumber;
// Admin specific fields
  @override
  final bool? isSuperAdmin;
// Teacher specific fields
  @override
  final bool? isHeadTeacher;
  @override
  final String? departmentId;
  final List<String>? _assignedCourseIds;
  @override
  List<String>? get assignedCourseIds {
    final value = _assignedCourseIds;
    if (value == null) return null;
    if (_assignedCourseIds is EqualUnmodifiableListView)
      return _assignedCourseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? canInviteTeachers;
// For head teachers
// Student specific fields
  @override
  final String? enrolledDepartmentId;
  final List<String>? _enrolledCourseIds;
  @override
  List<String>? get enrolledCourseIds {
    final value = _enrolledCourseIds;
    if (value == null) return null;
    if (_enrolledCourseIds is EqualUnmodifiableListView)
      return _enrolledCourseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isOnProbation;
// For academic status tracking
// Status tracking
  @override
  final String? banReason;
  @override
  final DateTime? banExpiry;
  @override
  final String? bannedBy;
  @override
  final DateTime? lastActiveAt;
  final Map<String, dynamic>? _activityLog;
  @override
  Map<String, dynamic>? get activityLog {
    final value = _activityLog;
    if (value == null) return null;
    if (_activityLog is EqualUnmodifiableMapView) return _activityLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UsersModel(uid: $uid, email: $email, fullName: $fullName, role: $role, isActive: $isActive, createdAt: $createdAt, isEmailVerified: $isEmailVerified, lastLogin: $lastLogin, profileImage: $profileImage, phoneNumber: $phoneNumber, isSuperAdmin: $isSuperAdmin, isHeadTeacher: $isHeadTeacher, departmentId: $departmentId, assignedCourseIds: $assignedCourseIds, canInviteTeachers: $canInviteTeachers, enrolledDepartmentId: $enrolledDepartmentId, enrolledCourseIds: $enrolledCourseIds, isOnProbation: $isOnProbation, banReason: $banReason, banExpiry: $banExpiry, bannedBy: $bannedBy, lastActiveAt: $lastActiveAt, activityLog: $activityLog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isSuperAdmin, isSuperAdmin) ||
                other.isSuperAdmin == isSuperAdmin) &&
            (identical(other.isHeadTeacher, isHeadTeacher) ||
                other.isHeadTeacher == isHeadTeacher) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            const DeepCollectionEquality()
                .equals(other._assignedCourseIds, _assignedCourseIds) &&
            (identical(other.canInviteTeachers, canInviteTeachers) ||
                other.canInviteTeachers == canInviteTeachers) &&
            (identical(other.enrolledDepartmentId, enrolledDepartmentId) ||
                other.enrolledDepartmentId == enrolledDepartmentId) &&
            const DeepCollectionEquality()
                .equals(other._enrolledCourseIds, _enrolledCourseIds) &&
            (identical(other.isOnProbation, isOnProbation) ||
                other.isOnProbation == isOnProbation) &&
            (identical(other.banReason, banReason) ||
                other.banReason == banReason) &&
            (identical(other.banExpiry, banExpiry) ||
                other.banExpiry == banExpiry) &&
            (identical(other.bannedBy, bannedBy) ||
                other.bannedBy == bannedBy) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            const DeepCollectionEquality()
                .equals(other._activityLog, _activityLog));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uid,
        email,
        fullName,
        role,
        isActive,
        createdAt,
        isEmailVerified,
        lastLogin,
        profileImage,
        phoneNumber,
        isSuperAdmin,
        isHeadTeacher,
        departmentId,
        const DeepCollectionEquality().hash(_assignedCourseIds),
        canInviteTeachers,
        enrolledDepartmentId,
        const DeepCollectionEquality().hash(_enrolledCourseIds),
        isOnProbation,
        banReason,
        banExpiry,
        bannedBy,
        lastActiveAt,
        const DeepCollectionEquality().hash(_activityLog)
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

abstract class _UsersModel extends UsersModel {
  const factory _UsersModel(
      {required final String uid,
      required final String email,
      required final String fullName,
      required final UserRole role,
      required final bool isActive,
      required final DateTime createdAt,
      final DateTime? isEmailVerified,
      final DateTime? lastLogin,
      final String? profileImage,
      final String? phoneNumber,
      final bool? isSuperAdmin,
      final bool? isHeadTeacher,
      final String? departmentId,
      final List<String>? assignedCourseIds,
      final bool? canInviteTeachers,
      final String? enrolledDepartmentId,
      final List<String>? enrolledCourseIds,
      final bool? isOnProbation,
      final String? banReason,
      final DateTime? banExpiry,
      final String? bannedBy,
      final DateTime? lastActiveAt,
      final Map<String, dynamic>? activityLog}) = _$UsersModelImpl;
  const _UsersModel._() : super._();

  factory _UsersModel.fromJson(Map<String, dynamic> json) =
      _$UsersModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get fullName;
  @override
  UserRole get role;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime? get isEmailVerified;
  @override
  DateTime? get lastLogin; // Common optional fields
  @override
  String? get profileImage;
  @override
  String? get phoneNumber; // Admin specific fields
  @override
  bool? get isSuperAdmin; // Teacher specific fields
  @override
  bool? get isHeadTeacher;
  @override
  String? get departmentId;
  @override
  List<String>? get assignedCourseIds;
  @override
  bool? get canInviteTeachers; // For head teachers
// Student specific fields
  @override
  String? get enrolledDepartmentId;
  @override
  List<String>? get enrolledCourseIds;
  @override
  bool? get isOnProbation; // For academic status tracking
// Status tracking
  @override
  String? get banReason;
  @override
  DateTime? get banExpiry;
  @override
  String? get bannedBy;
  @override
  DateTime? get lastActiveAt;
  @override
  Map<String, dynamic>? get activityLog;

  /// Create a copy of UsersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersModelImplCopyWith<_$UsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
