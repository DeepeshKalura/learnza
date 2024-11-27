// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) {
  return _MessagesModel.fromJson(json);
}

/// @nodoc
mixin _$MessagesModel {
  String get id => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  MessageStatus get status => throw _privateConstructorUsedError;
  List<String> get readBy => throw _privateConstructorUsedError;
  List<String> get deliveredTo => throw _privateConstructorUsedError;
  ReplyReference? get replyTo => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;

  /// Serializes this MessagesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagesModelCopyWith<MessagesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesModelCopyWith<$Res> {
  factory $MessagesModelCopyWith(
          MessagesModel value, $Res Function(MessagesModel) then) =
      _$MessagesModelCopyWithImpl<$Res, MessagesModel>;
  @useResult
  $Res call(
      {String id,
      String groupId,
      String senderId,
      String content,
      MessageType type,
      DateTime timestamp,
      MessageStatus status,
      List<String> readBy,
      List<String> deliveredTo,
      ReplyReference? replyTo,
      List<String> attachments});

  $ReplyReferenceCopyWith<$Res>? get replyTo;
}

/// @nodoc
class _$MessagesModelCopyWithImpl<$Res, $Val extends MessagesModel>
    implements $MessagesModelCopyWith<$Res> {
  _$MessagesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? timestamp = null,
    Object? status = null,
    Object? readBy = null,
    Object? deliveredTo = null,
    Object? replyTo = freezed,
    Object? attachments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
      readBy: null == readBy
          ? _value.readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deliveredTo: null == deliveredTo
          ? _value.deliveredTo
          : deliveredTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ReplyReference?,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReplyReferenceCopyWith<$Res>? get replyTo {
    if (_value.replyTo == null) {
      return null;
    }

    return $ReplyReferenceCopyWith<$Res>(_value.replyTo!, (value) {
      return _then(_value.copyWith(replyTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessagesModelImplCopyWith<$Res>
    implements $MessagesModelCopyWith<$Res> {
  factory _$$MessagesModelImplCopyWith(
          _$MessagesModelImpl value, $Res Function(_$MessagesModelImpl) then) =
      __$$MessagesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String groupId,
      String senderId,
      String content,
      MessageType type,
      DateTime timestamp,
      MessageStatus status,
      List<String> readBy,
      List<String> deliveredTo,
      ReplyReference? replyTo,
      List<String> attachments});

  @override
  $ReplyReferenceCopyWith<$Res>? get replyTo;
}

/// @nodoc
class __$$MessagesModelImplCopyWithImpl<$Res>
    extends _$MessagesModelCopyWithImpl<$Res, _$MessagesModelImpl>
    implements _$$MessagesModelImplCopyWith<$Res> {
  __$$MessagesModelImplCopyWithImpl(
      _$MessagesModelImpl _value, $Res Function(_$MessagesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? timestamp = null,
    Object? status = null,
    Object? readBy = null,
    Object? deliveredTo = null,
    Object? replyTo = freezed,
    Object? attachments = null,
  }) {
    return _then(_$MessagesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
      readBy: null == readBy
          ? _value._readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deliveredTo: null == deliveredTo
          ? _value._deliveredTo
          : deliveredTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ReplyReference?,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessagesModelImpl implements _MessagesModel {
  const _$MessagesModelImpl(
      {required this.id,
      required this.groupId,
      required this.senderId,
      required this.content,
      this.type = MessageType.text,
      required this.timestamp,
      this.status = MessageStatus.sent,
      final List<String> readBy = const [],
      final List<String> deliveredTo = const [],
      this.replyTo,
      final List<String> attachments = const []})
      : _readBy = readBy,
        _deliveredTo = deliveredTo,
        _attachments = attachments;

  factory _$MessagesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessagesModelImplFromJson(json);

  @override
  final String id;
  @override
  final String groupId;
  @override
  final String senderId;
  @override
  final String content;
  @override
  @JsonKey()
  final MessageType type;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageStatus status;
  final List<String> _readBy;
  @override
  @JsonKey()
  List<String> get readBy {
    if (_readBy is EqualUnmodifiableListView) return _readBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBy);
  }

  final List<String> _deliveredTo;
  @override
  @JsonKey()
  List<String> get deliveredTo {
    if (_deliveredTo is EqualUnmodifiableListView) return _deliveredTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveredTo);
  }

  @override
  final ReplyReference? replyTo;
  final List<String> _attachments;
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'MessagesModel(id: $id, groupId: $groupId, senderId: $senderId, content: $content, type: $type, timestamp: $timestamp, status: $status, readBy: $readBy, deliveredTo: $deliveredTo, replyTo: $replyTo, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._readBy, _readBy) &&
            const DeepCollectionEquality()
                .equals(other._deliveredTo, _deliveredTo) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupId,
      senderId,
      content,
      type,
      timestamp,
      status,
      const DeepCollectionEquality().hash(_readBy),
      const DeepCollectionEquality().hash(_deliveredTo),
      replyTo,
      const DeepCollectionEquality().hash(_attachments));

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesModelImplCopyWith<_$MessagesModelImpl> get copyWith =>
      __$$MessagesModelImplCopyWithImpl<_$MessagesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessagesModelImplToJson(
      this,
    );
  }
}

abstract class _MessagesModel implements MessagesModel {
  const factory _MessagesModel(
      {required final String id,
      required final String groupId,
      required final String senderId,
      required final String content,
      final MessageType type,
      required final DateTime timestamp,
      final MessageStatus status,
      final List<String> readBy,
      final List<String> deliveredTo,
      final ReplyReference? replyTo,
      final List<String> attachments}) = _$MessagesModelImpl;

  factory _MessagesModel.fromJson(Map<String, dynamic> json) =
      _$MessagesModelImpl.fromJson;

  @override
  String get id;
  @override
  String get groupId;
  @override
  String get senderId;
  @override
  String get content;
  @override
  MessageType get type;
  @override
  DateTime get timestamp;
  @override
  MessageStatus get status;
  @override
  List<String> get readBy;
  @override
  List<String> get deliveredTo;
  @override
  ReplyReference? get replyTo;
  @override
  List<String> get attachments;

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagesModelImplCopyWith<_$MessagesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReplyReference _$ReplyReferenceFromJson(Map<String, dynamic> json) {
  return _ReplyReference.fromJson(json);
}

/// @nodoc
mixin _$ReplyReference {
  String get messageId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;

  /// Serializes this ReplyReference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReplyReferenceCopyWith<ReplyReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyReferenceCopyWith<$Res> {
  factory $ReplyReferenceCopyWith(
          ReplyReference value, $Res Function(ReplyReference) then) =
      _$ReplyReferenceCopyWithImpl<$Res, ReplyReference>;
  @useResult
  $Res call({String messageId, String content, String senderId});
}

/// @nodoc
class _$ReplyReferenceCopyWithImpl<$Res, $Val extends ReplyReference>
    implements $ReplyReferenceCopyWith<$Res> {
  _$ReplyReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? content = null,
    Object? senderId = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReplyReferenceImplCopyWith<$Res>
    implements $ReplyReferenceCopyWith<$Res> {
  factory _$$ReplyReferenceImplCopyWith(_$ReplyReferenceImpl value,
          $Res Function(_$ReplyReferenceImpl) then) =
      __$$ReplyReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String messageId, String content, String senderId});
}

/// @nodoc
class __$$ReplyReferenceImplCopyWithImpl<$Res>
    extends _$ReplyReferenceCopyWithImpl<$Res, _$ReplyReferenceImpl>
    implements _$$ReplyReferenceImplCopyWith<$Res> {
  __$$ReplyReferenceImplCopyWithImpl(
      _$ReplyReferenceImpl _value, $Res Function(_$ReplyReferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? content = null,
    Object? senderId = null,
  }) {
    return _then(_$ReplyReferenceImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReplyReferenceImpl implements _ReplyReference {
  const _$ReplyReferenceImpl(
      {required this.messageId, required this.content, required this.senderId});

  factory _$ReplyReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplyReferenceImplFromJson(json);

  @override
  final String messageId;
  @override
  final String content;
  @override
  final String senderId;

  @override
  String toString() {
    return 'ReplyReference(messageId: $messageId, content: $content, senderId: $senderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyReferenceImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, content, senderId);

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyReferenceImplCopyWith<_$ReplyReferenceImpl> get copyWith =>
      __$$ReplyReferenceImplCopyWithImpl<_$ReplyReferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplyReferenceImplToJson(
      this,
    );
  }
}

abstract class _ReplyReference implements ReplyReference {
  const factory _ReplyReference(
      {required final String messageId,
      required final String content,
      required final String senderId}) = _$ReplyReferenceImpl;

  factory _ReplyReference.fromJson(Map<String, dynamic> json) =
      _$ReplyReferenceImpl.fromJson;

  @override
  String get messageId;
  @override
  String get content;
  @override
  String get senderId;

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplyReferenceImplCopyWith<_$ReplyReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
