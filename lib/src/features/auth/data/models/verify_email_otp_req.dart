import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_otp_req.g.dart';

@JsonSerializable()
class VerifyEmailOtpReq {
  VerifyEmailOtpReq({
    required this.sessionId,
    required this.userId,
    required this.channel,
    required this.otp,
  });

  factory VerifyEmailOtpReq.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpReqFromJson(json);

  @JsonKey(name: 'session_id')
  final int sessionId;
  @JsonKey(name: 'user_id')
  final String userId;
  final String channel;
  final int otp;

  Map<String, dynamic> toJson() => _$VerifyEmailOtpReqToJson(this);
}
