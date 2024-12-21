// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceImpl _$$PriceImplFromJson(Map<String, dynamic> json) => _$PriceImpl(
      serviceType:
          $enumDecodeNullable(_$PriceServiceTypeEnumMap, json['service_type']),
      perHourPrice: (json['per_hour_price'] as num?)?.toDouble(),
      perHearingPrice: (json['per_hearing_price'] as num?)?.toDouble(),
      contingencyPrice: json['contingency_price'] as String?,
      hybridPrice: json['hybrid_price'] as String?,
      priceId: (json['price_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$PriceImplToJson(_$PriceImpl instance) =>
    <String, dynamic>{
      'service_type': _$PriceServiceTypeEnumMap[instance.serviceType],
      if (instance.perHourPrice case final value?) 'per_hour_price': value,
      if (instance.perHearingPrice case final value?)
        'per_hearing_price': value,
      if (instance.contingencyPrice case final value?)
        'contingency_price': value,
      if (instance.hybridPrice case final value?) 'hybrid_price': value,
    };

const _$PriceServiceTypeEnumMap = {
  PriceServiceType.perHour: 'per_hour',
  PriceServiceType.perHearing: 'per_hearing',
  PriceServiceType.contingency: 'contingency',
  PriceServiceType.hybrid: 'hybrid',
};
