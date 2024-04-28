// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_connection_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendConnectionReq _$SendConnectionReqFromJson(Map<String, dynamic> json) =>
    SendConnectionReq(
      senderId: json['sender_id'] as String,
      recipientId: json['recipient_id'] as String,
    );

Map<String, dynamic> _$SendConnectionReqToJson(SendConnectionReq instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'recipient_id': instance.recipientId,
    };
