// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_invite_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscussionInviteRes _$DiscussionInviteResFromJson(Map<String, dynamic> json) =>
    _DiscussionInviteRes(
      discussionInvite: DiscussionInvite.fromJson(
          json['discussion_invite'] as Map<String, dynamic>),
      discussion:
          Discussion.fromJson(json['discussion'] as Map<String, dynamic>),
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiscussionInviteResToJson(
        _DiscussionInviteRes instance) =>
    <String, dynamic>{
      'discussion_invite': instance.discussionInvite,
      'discussion': instance.discussion,
      'user': instance.user,
    };
