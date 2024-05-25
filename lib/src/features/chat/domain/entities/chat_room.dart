import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(
      name: 'first_name',
      includeToJson: false,
    )
    String? firstName,
    @JsonKey(
      name: 'last_name',
      includeToJson: false,
    )
    String? lastName,
    @JsonKey(
      name: 'avatar_url',
      includeToJson: false,
    )
    String? avatarUrl,
    @JsonKey(
      name: 'last_message',
      includeToJson: false,
    )
    String? lastMessage,
    @JsonKey(
      name: 'last_message_sent_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    DateTime? lastMessageAt,
    @JsonKey(
      name: 'unread_messages',
      defaultValue: 0,
      includeToJson: false,
    )
    int? unreadMessages,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);
}
