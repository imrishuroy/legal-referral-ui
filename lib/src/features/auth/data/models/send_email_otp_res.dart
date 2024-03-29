import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_otp_res.g.dart';

@JsonSerializable()
class SendEmailOtpRes {
  SendEmailOtpRes({
    required this.sessionId,
  });

  factory SendEmailOtpRes.fromJson(Map<String, dynamic> json) =>
      _$SendEmailOtpResFromJson(json);

  @JsonKey(name: 'session_id')
  final int sessionId;

  Map<String, dynamic> toJson() => _$SendEmailOtpResToJson(this);
}
