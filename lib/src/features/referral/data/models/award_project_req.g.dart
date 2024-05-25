// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award_project_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwardProjectReq _$AwardProjectReqFromJson(Map<String, dynamic> json) =>
    AwardProjectReq(
      referralId: (json['referral_id'] as num).toInt(),
      referredUserId: json['referred_user_id'] as String,
      referrerUserId: json['referrer_user_id'] as String,
    );

Map<String, dynamic> _$AwardProjectReqToJson(AwardProjectReq instance) =>
    <String, dynamic>{
      'referral_id': instance.referralId,
      'referred_user_id': instance.referredUserId,
      'referrer_user_id': instance.referrerUserId,
    };
