// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdImpl _$$AdImplFromJson(Map<String, dynamic> json) => _$AdImpl(
      type: $enumDecode(_$AdTypeEnumMap, json['ad_type']),
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
      paymentCycle: $enumDecode(_$PaymentCycleEnumMap, json['payment_cycle']),
      authorId: json['author_id'] as String,
      startDate:
          const DateTimeJsonConverter().fromJson(json['start_date'] as String),
      endDate:
          const DateTimeJsonConverter().fromJson(json['end_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      adId: (json['ad_id'] as num?)?.toInt(),
      mediaUrls: (json['media'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AdImplToJson(_$AdImpl instance) {
  final val = <String, dynamic>{
    'ad_type': _$AdTypeEnumMap[instance.type]!,
    'title': instance.title,
    'description': instance.description,
    'link': instance.link,
    'payment_cycle': _$PaymentCycleEnumMap[instance.paymentCycle]!,
    'author_id': instance.authorId,
    'start_date': const DateTimeJsonConverter().toJson(instance.startDate),
    'end_date': const DateTimeJsonConverter().toJson(instance.endDate),
    'created_at': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ad_id', instance.adId);
  val['media'] = instance.mediaUrls;
  return val;
}

const _$AdTypeEnumMap = {
  AdType.image: 'image',
  AdType.video: 'video',
  AdType.other: 'other',
};

const _$PaymentCycleEnumMap = {
  PaymentCycle.weekly: 'weekly',
  PaymentCycle.monthly: 'monthly',
  PaymentCycle.yearly: 'yearly',
};
