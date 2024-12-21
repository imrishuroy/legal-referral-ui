// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscussionImpl _$$DiscussionImplFromJson(Map<String, dynamic> json) =>
    _$DiscussionImpl(
      discussionId: (json['discussion_id'] as num?)?.toInt(),
      topic: json['topic'] as String?,
      authorId: json['author_id'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      activeMemberCount: (json['active_member_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DiscussionImplToJson(_$DiscussionImpl instance) =>
    <String, dynamic>{
      if (instance.discussionId case final value?) 'discussion_id': value,
      if (instance.topic case final value?) 'topic': value,
      'author_id': instance.authorId,
      if (_$JsonConverterToJson<String, DateTime>(
              instance.createdAt, const DateTimeJsonConverter().toJson)
          case final value?)
        'created_at': value,
      if (instance.activeMemberCount case final value?)
        'active_member_count': value,
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
