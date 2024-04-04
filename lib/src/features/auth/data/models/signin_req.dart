import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_req.g.dart';

@JsonSerializable()
class SignInReq {
  SignInReq({
    required this.email,
  });

  factory SignInReq.fromJson(Map<String, dynamic> json) =>
      _$SignInReqFromJson(json);

  final String email;

  Map<String, dynamic> toJson() => _$SignInReqToJson(this);
}
