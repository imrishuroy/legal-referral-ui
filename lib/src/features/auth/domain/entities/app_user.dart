import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'about', includeIfNull: false) String? about,
    @JsonKey(name: 'signup_method') @Default(0) int signupMethod,
    @JsonKey(name: 'email_verified') @Default(false) bool emailVerified,
    @JsonKey(name: 'mobile_verified') @Default(false) bool mobileVerified,
    @JsonKey(name: 'wizard_step') @Default(0) int wizardStep,
    @JsonKey(name: 'wizard_completed') @Default(false) bool wizardCompleted,
    @DateTimeConverter()
    @JsonKey(name: 'join_date', includeToJson: false)
    DateTime? joinDate,
    String? mobile,
    String? address,
    @JsonKey(name: 'avatar_url', includeIfNull: false) String? imageUrl,
    @JsonKey(name: 'banner_url', includeIfNull: false) String? bannerUrl,
    @JsonKey(name: 'user_id', includeToJson: false) String? userId,
    @JsonKey(name: 'practice_area', includeIfNull: false) String? practiceArea,
    @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
    int? caseResolutionRate,
    @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
    int? averageBillingPerClient,
    @JsonKey(name: 'experience', includeIfNull: false) String? experience,
    @JsonKey(
      name: 'open_to_referral',
      includeIfNull: false,
    )
    @Default(false)
    bool openToReferral,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime?, String> {
  const DateTimeConverter();
  @override
  DateTime fromJson(String json) {
    return DateTimeUtil.getFormatedDateTime(json);
  }

  @override
  String toJson(DateTime? object) {
    return '';
  }
}
