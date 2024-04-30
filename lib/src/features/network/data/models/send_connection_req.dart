import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_connection_req.g.dart';

@JsonSerializable()
class SendConnectionReq {
  SendConnectionReq({
    required this.senderId,
    required this.recipientId,
  });

  factory SendConnectionReq.fromJson(Map<String, dynamic> json) =>
      _$SendConnectionReqFromJson(json);

  @JsonKey(name: 'sender_id')
  final String senderId;
  @JsonKey(name: 'recipient_id')
  final String recipientId;

  Map<String, dynamic> toJson() => _$SendConnectionReqToJson(this);
}
