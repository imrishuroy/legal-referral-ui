// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationImpl _$$EducationImplFromJson(Map<String, dynamic> json) =>
    _$EducationImpl(
      degree: json['degree'] as String?,
      school: json['school'] as String?,
      fieldOfStudy: json['field_of_study'] as String?,
      startDate: _$JsonConverterFromJson<String, DateTime>(
          json['start_date'], const EducationDateTimeConverter().fromJson),
      endDate: _$JsonConverterFromJson<String, DateTime>(
          json['end_date'], const EducationDateTimeConverter().fromJson),
      current: json['current'] as bool,
      grade: json['grade'] as String?,
      achievements: json['achievements'] as String?,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      educationId: (json['education_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EducationImplToJson(_$EducationImpl instance) =>
    <String, dynamic>{
      'degree': instance.degree,
      'school': instance.school,
      'field_of_study': instance.fieldOfStudy,
      'start_date': _$JsonConverterToJson<String, DateTime>(
          instance.startDate, const EducationDateTimeConverter().toJson),
      'end_date': _$JsonConverterToJson<String, DateTime>(
          instance.endDate, const EducationDateTimeConverter().toJson),
      'current': instance.current,
      'grade': instance.grade,
      'achievements': instance.achievements,
      'skills': instance.skills,
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
