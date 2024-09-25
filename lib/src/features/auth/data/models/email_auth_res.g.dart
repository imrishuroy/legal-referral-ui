// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_auth_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailAuthRes _$EmailAuthResFromJson(Map<String, dynamic> json) => EmailAuthRes(
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      idToken: json['id_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: json['expires_in'] as String,
    );

Map<String, dynamic> _$EmailAuthResToJson(EmailAuthRes instance) =>
    <String, dynamic>{
      'user': instance.user,
      'id_token': instance.idToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
    };
