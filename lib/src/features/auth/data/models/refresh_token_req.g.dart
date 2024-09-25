// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenReq _$RefreshTokenReqFromJson(Map<String, dynamic> json) =>
    RefreshTokenReq(
      refreshToken: json['refresh_token'] as String,
      grantType: json['grant_type'] as String,
    );

Map<String, dynamic> _$RefreshTokenReqToJson(RefreshTokenReq instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
      'grant_type': instance.grantType,
    };
