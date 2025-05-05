// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessengerModelImpl _$$MessengerModelImplFromJson(Map<String, dynamic> json) =>
    _$MessengerModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      groupId: json['groupId'] as String?,
      lastseen: DateTime.parse(json['lastseen'] as String),
    );

Map<String, dynamic> _$$MessengerModelImplToJson(
        _$MessengerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'groupId': instance.groupId,
      'lastseen': instance.lastseen.toIso8601String(),
    };
