import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_req.g.dart';

@JsonSerializable()
class ResetPasswordReq {
  ResetPasswordReq({
    required this.email,
    required this.password,
  });

  factory ResetPasswordReq.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordReqFromJson(json);

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$ResetPasswordReqToJson(this);
}
