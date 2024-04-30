// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceImpl _$$ExperienceImplFromJson(Map<String, dynamic> json) =>
    _$ExperienceImpl(
      title: json['title'] as String,
      practiceArea: json['practice_area'] as String?,
      practiceLocation: json['practice_location'] as String?,
      startDate: _$JsonConverterFromJson<String, DateTime>(
          json['start_date'], const ExperienceDateTimeConverter().fromJson),
      endDate: _$JsonConverterFromJson<String, DateTime>(
          json['end_date'], const ExperienceDateTimeConverter().fromJson),
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String?).toList(),
      description: json['description'] as String?,
      current: json['current'] as bool? ?? false,
      firmId: (json['firm_id'] as num?)?.toInt(),
      experienceId: (json['experience_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$ExperienceImplToJson(_$ExperienceImpl instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'practice_area': instance.practiceArea,
    'practice_location': instance.practiceLocation,
    'start_date': _$JsonConverterToJson<String, DateTime>(
        instance.startDate, const ExperienceDateTimeConverter().toJson),
    'end_date': _$JsonConverterToJson<String, DateTime>(
        instance.endDate, const ExperienceDateTimeConverter().toJson),
    'skills': instance.skills,
    'description': instance.description,
    'current': instance.current,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firm_id', instance.firmId);
  return val;
}

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
