// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProposalImpl _$$ProposalImplFromJson(Map<String, dynamic> json) =>
    _$ProposalImpl(
      referrerUserId: json['referrer_user_id'] as String?,
      referrerFirstName: json['referrer_first_name'] as String?,
      referrerLastName: json['referrer_last_name'] as String?,
      referrerPracticeArea: json['referrer_practice_area'] as String?,
      referrerPracticeLocation: json['referrer_practice_location'] as String?,
      referrerAvatarUrl: json['referrer_avatar_url'] as String?,
      referralId: (json['referral_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      preferredPracticeArea: json['preferred_practice_area'] as String?,
      preferredPracticeLocation: json['preferred_practice_location'] as String?,
      caseDescription: json['case_description'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeJsonConverter().fromJson),
      status: $enumDecodeNullable(_$ProposalStatusEnumMap, json['status']) ??
          ProposalStatus.active,
    );

Map<String, dynamic> _$$ProposalImplToJson(_$ProposalImpl instance) =>
    <String, dynamic>{
      'referrer_user_id': instance.referrerUserId,
      'referrer_first_name': instance.referrerFirstName,
      'referrer_last_name': instance.referrerLastName,
      'referrer_practice_area': instance.referrerPracticeArea,
      'referrer_practice_location': instance.referrerPracticeLocation,
      'referrer_avatar_url': instance.referrerAvatarUrl,
      'referral_id': instance.referralId,
      'title': instance.title,
      'preferred_practice_area': instance.preferredPracticeArea,
      'preferred_practice_location': instance.preferredPracticeLocation,
      'case_description': instance.caseDescription,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ProposalStatusEnumMap = {
  ProposalStatus.active: 'active',
  ProposalStatus.awarded: 'awarded',
  ProposalStatus.accepted: 'accepted',
  ProposalStatus.started: 'started',
  ProposalStatus.completed: 'completed',
  ProposalStatus.rejected: 'rejected',
  ProposalStatus.cancelled: 'cancelled',
};
