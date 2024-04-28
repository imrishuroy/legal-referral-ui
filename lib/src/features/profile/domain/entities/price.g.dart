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

Map<String, dynamic> _$$PriceImplToJson(_$PriceImpl instance) {
  final val = <String, dynamic>{
    'service_type': _$PriceServiceTypeEnumMap[instance.serviceType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('per_hour_price', instance.perHourPrice);
  writeNotNull('per_hearing_price', instance.perHearingPrice);
  writeNotNull('contingency_price', instance.contingencyPrice);
  writeNotNull('hybrid_price', instance.hybridPrice);
  return val;
}

const _$PriceServiceTypeEnumMap = {
  PriceServiceType.perHour: 'per_hour',
  PriceServiceType.perHearing: 'per_hearing',
  PriceServiceType.contingency: 'contingency',
  PriceServiceType.hybrid: 'hybrid',
};
