// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_image_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadProfileImageReq _$UploadProfileImageReqFromJson(
        Map<String, dynamic> json) =>
    UploadProfileImageReq(
      userId: json['user_id'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$UploadProfileImageReqToJson(
        UploadProfileImageReq instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
    };
