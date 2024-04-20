// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      about: json['about'] as String?,
      signupMethod: json['signup_method'] as int? ?? 0,
      emailVerified: json['email_verified'] as bool? ?? false,
      mobileVerified: json['mobile_verified'] as bool? ?? false,
      wizardStep: json['wizard_step'] as int? ?? 0,
      wizardCompleted: json['wizard_completed'] as bool? ?? false,
      joinDate: _$JsonConverterFromJson<String, DateTime?>(
          json['join_date'], const DateTimeConverter().fromJson),
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      imageUrl: json['avatar_url'] as String?,
      bannerUrl: json['banner_url'] as String?,
      userId: json['user_id'] as String?,
      practiceArea: json['practice_area'] as String?,
      caseResolutionRate: json['case_resolution_rate'] as int?,
      averageBillingPerClient: json['average_billing_per_client'] as int?,
      experience: json['experience'] as String?,
      openToReferral: json['open_to_referral'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'first_name': instance.firstName,
    'last_name': instance.lastName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('about', instance.about);
  val['signup_method'] = instance.signupMethod;
  val['email_verified'] = instance.emailVerified;
  val['mobile_verified'] = instance.mobileVerified;
  val['wizard_step'] = instance.wizardStep;
  val['wizard_completed'] = instance.wizardCompleted;
  val['mobile'] = instance.mobile;
  val['address'] = instance.address;
  writeNotNull('avatar_url', instance.imageUrl);
  writeNotNull('banner_url', instance.bannerUrl);
  writeNotNull('practice_area', instance.practiceArea);
  writeNotNull('case_resolution_rate', instance.caseResolutionRate);
  writeNotNull('average_billing_per_client', instance.averageBillingPerClient);
  writeNotNull('experience', instance.experience);
  val['open_to_referral'] = instance.openToReferral;
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
