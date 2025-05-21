// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      about: json['about'] as String?,
      signupMethod: (json['signup_method'] as num?)?.toInt() ?? 0,
      emailVerified: json['email_verified'] as bool? ?? false,
      mobileVerified: json['mobile_verified'] as bool? ?? false,
      wizardStep: (json['wizard_step'] as num?)?.toInt() ?? 0,
      wizardCompleted: json['wizard_completed'] as bool? ?? false,
      joinDate: _$JsonConverterFromJson<String, DateTime?>(
          json['join_date'], const DateTimeConverter().fromJson),
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      bannerUrl: json['banner_url'] as String?,
      userId: json['user_id'] as String?,
      practiceArea: json['practice_area'] as String?,
      practiceLocation: json['practice_location'] as String?,
      caseResolutionRate: (json['case_resolution_rate'] as num?)?.toInt(),
      averageBillingPerClient:
          (json['average_billing_per_client'] as num?)?.toInt(),
      experience: json['experience'] as String?,
      openToReferral: json['open_to_referral'] as bool? ?? false,
    );

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      if (instance.about case final value?) 'about': value,
      if (instance.signupMethod case final value?) 'signup_method': value,
      if (instance.emailVerified case final value?) 'email_verified': value,
      if (instance.mobileVerified case final value?) 'mobile_verified': value,
      if (instance.wizardStep case final value?) 'wizard_step': value,
      if (instance.wizardCompleted case final value?) 'wizard_completed': value,
      'mobile': instance.mobile,
      'address': instance.address,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      if (instance.bannerUrl case final value?) 'banner_url': value,
      if (instance.userId case final value?) 'user_id': value,
      if (instance.practiceArea case final value?) 'practice_area': value,
      if (instance.practiceLocation case final value?)
        'practice_location': value,
      if (instance.caseResolutionRate case final value?)
        'case_resolution_rate': value,
      if (instance.averageBillingPerClient case final value?)
        'average_billing_per_client': value,
      if (instance.experience case final value?) 'experience': value,
      if (instance.openToReferral case final value?) 'open_to_referral': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
