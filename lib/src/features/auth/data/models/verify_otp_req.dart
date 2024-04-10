import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_req.g.dart';

@JsonSerializable()
class VerifyOtpReq {
  VerifyOtpReq({
    required this.to,
    required this.otp,
    required this.channel,
    this.userId,
  });

  factory VerifyOtpReq.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String? userId;
  final String to;
  final String otp;
  final String channel;

  Map<String, dynamic> toJson() => _$VerifyOtpReqToJson(this);
}
