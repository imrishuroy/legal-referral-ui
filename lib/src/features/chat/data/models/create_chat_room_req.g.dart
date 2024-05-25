// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_room_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatRoomReq _$CreateChatRoomReqFromJson(Map<String, dynamic> json) =>
    CreateChatRoomReq(
      roomId: json['room_id'] as String,
      user1Id: json['user1_id'] as String,
      user2Id: json['user2_id'] as String,
    );

Map<String, dynamic> _$CreateChatRoomReqToJson(CreateChatRoomReq instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'user1_id': instance.user1Id,
      'user2_id': instance.user2Id,
    };
