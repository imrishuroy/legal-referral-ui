import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'proposal.freezed.dart';
part 'proposal.g.dart';

@freezed
class Proposal with _$Proposal {
  const factory Proposal({
    @JsonKey(name: 'referrer_user_id') required String? referrerUserId,
    @JsonKey(name: 'referrer_first_name') required String? referrerFirstName,
    @JsonKey(name: 'referrer_last_name') required String? referrerLastName,
    @JsonKey(name: 'referrer_practice_area')
    required String? referrerPracticeArea,
    @JsonKey(name: 'referrer_practice_location')
    required String? referrerPracticeLocation,
    @JsonKey(name: 'referrer_avatar_url') required String? referrerAvatarUrl,
    @JsonKey(name: 'referral_id') required int? referralId,
    required String? title,
    @JsonKey(name: 'preferred_practice_area')
    required String? preferredPracticeArea,
    @JsonKey(name: 'preferred_practice_location')
    required String? preferredPracticeLocation,
    @JsonKey(name: 'case_description') required String? caseDescription,
    @JsonKey(
      name: 'created_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    required DateTime? createdAt,
    @JsonKey(
      name: 'updated_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    required DateTime? updatedAt,
  }) = _Proposal;

  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);
}
