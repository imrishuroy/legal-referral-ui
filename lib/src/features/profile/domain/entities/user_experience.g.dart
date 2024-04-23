// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserExperienceImpl _$$UserExperienceImplFromJson(Map<String, dynamic> json) =>
    _$UserExperienceImpl(
      experience: json['experience'] == null
          ? null
          : Experience.fromJson(json['experience'] as Map<String, dynamic>),
      firm: json['firm'] == null
          ? null
          : Firm.fromJson(json['firm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserExperienceImplToJson(
        _$UserExperienceImpl instance) =>
    <String, dynamic>{
      'experience': instance.experience,
      'firm': instance.firm,
    };
