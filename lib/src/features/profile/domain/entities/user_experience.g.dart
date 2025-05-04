// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserExperience _$UserExperienceFromJson(Map<String, dynamic> json) =>
    _UserExperience(
      experience: json['experience'] == null
          ? null
          : Experience.fromJson(json['experience'] as Map<String, dynamic>),
      firm: json['firm'] == null
          ? null
          : Firm.fromJson(json['firm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserExperienceToJson(_UserExperience instance) =>
    <String, dynamic>{
      'experience': instance.experience,
      'firm': instance.firm,
    };
