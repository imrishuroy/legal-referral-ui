import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

part 'referred_user.freezed.dart';
part 'referred_user.g.dart';

@freezed
class ReferedUser with _$ReferedUser {
  const factory ReferedUser({
    @JsonKey(name: 'service_type') PriceServiceType? serviceType,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'practice_location') String? practiceLocation,
    @JsonKey(name: 'practice_area') String? practiceArea,
    @JsonKey(name: 'price_id') int? priceId,
    @JsonKey(name: 'per_hour_price') double? perHourPrice,
    @JsonKey(name: 'per_hearing_price') double? perHearingPrice,
    @JsonKey(name: 'contingency_price') String? contingencyPrice,
    @JsonKey(name: 'hybrid_price') String? hybridPrice,
  }) = _ReferedUser;

  factory ReferedUser.fromJson(Map<String, dynamic> json) =>
      _$ReferedUserFromJson(json);
}
