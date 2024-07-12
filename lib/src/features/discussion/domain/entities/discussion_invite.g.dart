// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscussionInviteImpl _$$DiscussionInviteImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscussionInviteImpl(
      discussionInviteId: (json['discussion_invite_id'] as num).toInt(),
      discussionId: (json['discussion_id'] as num).toInt(),
      status: $enumDecode(_$DiscussionInviteStatusEnumMap, json['status']),
      inviteeUserId: json['invitee_user_id'] as String?,
      invitedUserId: json['invited_user_id'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
    );

Map<String, dynamic> _$$DiscussionInviteImplToJson(
    _$DiscussionInviteImpl instance) {
  final val = <String, dynamic>{
    'discussion_invite_id': instance.discussionInviteId,
    'discussion_id': instance.discussionId,
    'status': _$DiscussionInviteStatusEnumMap[instance.status]!,
    'invitee_user_id': instance.inviteeUserId,
    'invited_user_id': instance.invitedUserId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'created_at',
      _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeJsonConverter().toJson));
  return val;
}

const _$DiscussionInviteStatusEnumMap = {
  DiscussionInviteStatus.pending: 'pending',
  DiscussionInviteStatus.accepted: 'accepted',
  DiscussionInviteStatus.rejected: 'rejected',
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
