// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscussionInvite _$DiscussionInviteFromJson(Map<String, dynamic> json) =>
    _DiscussionInvite(
      discussionInviteId: (json['discussion_invite_id'] as num).toInt(),
      discussionId: (json['discussion_id'] as num).toInt(),
      status: $enumDecode(_$DiscussionInviteStatusEnumMap, json['status']),
      inviteeUserId: json['invitee_user_id'] as String?,
      invitedUserId: json['invited_user_id'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
    );

Map<String, dynamic> _$DiscussionInviteToJson(_DiscussionInvite instance) =>
    <String, dynamic>{
      'discussion_invite_id': instance.discussionInviteId,
      'discussion_id': instance.discussionId,
      'status': _$DiscussionInviteStatusEnumMap[instance.status]!,
      'invitee_user_id': instance.inviteeUserId,
      'invited_user_id': instance.invitedUserId,
      if (_$JsonConverterToJson<String, DateTime>(
              instance.createdAt, const DateTimeJsonConverter().toJson)
          case final value?)
        'created_at': value,
    };

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
