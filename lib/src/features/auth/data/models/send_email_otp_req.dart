import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_otp_req.g.dart';

@JsonSerializable()
class SendEmailOtpReq {
  SendEmailOtpReq({
    required this.userId,
    required this.channel,
  });

  factory SendEmailOtpReq.fromJson(Map<String, dynamic> json) =>
      _$SendEmailOtpReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  final String channel;

  Map<String, dynamic> toJson() => _$SendEmailOtpReqToJson(this);
}
