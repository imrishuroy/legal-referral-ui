// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_mobile_otp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyMobileOtpReq _$VerifyMobileOtpReqFromJson(Map<String, dynamic> json) =>
    VerifyMobileOtpReq(
      userId: json['user_id'] as String,
      mobile: json['mobile'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyMobileOtpReqToJson(VerifyMobileOtpReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'mobile': instance.mobile,
      'otp': instance.otp,
    };
