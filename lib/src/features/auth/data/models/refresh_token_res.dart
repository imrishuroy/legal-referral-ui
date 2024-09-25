import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_res.g.dart';

@JsonSerializable()
class RefreshTokenRes {
  RefreshTokenRes({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
    required this.refreshToken,
    required this.idToken,
    required this.userId,
    required this.projectId,
  });

  factory RefreshTokenRes.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResFromJson(json);

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'expires_in')
  final String expiresIn;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'id_token')
  final String idToken;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'project_id')
  final String projectId;

  Map<String, dynamic> toJson() => _$RefreshTokenResToJson(this);
}
