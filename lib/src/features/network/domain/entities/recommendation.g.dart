// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    _Recommendation(
      userId: json['user_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      about: json['about'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      practiceArea: json['practice_area'] as String?,
      practiceLocation: json['practice_location'] as String?,
      experience: json['experience'] as String?,
    );

Map<String, dynamic> _$RecommendationToJson(_Recommendation instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'about': instance.about,
      'avatar_url': instance.avatarUrl,
      'practice_area': instance.practiceArea,
      'practice_location': instance.practiceLocation,
      'experience': instance.experience,
    };
