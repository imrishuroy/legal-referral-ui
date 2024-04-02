// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_license_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadLicenseReq _$UploadLicenseReqFromJson(Map<String, dynamic> json) =>
    UploadLicenseReq(
      userId: json['user_id'] as String,
      licensePdf: json['license_pdf'] as String,
    );

Map<String, dynamic> _$UploadLicenseReqToJson(UploadLicenseReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'license_pdf': instance.licensePdf,
    };
