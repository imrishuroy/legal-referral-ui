// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => _ChatRoom(
      roomId: json['room_id'] as String,
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      lastMessage: json['last_message'] as String?,
      lastMessageAt: _$JsonConverterFromJson<String, DateTime>(
          json['last_message_sent_at'], const DateTimeJsonConverter().fromJson),
      unreadMessages: (json['unread_messages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChatRoomToJson(_ChatRoom instance) => <String, dynamic>{
      'room_id': instance.roomId,
      'user_id': instance.userId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
