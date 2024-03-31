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
      isEmailVerified: json['is_email_verified'] as bool? ?? false,
      isMobileVerified: json['is_mobile_verified'] as bool? ?? false,
      wizardStep: json['wizard_step'] as int? ?? 0,
      isWizardCompleted: json['wizard_completed'] as bool? ?? false,
      joinDate: json['join_date'] == null
          ? null
          : DateTime.parse(json['join_date'] as String),
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_email_verified': instance.isEmailVerified,
      'is_mobile_verified': instance.isMobileVerified,
      'wizard_step': instance.wizardStep,
      'wizard_completed': instance.isWizardCompleted,
      'mobile': instance.mobile,
      'address': instance.address,
    };
