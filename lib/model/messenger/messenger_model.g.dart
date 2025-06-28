// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessengerModel _$MessengerModelFromJson(Map<String, dynamic> json) =>
    _MessengerModel(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      groupId: json['groupId'] as String?,
      lastseen: DateTime.parse(json['lastseen'] as String),
    );

Map<String, dynamic> _$MessengerModelToJson(_MessengerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'groupId': instance.groupId,
      'lastseen': instance.lastseen.toIso8601String(),
    };
