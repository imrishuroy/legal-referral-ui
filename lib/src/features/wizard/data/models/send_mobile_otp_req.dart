import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_mobile_otp_req.g.dart';

@JsonSerializable()
class SendMobileOtpReq {
  SendMobileOtpReq({
    required this.mobile,
  });

  factory SendMobileOtpReq.fromJson(Map<String, dynamic> json) =>
      _$SendMobileOtpReqFromJson(json);

  final String mobile;

  Map<String, dynamic> toJson() => _$SendMobileOtpReqToJson(this);
}
