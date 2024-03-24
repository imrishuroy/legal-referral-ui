import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_req.freezed.dart';
part 'sign_in_req.g.dart';

@freezed
class SignInReq with _$SignInReq {
  const factory SignInReq({
    required String email,
  }) = _SignInReq;

  factory SignInReq.fromJson(Map<String, dynamic> json) =>
      _$SignInReqFromJson(json);
}
