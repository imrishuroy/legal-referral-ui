// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateReferral _$CreateReferralFromJson(Map<String, dynamic> json) =>
    _CreateReferral(
      title: json['title'] as String,
      caseDescription: json['case_description'] as String,
      practiceArea: json['preferred_practice_area'] as String,
      practiceLocation: json['preferred_practice_location'] as String,
      referrerUserId: json['referrer_user_id'] as String,
      referredUserIds: (json['referred_user_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateReferralToJson(_CreateReferral instance) =>
    <String, dynamic>{
      'title': instance.title,
      'case_description': instance.caseDescription,
      'preferred_practice_area': instance.practiceArea,
      'preferred_practice_location': instance.practiceLocation,
      'referrer_user_id': instance.referrerUserId,
      'referred_user_ids': instance.referredUserIds,
    };
