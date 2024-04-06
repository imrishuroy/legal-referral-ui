// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpReq _$VerifyOtpReqFromJson(Map<String, dynamic> json) => VerifyOtpReq(
      to: json['to'] as String,
      otp: json['otp'] as String,
      channel: json['channel'] as String,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$VerifyOtpReqToJson(VerifyOtpReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'to': instance.to,
      'otp': instance.otp,
      'channel': instance.channel,
    };
