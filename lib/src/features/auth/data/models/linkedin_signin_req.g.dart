// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linkedin_signin_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkedinSignInReq _$LinkedinSignInReqFromJson(Map<String, dynamic> json) =>
    LinkedinSignInReq(
      email: json['email'] as String,
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$LinkedinSignInReqToJson(LinkedinSignInReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'access_token': instance.accessToken,
    };
