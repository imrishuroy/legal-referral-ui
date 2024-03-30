import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_otp_req.g.dart';

@JsonSerializable()
class VerifyEmailOtpReq {
  VerifyEmailOtpReq({
    required this.sessionId,
    required this.email,
    required this.channel,
    required this.otp,
  });

  factory VerifyEmailOtpReq.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpReqFromJson(json);

  @JsonKey(name: 'session_id')
  final int sessionId;
  final String email;
  final String channel;
  final int otp;

  Map<String, dynamic> toJson() => _$VerifyEmailOtpReqToJson(this);
}
