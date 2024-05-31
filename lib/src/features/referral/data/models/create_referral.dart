import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_referral.freezed.dart';
part 'create_referral.g.dart';

@freezed
class CreateReferral with _$CreateReferral {
  const factory CreateReferral({
    required String title,
    @JsonKey(name: 'case_description') required String caseDescription,
    @JsonKey(name: 'preferred_practice_area') required String practiceArea,
    @JsonKey(name: 'preferred_practice_location')
    required String practiceLocation,
    @JsonKey(name: 'referrer_user_id') required String referrerUserId,
    @JsonKey(name: 'referred_user_ids') required List<String> referredUserIds,
  }) = _CreateReferral;

  factory CreateReferral.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralFromJson(json);
}
