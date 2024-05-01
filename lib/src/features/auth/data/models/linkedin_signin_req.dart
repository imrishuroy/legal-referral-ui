import 'package:json_annotation/json_annotation.dart';

part 'linkedin_signin_req.g.dart';

@JsonSerializable()
class LinkedinSignInReq {
  const LinkedinSignInReq({
    required this.email,
    required this.accessToken,
  });

  factory LinkedinSignInReq.fromJson(Map<String, dynamic> json) =>
      _$LinkedinSignInReqFromJson(json);

  final String email;
  @JsonKey(name: 'access_token')
  final String accessToken;

  Map<String, dynamic> toJson() => _$LinkedinSignInReqToJson(this);
}
