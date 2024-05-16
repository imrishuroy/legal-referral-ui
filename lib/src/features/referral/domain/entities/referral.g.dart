// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralImpl _$$ReferralImplFromJson(Map<String, dynamic> json) =>
    _$ReferralImpl(
      title: json['title'] as String,
      caseDescription: json['case_description'] as String,
      practiceArea: json['preferred_practice_area'] as String?,
      practiceLocation: json['preferred_practice_location'] as String?,
      referredUserId: json['referred_user_id'] as String?,
      referrerUserId: json['referrer_user_id'] as String?,
      referralId: (json['referral_id'] as num?)?.toInt(),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeJsonConverter().fromJson),
    );

Map<String, dynamic> _$$ReferralImplToJson(_$ReferralImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'case_description': instance.caseDescription,
      'preferred_practice_area': instance.practiceArea,
      'preferred_practice_location': instance.practiceLocation,
      'referred_user_id': instance.referredUserId,
      'referrer_user_id': instance.referrerUserId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
