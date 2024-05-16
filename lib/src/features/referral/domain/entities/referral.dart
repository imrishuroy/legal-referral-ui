import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

@freezed
class Referral with _$Referral {
  const factory Referral({
    required String title,
    @JsonKey(name: 'case_description') required String caseDescription,
    @JsonKey(name: 'preferred_practice_area') required String? practiceArea,
    @JsonKey(name: 'preferred_practice_location')
    required String? practiceLocation,
    @JsonKey(name: 'referred_user_id') required String? referredUserId,
    @JsonKey(name: 'referrer_user_id') required String? referrerUserId,
    @JsonKey(name: 'referral_id', includeToJson: false) int? referralId,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at', includeToJson: false)
    DateTime? createdAt,
    @DateTimeJsonConverter()
    @JsonKey(name: 'updated_at', includeToJson: false)
    DateTime? updatedAt,
  }) = _Referral;

  factory Referral.fromJson(Map<String, dynamic> json) =>
      _$ReferralFromJson(json);
}
