// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_signin_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailSignInReq _$EmailSignInReqFromJson(Map<String, dynamic> json) =>
    EmailSignInReq(
      email: json['email'] as String,
      password: json['password'] as String,
      returnSecureToken: json['returnSecureToken'] as bool? ?? true,
    );

Map<String, dynamic> _$EmailSignInReqToJson(EmailSignInReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'returnSecureToken': instance.returnSecureToken,
    };
