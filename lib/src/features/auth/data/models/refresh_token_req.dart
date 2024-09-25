import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_req.g.dart';

@JsonSerializable()
class RefreshTokenReq {
  RefreshTokenReq({
    required this.refreshToken,
    required this.grantType,
  });

  factory RefreshTokenReq.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenReqFromJson(json);

  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'grant_type')
  final String grantType;

  Map<String, dynamic> toJson() => _$RefreshTokenReqToJson(this);
}
