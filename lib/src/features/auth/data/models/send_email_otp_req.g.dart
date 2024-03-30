// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_otp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailOtpReq _$SendEmailOtpReqFromJson(Map<String, dynamic> json) =>
    SendEmailOtpReq(
      email: json['email'] as String,
      channel: json['channel'] as String,
    );

Map<String, dynamic> _$SendEmailOtpReqToJson(SendEmailOtpReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'channel': instance.channel,
    };
