// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      sessionId: json['session_id'] as int?,
      appUser: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'user': instance.appUser,
    };
