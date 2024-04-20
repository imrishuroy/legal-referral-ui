import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_referral_req.g.dart';

@JsonSerializable()
class ToggleReferralReq {
  ToggleReferralReq({
    required this.openToReferral,
  });

  factory ToggleReferralReq.fromJson(Map<String, dynamic> json) =>
      _$ToggleReferralReqFromJson(json);

  @JsonKey(name: 'open_to_referral')
  final bool openToReferral;

  Map<String, dynamic> toJson() => _$ToggleReferralReqToJson(this);
}
