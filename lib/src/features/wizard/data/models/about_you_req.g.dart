// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_you_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutYouReq _$AboutYouReqFromJson(Map<String, dynamic> json) => AboutYouReq(
      address: json['address'] as String,
      practiceArea: json['practice_area'] as String,
      practiceLocation: json['practice_location'] as String,
      experience: json['experience'] as String,
    );

Map<String, dynamic> _$AboutYouReqToJson(AboutYouReq instance) =>
    <String, dynamic>{
      'address': instance.address,
      'practice_area': instance.practiceArea,
      'practice_location': instance.practiceLocation,
      'experience': instance.experience,
    };
