// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordReq _$ResetPasswordReqFromJson(Map<String, dynamic> json) =>
    ResetPasswordReq(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$ResetPasswordReqToJson(ResetPasswordReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
