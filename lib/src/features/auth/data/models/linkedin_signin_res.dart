import 'package:json_annotation/json_annotation.dart';

part 'linkedin_signin_res.g.dart';

@JsonSerializable()
class LinkedinSignInRes {
  const LinkedinSignInRes({
    required this.userId,
    required this.token,
  });

  factory LinkedinSignInRes.fromJson(Map<String, dynamic> json) =>
      _$LinkedinSignInResFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  final String token;

  Map<String, dynamic> toJson() => _$LinkedinSignInResToJson(this);
}
