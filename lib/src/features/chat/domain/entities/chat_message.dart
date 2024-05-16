import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'recipient_id') required String recipientId,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'parent_message_id') int? parentMessageId,
    @Default(false) @JsonKey(name: 'has_attachment') bool hasAttachment,
    @JsonKey(name: 'attachment_id', includeToJson: false) int? attachmentId,
    @Default(false)
    @JsonKey(
      name: 'is_read',
      includeToJson: false,
    )
    bool isRead,
    @JsonKey(name: 'sent_at') @DateTimeJsonConverter() DateTime? sentAt,
    @JsonKey(name: 'message_id', includeToJson: false) int? messageId,
    @JsonKey(
      name: 'replied_message',
      includeToJson: false,
    )
    ChatMessage? repliedMessage,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
