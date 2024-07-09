// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_user_to_discussion_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteUserToDiscussionReq _$InviteUserToDiscussionReqFromJson(
        Map<String, dynamic> json) =>
    InviteUserToDiscussionReq(
      discussionId: json['discussion_id'] as String,
      inviteeUserId: json['invitee_user_id'] as String,
      invitedUserId: json['invited_user_id'] as String,
    );

Map<String, dynamic> _$InviteUserToDiscussionReqToJson(
        InviteUserToDiscussionReq instance) =>
    <String, dynamic>{
      'discussion_id': instance.discussionId,
      'invitee_user_id': instance.inviteeUserId,
      'invited_user_id': instance.invitedUserId,
    };
