import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_mobile_otp_req.g.dart';

@JsonSerializable()
class VerifyMobileOtpReq {
  VerifyMobileOtpReq({
    required this.mobile,
    required this.otp,
  });

  factory VerifyMobileOtpReq.fromJson(Map<String, dynamic> json) =>
      _$VerifyMobileOtpReqFromJson(json);

  final String mobile;
  final String otp;

  Map<String, dynamic> toJson() => _$VerifyMobileOtpReqToJson(this);
}
