// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessagesModel {
  String get id;
  String? get groupId;
  String? get receiverId;
  String get senderId;
  String get content;
  MessageType get type;
  DateTime get timestamp;
  MessageStatus get status;
  List<String> get readBy;
  List<String> get deliveredTo;
  ReplyReference? get replyTo;
  List<String> get attachments;
  String? get attachmentFileName;
  int? get attachmentFileSize;
  String? get chatRoomId;

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessagesModelCopyWith<MessagesModel> get copyWith =>
      _$MessagesModelCopyWithImpl<MessagesModel>(
          this as MessagesModel, _$identity);

  /// Serializes this MessagesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessagesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.readBy, readBy) &&
            const DeepCollectionEquality()
                .equals(other.deliveredTo, deliveredTo) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.attachmentFileName, attachmentFileName) ||
                other.attachmentFileName == attachmentFileName) &&
            (identical(other.attachmentFileSize, attachmentFileSize) ||
                other.attachmentFileSize == attachmentFileSize) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupId,
      receiverId,
      senderId,
      content,
      type,
      timestamp,
      status,
      const DeepCollectionEquality().hash(readBy),
      const DeepCollectionEquality().hash(deliveredTo),
      replyTo,
      const DeepCollectionEquality().hash(attachments),
      attachmentFileName,
      attachmentFileSize,
      chatRoomId);

  @override
  String toString() {
    return 'MessagesModel(id: $id, groupId: $groupId, receiverId: $receiverId, senderId: $senderId, content: $content, type: $type, timestamp: $timestamp, status: $status, readBy: $readBy, deliveredTo: $deliveredTo, replyTo: $replyTo, attachments: $attachments, attachmentFileName: $attachmentFileName, attachmentFileSize: $attachmentFileSize, chatRoomId: $chatRoomId)';
  }
}

/// @nodoc
abstract mixin class $MessagesModelCopyWith<$Res> {
  factory $MessagesModelCopyWith(
          MessagesModel value, $Res Function(MessagesModel) _then) =
      _$MessagesModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? groupId,
      String? receiverId,
      String senderId,
      String content,
      MessageType type,
      DateTime timestamp,
      MessageStatus status,
      List<String> readBy,
      List<String> deliveredTo,
      ReplyReference? replyTo,
      List<String> attachments,
      String? attachmentFileName,
      int? attachmentFileSize,
      String? chatRoomId});

  $ReplyReferenceCopyWith<$Res>? get replyTo;
}

/// @nodoc
class _$MessagesModelCopyWithImpl<$Res>
    implements $MessagesModelCopyWith<$Res> {
  _$MessagesModelCopyWithImpl(this._self, this._then);

  final MessagesModel _self;
  final $Res Function(MessagesModel) _then;

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = freezed,
    Object? receiverId = freezed,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? timestamp = null,
    Object? status = null,
    Object? readBy = null,
    Object? deliveredTo = null,
    Object? replyTo = freezed,
    Object? attachments = null,
    Object? attachmentFileName = freezed,
    Object? attachmentFileSize = freezed,
    Object? chatRoomId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: freezed == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
      readBy: null == readBy
          ? _self.readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deliveredTo: null == deliveredTo
          ? _self.deliveredTo
          : deliveredTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replyTo: freezed == replyTo
          ? _self.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ReplyReference?,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachmentFileName: freezed == attachmentFileName
          ? _self.attachmentFileName
          : attachmentFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentFileSize: freezed == attachmentFileSize
          ? _self.attachmentFileSize
          : attachmentFileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      chatRoomId: freezed == chatRoomId
          ? _self.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReplyReferenceCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
      return null;
    }

    return $ReplyReferenceCopyWith<$Res>(_self.replyTo!, (value) {
      return _then(_self.copyWith(replyTo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MessagesModel implements MessagesModel {
  const _MessagesModel(
      {required this.id,
      this.groupId,
      this.receiverId,
      required this.senderId,
      required this.content,
      this.type = MessageType.text,
      required this.timestamp,
      this.status = MessageStatus.sent,
      final List<String> readBy = const [],
      final List<String> deliveredTo = const [],
      this.replyTo,
      final List<String> attachments = const [],
      this.attachmentFileName,
      this.attachmentFileSize,
      this.chatRoomId})
      : _readBy = readBy,
        _deliveredTo = deliveredTo,
        _attachments = attachments;
  factory _MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);

  @override
  final String id;
  @override
  final String? groupId;
  @override
  final String? receiverId;
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
  final String? attachmentFileName;
  @override
  final int? attachmentFileSize;
  @override
  final String? chatRoomId;

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessagesModelCopyWith<_MessagesModel> get copyWith =>
      __$MessagesModelCopyWithImpl<_MessagesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessagesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessagesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
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
                .equals(other._attachments, _attachments) &&
            (identical(other.attachmentFileName, attachmentFileName) ||
                other.attachmentFileName == attachmentFileName) &&
            (identical(other.attachmentFileSize, attachmentFileSize) ||
                other.attachmentFileSize == attachmentFileSize) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupId,
      receiverId,
      senderId,
      content,
      type,
      timestamp,
      status,
      const DeepCollectionEquality().hash(_readBy),
      const DeepCollectionEquality().hash(_deliveredTo),
      replyTo,
      const DeepCollectionEquality().hash(_attachments),
      attachmentFileName,
      attachmentFileSize,
      chatRoomId);

  @override
  String toString() {
    return 'MessagesModel(id: $id, groupId: $groupId, receiverId: $receiverId, senderId: $senderId, content: $content, type: $type, timestamp: $timestamp, status: $status, readBy: $readBy, deliveredTo: $deliveredTo, replyTo: $replyTo, attachments: $attachments, attachmentFileName: $attachmentFileName, attachmentFileSize: $attachmentFileSize, chatRoomId: $chatRoomId)';
  }
}

/// @nodoc
abstract mixin class _$MessagesModelCopyWith<$Res>
    implements $MessagesModelCopyWith<$Res> {
  factory _$MessagesModelCopyWith(
          _MessagesModel value, $Res Function(_MessagesModel) _then) =
      __$MessagesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? groupId,
      String? receiverId,
      String senderId,
      String content,
      MessageType type,
      DateTime timestamp,
      MessageStatus status,
      List<String> readBy,
      List<String> deliveredTo,
      ReplyReference? replyTo,
      List<String> attachments,
      String? attachmentFileName,
      int? attachmentFileSize,
      String? chatRoomId});

  @override
  $ReplyReferenceCopyWith<$Res>? get replyTo;
}

