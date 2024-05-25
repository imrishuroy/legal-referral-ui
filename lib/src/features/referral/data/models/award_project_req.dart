import 'package:json_annotation/json_annotation.dart';

part 'award_project_req.g.dart';

@JsonSerializable()
class AwardProjectReq {
  AwardProjectReq({
    required this.referralId,
    required this.referredUserId,
    required this.referrerUserId,
  });

  factory AwardProjectReq.fromJson(Map<String, dynamic> json) =>
      _$AwardProjectReqFromJson(json);

  @JsonKey(name: 'referral_id')
  final int referralId;
  @JsonKey(name: 'referred_user_id')
  final String referredUserId;
  @JsonKey(name: 'referrer_user_id')
  final String referrerUserId;

  Map<String, dynamic> toJson() => _$AwardProjectReqToJson(this);
}
