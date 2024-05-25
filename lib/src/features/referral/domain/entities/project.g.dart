// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      referralId: (json['referral_id'] as num).toInt(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userId: json['user_id'] as String?,
      description: json['case_description'] as String?,
      title: json['title'] as String?,
      practiceArea: json['practice_area'] as String?,
      practiceLocation: json['practice_location'] as String?,
      status: $enumDecodeNullable(_$ProjectStatusEnumMap, json['status']) ??
          ProjectStatus.active,
      user: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      startedAt: _$JsonConverterFromJson<String, DateTime>(
          json['started_at'], const DateTimeJsonConverter().fromJson),
      completedAt: _$JsonConverterFromJson<String, DateTime>(
          json['completed_at'], const DateTimeJsonConverter().fromJson),
      projectId: (json['project_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'referral_id': instance.referralId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'user_id': instance.userId,
      'title': instance.title,
      'project_id': instance.projectId,
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'active',
  ProjectStatus.awarded: 'awarded',
  ProjectStatus.accepted: 'accepted',
  ProjectStatus.started: 'started',
  ProjectStatus.completeInitiated: 'complete_initiated',
  ProjectStatus.completed: 'completed',
  ProjectStatus.rejected: 'rejected',
  ProjectStatus.cancelled: 'cancelled',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
