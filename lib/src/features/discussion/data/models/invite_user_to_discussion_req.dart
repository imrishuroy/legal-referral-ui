import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_user_to_discussion_req.g.dart';

@JsonSerializable()
class InviteUserToDiscussionReq {
  InviteUserToDiscussionReq({
    required this.discussionId,
    required this.inviteeUserId,
    required this.invitedUserId,
  });

  factory InviteUserToDiscussionReq.fromJson(Map<String, dynamic> json) =>
      _$InviteUserToDiscussionReqFromJson(json);

  @JsonKey(name: 'discussion_id')
  final String discussionId;

  @JsonKey(name: 'invitee_user_id')
  final String inviteeUserId;

  @JsonKey(name: 'invited_user_id')
  final String invitedUserId;

  Map<String, dynamic> toJson() => _$InviteUserToDiscussionReqToJson(this);
}
