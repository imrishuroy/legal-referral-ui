import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_referral_req.freezed.dart';
part 'add_referral_req.g.dart';

@freezed
class AddReferralReq with _$AddReferralReq {
  const factory AddReferralReq({
    required String title,
    @JsonKey(name: 'case_description') required String caseDescription,
    @JsonKey(name: 'preferred_practice_area') required String practiceArea,
    @JsonKey(name: 'preferred_practice_location')
    required String practiceLocation,
    @JsonKey(name: 'referrer_user_id') required String referrerUserId,
    @JsonKey(name: 'referred_user_ids') required List<String> referredUserIds,
  }) = _AddReferralReq;

  factory AddReferralReq.fromJson(Map<String, dynamic> json) =>
      _$AddReferralReqFromJson(json);
}
