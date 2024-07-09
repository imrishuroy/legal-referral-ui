import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'discussion_message.freezed.dart';
part 'discussion_message.g.dart';

@freezed
class DiscussionMessage with _$DiscussionMessage {
  const factory DiscussionMessage({
    @JsonKey(
      name: 'sender_id',
    )
    required String senderId,
    @JsonKey(
      name: 'message',
    )
    required String message,
    @JsonKey(
      name: 'replied_message',
      includeIfNull: false,
    )
    required DiscussionMessage? repliedMessage,
    @JsonKey(
      name: 'discussion_id',
    )
    required int discussionId,
    @DateTimeJsonConverter()
    @JsonKey(
      name: 'sent_at',
      includeIfNull: false,
    )
    DateTime? sentAt,
    @JsonKey(
      name: 'parent_message_id',
      includeIfNull: false,
    )
    int? parentMessageId,
    @JsonKey(
      name: 'message_id',
      includeIfNull: false,
    )
    int? messageId,
    @JsonKey(
      name: 'sender_first_name',
      includeIfNull: false,
    )
    String? senderFirstName,
    @JsonKey(
      name: 'sender_last_name',
      includeIfNull: false,
    )
    String? senderLastName,
    @JsonKey(
      name: 'sender_avatar_image',
      includeIfNull: false,
    )
    String? senderAvatarImg,
  }) = _DiscussionMessage;

  factory DiscussionMessage.fromJson(Map<String, dynamic> json) =>
      _$DiscussionMessageFromJson(json);
}
