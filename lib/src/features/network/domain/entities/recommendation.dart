import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

part 'recommendation.freezed.dart';
part 'recommendation.g.dart';

@freezed
class Recommendation with _$Recommendation {
  const factory Recommendation({
    @JsonKey(name: 'user_id') required String? userId,
    @JsonKey(name: 'first_name') required String? firstName,
    @JsonKey(name: 'last_name') required String? lastName,
    required String? about,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    @JsonKey(name: 'practice_area') required String? practiceArea,
    @JsonKey(name: 'practice_location') required String? practiceLocation,
    required String? experience,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(ConnectionInvitationStatus.none)
    ConnectionInvitationStatus? status,
  }) = _Recommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}
