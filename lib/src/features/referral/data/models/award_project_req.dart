import 'package:json_annotation/json_annotation.dart';

part 'award_project_req.g.dart';

@JsonSerializable()
class AwardProjectReq {
  AwardProjectReq({
    required this.projectId,
    required this.referredUserId,
  });

  factory AwardProjectReq.fromJson(Map<String, dynamic> json) =>
      _$AwardProjectReqFromJson(json);

  @JsonKey(name: 'project_id')
  final int projectId;
  @JsonKey(name: 'referred_user_id')
  final String referredUserId;

  Map<String, dynamic> toJson() => _$AwardProjectReqToJson(this);
}
