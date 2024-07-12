import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';

part 'discussion_invite_res.freezed.dart';
part 'discussion_invite_res.g.dart';

@freezed
class DiscussionInviteRes with _$DiscussionInviteRes {
  factory DiscussionInviteRes({
    @JsonKey(name: 'discussion_invite')
    required DiscussionInvite discussionInvite,
    @JsonKey(name: 'discussion') required Discussion discussion,
    @JsonKey(name: 'user') required AppUser user,
  }) = _DiscussionInviteRes;

  factory DiscussionInviteRes.fromJson(Map<String, dynamic> json) =>
      _$DiscussionInviteResFromJson(json);
}
