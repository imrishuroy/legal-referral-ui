// {
// "type": "message",
// "sender": "user2",
// "recipient": "user1",
// "content": "How are you",
// "id": "room1"
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String type,
    required String sender,
    required String recipient,
    required String content,
    required String id,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
