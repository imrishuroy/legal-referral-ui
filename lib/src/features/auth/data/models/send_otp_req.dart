import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_req.g.dart';

@JsonSerializable()
class SendOtpReq {
  SendOtpReq({
    required this.to,
    required this.channel,
  });

  factory SendOtpReq.fromJson(Map<String, dynamic> json) =>
      _$SendOtpReqFromJson(json);

  final String to;
  final String channel;

  Map<String, dynamic> toJson() => _$SendOtpReqToJson(this);
}
