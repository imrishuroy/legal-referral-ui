import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'discussion_invite.freezed.dart';
part 'discussion_invite.g.dart';

@JsonEnum()
enum DiscussionInviteStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
}

@freezed
class DiscussionInvite with _$DiscussionInvite {
  factory DiscussionInvite({
    @JsonKey(name: 'discussion_invite_id') required int discussionInviteId,
    @JsonKey(name: 'discussion_id', includeIfNull: false)
    required int discussionId,
    @JsonKey(name: 'status') required DiscussionInviteStatus status,
    @JsonKey(name: 'invitee_user_id') String? inviteeUserId,
    @JsonKey(name: 'invited_user_id') String? invitedUserId,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at', includeIfNull: false)
    DateTime? createdAt,
  }) = _DiscussionInvite;

  factory DiscussionInvite.fromJson(Map<String, dynamic> json) =>
      _$DiscussionInviteFromJson(json);
}
