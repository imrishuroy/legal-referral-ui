// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      serviceType:
          $enumDecodeNullable(_$PriceServiceTypeEnumMap, json['service_type']),
      userId: json['user_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      practiceArea: json['practice_area'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      bannerUrl: json['banner_url'] as String?,
      averageBillingPerClient:
          (json['average_billing_per_client'] as num?)?.toInt(),
      caseResolutionRate: (json['case_resolution_rate'] as num?)?.toInt(),
      openToReferral: json['open_to_referral'] as bool?,
      about: json['about'] as String?,
      priceId: (json['price_id'] as num?)?.toInt(),
      perHourPrice: (json['per_hour_price'] as num?)?.toDouble(),
      perHearingPrice: (json['per_hearing_price'] as num?)?.toDouble(),
      contingencyPrice: json['contingency_price'] as String?,
      hybridPrice: json['hybrid_price'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'service_type': _$PriceServiceTypeEnumMap[instance.serviceType],
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'practice_area': instance.practiceArea,
      'avatar_url': instance.avatarUrl,
      'banner_url': instance.bannerUrl,
      'average_billing_per_client': instance.averageBillingPerClient,
      'case_resolution_rate': instance.caseResolutionRate,
      'open_to_referral': instance.openToReferral,
      'about': instance.about,
      'price_id': instance.priceId,
      'per_hour_price': instance.perHourPrice,
      'per_hearing_price': instance.perHearingPrice,
      'contingency_price': instance.contingencyPrice,
      'hybrid_price': instance.hybridPrice,
    };

const _$PriceServiceTypeEnumMap = {
  PriceServiceType.perHour: 'per_hour',
  PriceServiceType.perHearing: 'per_hearing',
  PriceServiceType.contingency: 'contingency',
  PriceServiceType.hybrid: 'hybrid',
};
