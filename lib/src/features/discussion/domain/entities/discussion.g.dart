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

Map<String, dynamic> _$$DiscussionImplToJson(_$DiscussionImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('discussion_id', instance.discussionId);
  writeNotNull('topic', instance.topic);
  val['author_id'] = instance.authorId;
  writeNotNull(
      'created_at',
      _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeJsonConverter().toJson));
  writeNotNull('active_member_count', instance.activeMemberCount);
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
