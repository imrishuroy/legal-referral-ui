// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      notificationId: (json['notification_id'] as num).toInt(),
      userId: json['user_id'] as String,
      targetId: (json['target_id'] as num).toInt(),
      targetType: $enumDecode(_$TargetTypeEnumMap, json['target_type']),
      type: $enumDecode(_$NotificationTypeEnumMap, json['notification_type']),
      message: json['message'] as String,
      isRead: json['is_read'] as bool,
      senderId: json['sender_id'] as String,
      senderFirstName: json['sender_first_name'] as String?,
      senderLastName: json['sender_last_name'] as String,
      senderAvatarUrl: json['sender_avatar_url'] as String?,
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'user_id': instance.userId,
      'target_id': instance.targetId,
      'target_type': _$TargetTypeEnumMap[instance.targetType]!,
      'notification_type': _$NotificationTypeEnumMap[instance.type]!,
      'message': instance.message,
      'is_read': instance.isRead,
      'sender_id': instance.senderId,
      'sender_first_name': instance.senderFirstName,
      'sender_last_name': instance.senderLastName,
      'sender_avatar_url': instance.senderAvatarUrl,
      'created_at': const DateTimeJsonConverter().toJson(instance.createdAt),
    };

const _$TargetTypeEnumMap = {
  TargetType.post: 'post',
  TargetType.comment: 'comment',
  TargetType.share: 'share',
};

const _$NotificationTypeEnumMap = {
  NotificationType.like: 'like',
  NotificationType.comment: 'comment',
  NotificationType.other: 'share',
};
