// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award_project_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwardProjectReq _$AwardProjectReqFromJson(Map<String, dynamic> json) =>
    AwardProjectReq(
      projectId: (json['project_id'] as num).toInt(),
      referredUserId: json['referred_user_id'] as String,
    );

Map<String, dynamic> _$AwardProjectReqToJson(AwardProjectReq instance) =>
    <String, dynamic>{
      'project_id': instance.projectId,
      'referred_user_id': instance.referredUserId,
    };
