// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceImpl _$$ExperienceImplFromJson(Map<String, dynamic> json) =>
    _$ExperienceImpl(
      title: json['title'] as String,
      practiceArea: json['practice_area'] as String?,
      firm: json['firm'] == null
          ? null
          : Firm.fromJson(json['firm'] as Map<String, dynamic>),
      practiceLocation: json['practice_location'] as String?,
      startDate: _$JsonConverterFromJson<String, DateTime>(
          json['start_date'], const ExperienceDateTimeConverter().fromJson),
      endDate: _$JsonConverterFromJson<String, DateTime>(
          json['end_date'], const ExperienceDateTimeConverter().fromJson),
      current: json['current'] as bool,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String?,
      experienceId: json['experience_id'] as int?,
    );

Map<String, dynamic> _$$ExperienceImplToJson(_$ExperienceImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'practice_area': instance.practiceArea,
      'firm': instance.firm,
      'practice_location': instance.practiceLocation,
      'start_date': _$JsonConverterToJson<String, DateTime>(
          instance.startDate, const ExperienceDateTimeConverter().toJson),
      'end_date': _$JsonConverterToJson<String, DateTime>(
          instance.endDate, const ExperienceDateTimeConverter().toJson),
      'current': instance.current,
      'skills': instance.skills,
      'description': instance.description,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
