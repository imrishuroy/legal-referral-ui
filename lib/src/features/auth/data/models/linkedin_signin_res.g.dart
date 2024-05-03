// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linkedin_signin_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkedinSignInRes _$LinkedinSignInResFromJson(Map<String, dynamic> json) =>
    LinkedinSignInRes(
      userId: json['user_id'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LinkedinSignInResToJson(LinkedinSignInRes instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'token': instance.token,
    };
