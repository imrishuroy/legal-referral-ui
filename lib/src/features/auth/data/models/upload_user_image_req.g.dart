// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_user_image_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadUserImageReq _$UploadUserImageReqFromJson(Map<String, dynamic> json) =>
    UploadUserImageReq(
      userId: json['user_id'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$UploadUserImageReqToJson(UploadUserImageReq instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
    };
