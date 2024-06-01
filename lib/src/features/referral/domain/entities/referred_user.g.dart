// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referred_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferedUserImpl _$$ReferedUserImplFromJson(Map<String, dynamic> json) =>
    _$ReferedUserImpl(
      serviceType:
          $enumDecodeNullable(_$PriceServiceTypeEnumMap, json['service_type']),
      userId: json['user_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      practiceLocation: json['practice_location'] as String?,
      practiceArea: json['practice_area'] as String?,
      priceId: (json['price_id'] as num?)?.toInt(),
      perHourPrice: (json['per_hour_price'] as num?)?.toDouble(),
      perHearingPrice: (json['per_hearing_price'] as num?)?.toDouble(),
      contingencyPrice: json['contingency_price'] as String?,
      hybridPrice: json['hybrid_price'] as String?,
    );

Map<String, dynamic> _$$ReferedUserImplToJson(_$ReferedUserImpl instance) =>
    <String, dynamic>{
      'service_type': _$PriceServiceTypeEnumMap[instance.serviceType],
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
      'practice_location': instance.practiceLocation,
      'practice_area': instance.practiceArea,
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
