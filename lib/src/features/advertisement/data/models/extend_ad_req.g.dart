// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_ad_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendAdReq _$ExtendAdReqFromJson(Map<String, dynamic> json) => ExtendAdReq(
      adId: (json['ad_id'] as num).toInt(),
      endDate:
          const DateTimeJsonConverter().fromJson(json['end_date'] as String),
    );

Map<String, dynamic> _$ExtendAdReqToJson(ExtendAdReq instance) =>
    <String, dynamic>{
      'ad_id': instance.adId,
      'end_date': const DateTimeJsonConverter().toJson(instance.endDate),
    };