/// @nodoc
class __$MessagesModelCopyWithImpl<$Res>
    implements _$MessagesModelCopyWith<$Res> {
  __$MessagesModelCopyWithImpl(this._self, this._then);

  final _MessagesModel _self;
  final $Res Function(_MessagesModel) _then;

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupId = freezed,
    Object? receiverId = freezed,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? timestamp = null,
    Object? status = null,
    Object? readBy = null,
    Object? deliveredTo = null,
    Object? replyTo = freezed,
    Object? attachments = null,
    Object? attachmentFileName = freezed,
    Object? attachmentFileSize = freezed,
    Object? chatRoomId = freezed,
  }) {
    return _then(_MessagesModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: freezed == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
      readBy: null == readBy
          ? _self._readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deliveredTo: null == deliveredTo
          ? _self._deliveredTo
          : deliveredTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replyTo: freezed == replyTo
          ? _self.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ReplyReference?,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachmentFileName: freezed == attachmentFileName
          ? _self.attachmentFileName
          : attachmentFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentFileSize: freezed == attachmentFileSize
          ? _self.attachmentFileSize
          : attachmentFileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      chatRoomId: freezed == chatRoomId
          ? _self.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of MessagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReplyReferenceCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
      return null;
    }

    return $ReplyReferenceCopyWith<$Res>(_self.replyTo!, (value) {
      return _then(_self.copyWith(replyTo: value));
    });
  }
}

/// @nodoc
mixin _$ReplyReference {
  String get messageId;
  String get content;
  String get senderId;

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReplyReferenceCopyWith<ReplyReference> get copyWith =>
      _$ReplyReferenceCopyWithImpl<ReplyReference>(
          this as ReplyReference, _$identity);

  /// Serializes this ReplyReference to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReplyReference &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, content, senderId);

  @override
  String toString() {
    return 'ReplyReference(messageId: $messageId, content: $content, senderId: $senderId)';
  }
}

/// @nodoc
abstract mixin class $ReplyReferenceCopyWith<$Res> {
  factory $ReplyReferenceCopyWith(
          ReplyReference value, $Res Function(ReplyReference) _then) =
      _$ReplyReferenceCopyWithImpl;
  @useResult
  $Res call({String messageId, String content, String senderId});
}

/// @nodoc
class _$ReplyReferenceCopyWithImpl<$Res>
    implements $ReplyReferenceCopyWith<$Res> {
  _$ReplyReferenceCopyWithImpl(this._self, this._then);

  final ReplyReference _self;
  final $Res Function(ReplyReference) _then;

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? content = null,
    Object? senderId = null,
  }) {
    return _then(_self.copyWith(
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReplyReference implements ReplyReference {
  const _ReplyReference(
      {required this.messageId, required this.content, required this.senderId});
  factory _ReplyReference.fromJson(Map<String, dynamic> json) =>
      _$ReplyReferenceFromJson(json);

  @override
  final String messageId;
  @override
  final String content;
  @override
  final String senderId;

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReplyReferenceCopyWith<_ReplyReference> get copyWith =>
      __$ReplyReferenceCopyWithImpl<_ReplyReference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReplyReferenceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReplyReference &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, content, senderId);

  @override
  String toString() {
    return 'ReplyReference(messageId: $messageId, content: $content, senderId: $senderId)';
  }
}

/// @nodoc
abstract mixin class _$ReplyReferenceCopyWith<$Res>
    implements $ReplyReferenceCopyWith<$Res> {
  factory _$ReplyReferenceCopyWith(
          _ReplyReference value, $Res Function(_ReplyReference) _then) =
      __$ReplyReferenceCopyWithImpl;
  @override
  @useResult
  $Res call({String messageId, String content, String senderId});
}

/// @nodoc
class __$ReplyReferenceCopyWithImpl<$Res>
    implements _$ReplyReferenceCopyWith<$Res> {
  __$ReplyReferenceCopyWithImpl(this._self, this._then);

  final _ReplyReference _self;
  final $Res Function(_ReplyReference) _then;

  /// Create a copy of ReplyReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageId = null,
    Object? content = null,
    Object? senderId = null,
  }) {
    return _then(_ReplyReference(
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
