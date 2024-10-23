import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum NotificationType {
  @JsonValue('like')
  like,
  @JsonValue('comment')
  comment,
  @JsonValue('share')
  other,
}

@JsonEnum(fieldRename: FieldRename.snake)
enum TargetType {
  @JsonValue('post')
  post,
  @JsonValue('comment')
  comment,
  @JsonValue('share')
  share,
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    @JsonKey(name: 'notification_id') required int notificationId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'target_id') required int targetId,
    @JsonKey(name: 'target_type') required TargetType targetType,
    @JsonKey(name: 'notification_type') required NotificationType type,
    required String message,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'sender_first_name') required String? senderFirstName,
    @JsonKey(name: 'sender_last_name') required String senderLastName,
    @JsonKey(name: 'sender_avatar_url') required String? senderAvatarUrl,
    @JsonKey(name: 'created_at')
    @DateTimeJsonConverter()
    required DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
