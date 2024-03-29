import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

part 'singup_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  SignUpResponse({
    required this.sessionId,
    required this.appUser,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  @JsonKey(name: 'session_id')
  final int? sessionId;
  @JsonKey(name: 'user')
  final AppUser? appUser;

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
