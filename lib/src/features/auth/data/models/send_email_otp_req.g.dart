// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_otp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailOtpReq _$SendEmailOtpReqFromJson(Map<String, dynamic> json) =>
    SendEmailOtpReq(
      userId: json['user_id'] as String,
      channel: json['channel'] as String,
    );

Map<String, dynamic> _$SendEmailOtpReqToJson(SendEmailOtpReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'channel': instance.channel,
    };
