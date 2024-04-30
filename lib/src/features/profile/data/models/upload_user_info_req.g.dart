// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_user_info_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadUserInfoReq _$UploadUserInfoReqFromJson(Map<String, dynamic> json) =>
    UploadUserInfoReq(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      averageBillingPerClient:
          (json['average_billing_per_client'] as num).toInt(),
      caseResolutionRate: (json['case_resolution_rate'] as num).toInt(),
      about: json['about'] as String,
    );

Map<String, dynamic> _$UploadUserInfoReqToJson(UploadUserInfoReq instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'average_billing_per_client': instance.averageBillingPerClient,
      'case_resolution_rate': instance.caseResolutionRate,
      'about': instance.about,
    };
