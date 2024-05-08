// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      type: json['type'] as String,
      sender: json['sender'] as String,
      recipient: json['recipient'] as String,
      content: json['content'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sender': instance.sender,
      'recipient': instance.recipient,
      'content': instance.content,
      'id': instance.id,
    };
