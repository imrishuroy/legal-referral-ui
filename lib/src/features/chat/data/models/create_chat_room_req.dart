import 'package:json_annotation/json_annotation.dart';

part 'create_chat_room_req.g.dart';

@JsonSerializable()
class CreateChatRoomReq {
  CreateChatRoomReq({
    required this.roomId,
    required this.user1Id,
    required this.user2Id,
  });

  factory CreateChatRoomReq.fromJson(Map<String, dynamic> json) =>
      _$CreateChatRoomReqFromJson(json);

  @JsonKey(name: 'room_id')
  final String roomId;

  @JsonKey(name: 'user1_id')
  final String user1Id;

  @JsonKey(name: 'user2_id')
  final String user2Id;

  Map<String, dynamic> toJson() => _$CreateChatRoomReqToJson(this);
}
