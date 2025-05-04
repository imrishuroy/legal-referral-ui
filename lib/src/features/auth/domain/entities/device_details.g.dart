// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceDetails _$DeviceDetailsFromJson(Map<String, dynamic> json) =>
    _DeviceDetails(
      deviceId: json['device_id'] as String?,
      deviceToken: json['device_token'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$DeviceDetailsToJson(_DeviceDetails instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'device_token': instance.deviceToken,
      'user_id': instance.userId,
    };
