// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailOtpReq _$VerifyEmailOtpReqFromJson(Map<String, dynamic> json) =>
    VerifyEmailOtpReq(
      sessionId: json['session_id'] as int,
      email: json['email'] as String,
      channel: json['channel'] as String,
      otp: json['otp'] as int,
    );

Map<String, dynamic> _$VerifyEmailOtpReqToJson(VerifyEmailOtpReq instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'email': instance.email,
      'channel': instance.channel,
      'otp': instance.otp,
    };
