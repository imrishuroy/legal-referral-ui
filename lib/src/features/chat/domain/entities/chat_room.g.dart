// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomImpl(
      roomId: json['room_id'] as String,
      user1Id: json['user1_id'] as String,
      user2Id: json['user2_id'] as String,
      user2FirstName: json['user2_first_name'] as String?,
      user2LastName: json['user2_last_name'] as String?,
      user2AvatarUrl: json['user2_avatar_url'] as String?,
      lastMessage: json['last_message'] as String?,
      lastMessageAt: _$JsonConverterFromJson<String, DateTime>(
          json['last_message_at'], const DateTimeJsonConverter().fromJson),
      unreadMessages: (json['unread_messages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'user1_id': instance.user1Id,
      'user2_id': instance.user2Id,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
