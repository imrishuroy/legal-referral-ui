import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_otp_req.g.dart';

@JsonSerializable()
class SendEmailOtpReq {
  SendEmailOtpReq({
    required this.email,
    required this.channel,
  });

  factory SendEmailOtpReq.fromJson(Map<String, dynamic> json) =>
      _$SendEmailOtpReqFromJson(json);

  final String email;
  final String channel;

  Map<String, dynamic> toJson() => _$SendEmailOtpReqToJson(this);
}
