// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      senderId: json['sender_id'] as String,
      recipientId: json['recipient_id'] as String,
      message: json['message'] as String,
      roomId: json['room_id'] as String,
      parentMessageId: (json['parent_message_id'] as num?)?.toInt(),
      hasAttachment: json['has_attachment'] as bool? ?? false,
      attachmentId: (json['attachment_id'] as num?)?.toInt(),
      isRead: json['is_read'] as bool? ?? false,
      sentAt: _$JsonConverterFromJson<String, DateTime>(
          json['sent_at'], const DateTimeJsonConverter().fromJson),
      messageId: (json['message_id'] as num?)?.toInt(),
      repliedMessage: json['replied_message'] == null
          ? null
          : ChatMessage.fromJson(
              json['replied_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'recipient_id': instance.recipientId,
      'message': instance.message,
      'room_id': instance.roomId,
      'parent_message_id': instance.parentMessageId,
      'has_attachment': instance.hasAttachment,
      'sent_at': _$JsonConverterToJson<String, DateTime>(
          instance.sentAt, const DateTimeJsonConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
