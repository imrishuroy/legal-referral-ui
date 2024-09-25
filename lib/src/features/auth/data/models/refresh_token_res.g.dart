// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRes _$RefreshTokenResFromJson(Map<String, dynamic> json) =>
    RefreshTokenRes(
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as String,
      tokenType: json['token_type'] as String,
      refreshToken: json['refresh_token'] as String,
      idToken: json['id_token'] as String,
      userId: json['user_id'] as String,
      projectId: json['project_id'] as String,
    );

Map<String, dynamic> _$RefreshTokenResToJson(RefreshTokenRes instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'id_token': instance.idToken,
      'user_id': instance.userId,
      'project_id': instance.projectId,
    };
