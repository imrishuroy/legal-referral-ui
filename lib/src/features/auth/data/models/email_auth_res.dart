import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

part 'email_auth_res.g.dart';

@JsonSerializable()
class EmailAuthRes {
  EmailAuthRes({
    required this.user,
    required this.idToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory EmailAuthRes.fromJson(Map<String, dynamic> json) =>
      _$EmailAuthResFromJson(json);

  final AppUser user;
  @JsonKey(name: 'id_token')
  final String idToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'expires_in')
  final String expiresIn;

  Map<String, dynamic> toJson() => _$EmailAuthResToJson(this);
}
