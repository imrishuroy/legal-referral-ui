import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: 'service_type') PriceServiceType? serviceType,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'practice_area') String? practiceArea,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'banner_url') String? bannerUrl,
    @JsonKey(name: 'average_billing_per_client') int? averageBillingPerClient,
    @JsonKey(name: 'case_resolution_rate') int? caseResolutionRate,
    @JsonKey(name: 'open_to_referral') bool? openToReferral,
    @JsonKey(name: 'about') String? about,
    @JsonKey(name: 'price_id') int? priceId,
    @JsonKey(name: 'per_hour_price') double? perHourPrice,
    @JsonKey(name: 'per_hearing_price') double? perHearingPrice,
    @JsonKey(name: 'contingency_price') String? contingencyPrice,
    @JsonKey(name: 'hybrid_price') String? hybridPrice,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
