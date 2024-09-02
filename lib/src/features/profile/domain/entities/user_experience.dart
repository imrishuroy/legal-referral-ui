import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

part 'user_experience.freezed.dart';
part 'user_experience.g.dart';

@freezed
class UserExperience with _$UserExperience {
  const factory UserExperience({
    @JsonKey(name: 'experience') required Experience? experience,
    @JsonKey(name: 'firm') required Firm? firm,
  }) = _UserExperience;

  factory UserExperience.fromJson(Map<String, dynamic> json) =>
      _$UserExperienceFromJson(json);
}
