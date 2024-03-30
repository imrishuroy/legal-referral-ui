import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_mobile_otp_req.g.dart';

@JsonSerializable()
class VerifyMobileOtpReq {
  VerifyMobileOtpReq({
    required this.userId,
    required this.mobile,
    required this.otp,
  });

  factory VerifyMobileOtpReq.fromJson(Map<String, dynamic> json) =>
      _$VerifyMobileOtpReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  final String mobile;
  final String otp;

  Map<String, dynamic> toJson() => _$VerifyMobileOtpReqToJson(this);
}
