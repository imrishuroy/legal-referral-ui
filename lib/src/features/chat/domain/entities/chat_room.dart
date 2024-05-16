import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'user1_id') required String user1Id,
    @JsonKey(name: 'user2_id') required String user2Id,
    @JsonKey(
      name: 'user2_first_name',
      includeToJson: false,
    )
    String? user2FirstName,
    @JsonKey(
      name: 'user2_last_name',
      includeToJson: false,
    )
    String? user2LastName,
    @JsonKey(
      name: 'user2_avatar_url',
      includeToJson: false,
    )
    String? user2AvatarUrl,
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
