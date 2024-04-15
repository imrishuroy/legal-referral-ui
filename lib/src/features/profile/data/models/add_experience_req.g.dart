// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_experience_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddExperienceReq _$AddExperienceReqFromJson(Map<String, dynamic> json) =>
    AddExperienceReq(
      title: json['title'] as String,
      practiceArea: json['practice_area'] as String,
      firmId: json['firm_id'] as int,
      practiceLocation: json['practice_location'] as String,
      startDate: const AddExperienceReqDateTimeConverter()
          .fromJson(json['start_date'] as String),
      endDate: const AddExperienceReqDateTimeConverter()
          .fromJson(json['end_date'] as String),
      current: json['current'] as bool,
      description: json['description'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddExperienceReqToJson(AddExperienceReq instance) =>
    <String, dynamic>{
      'title': instance.title,
      'practice_area': instance.practiceArea,
      'firm_id': instance.firmId,
      'practice_location': instance.practiceLocation,
      'start_date':
          const AddExperienceReqDateTimeConverter().toJson(instance.startDate),
      'end_date':
          const AddExperienceReqDateTimeConverter().toJson(instance.endDate),
      'current': instance.current,
      'description': instance.description,
      'skills': instance.skills,
    };
