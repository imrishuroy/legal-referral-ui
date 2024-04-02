// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_you_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutYouReq _$AboutYouReqFromJson(Map<String, dynamic> json) => AboutYouReq(
      userId: json['user_id'] as String,
      address: json['address'] as String,
      practiceArea: json['practice_area'] as String,
      practiceLocation: json['practice_location'] as String,
      experience: json['experience'] as int,
    );

Map<String, dynamic> _$AboutYouReqToJson(AboutYouReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'address': instance.address,
      'practice_area': instance.practiceArea,
      'practice_location': instance.practiceLocation,
      'experience': instance.experience,
    };
