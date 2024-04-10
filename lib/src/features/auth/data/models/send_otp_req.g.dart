// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpReq _$SendOtpReqFromJson(Map<String, dynamic> json) => SendOtpReq(
      to: json['to'] as String,
      channel: json['channel'] as String,
    );

Map<String, dynamic> _$SendOtpReqToJson(SendOtpReq instance) =>
    <String, dynamic>{
      'to': instance.to,
      'channel': instance.channel,
    };
