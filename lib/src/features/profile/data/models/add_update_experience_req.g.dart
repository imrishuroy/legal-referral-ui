// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_update_experience_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUpdateExperienceReq _$AddUpdateExperienceReqFromJson(
        Map<String, dynamic> json) =>
    AddUpdateExperienceReq(
      title: json['title'] as String,
      practiceArea: json['practice_area'] as String,
      firmId: (json['firm_id'] as num).toInt(),
      practiceLocation: json['practice_location'] as String,
      startDate: const AddExperienceReqDateTimeConverter()
          .fromJson(json['start_date'] as String),
      endDate: _$JsonConverterFromJson<String, DateTime>(
          json['end_date'], const AddExperienceReqDateTimeConverter().fromJson),
      current: json['current'] as bool,
      description: json['description'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$AddUpdateExperienceReqToJson(
        AddUpdateExperienceReq instance) =>
    <String, dynamic>{
      'title': instance.title,
      'practice_area': instance.practiceArea,
      'firm_id': instance.firmId,
      'practice_location': instance.practiceLocation,
      'start_date':
          const AddExperienceReqDateTimeConverter().toJson(instance.startDate),
      'end_date': _$JsonConverterToJson<String, DateTime>(
          instance.endDate, const AddExperienceReqDateTimeConverter().toJson),
      'current': instance.current,
      'description': instance.description,
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
