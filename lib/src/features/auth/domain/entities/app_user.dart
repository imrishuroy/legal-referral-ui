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
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'user_id') String? userId,
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
