import 'package:json_annotation/json_annotation.dart';

part 'email_signin_req.g.dart';

@JsonSerializable()
class EmailSignInReq {
  EmailSignInReq({
    required this.email,
    required this.password,
    this.returnSecureToken = true,
  });

  factory EmailSignInReq.fromJson(Map<String, dynamic> json) =>
      _$EmailSignInReqFromJson(json);

  final String email;
  final String password;
  final bool returnSecureToken;

  Map<String, dynamic> toJson() => _$EmailSignInReqToJson(this);
}
