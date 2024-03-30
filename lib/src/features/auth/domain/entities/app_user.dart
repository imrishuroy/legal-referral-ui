import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'is_email_verified') @Default(false) bool isEmailVerified,
    @JsonKey(name: 'is_mobile_verified') @Default(false) bool isMobileVerified,
    @JsonKey(name: 'wizard_step') @Default(0) int wizardStep,
    @JsonKey(name: 'wizard_completed') @Default(false) bool isWizardCompleted,
    @JsonKey(name: 'join_date', includeToJson: false) DateTime? joinDate,
    String? mobile,
    @JsonKey(includeToJson: false) String? id,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
