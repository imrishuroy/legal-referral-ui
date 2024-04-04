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
      signupMethod: json['signup_method'] as int? ?? 0,
      isEmailVerified: json['email_verified'] as bool? ?? false,
      isMobileVerified: json['mobile_verified'] as bool? ?? false,
      wizardStep: json['wizard_step'] as int? ?? 0,
      isWizardCompleted: json['wizard_completed'] as bool? ?? false,
      joinDate: json['join_date'] == null
          ? null
          : DateTime.parse(json['join_date'] as String),
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      imageUrl: json['image_url'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email_verified': instance.isEmailVerified,
      'mobile_verified': instance.isMobileVerified,
      'wizard_step': instance.wizardStep,
      'wizard_completed': instance.isWizardCompleted,
      'mobile': instance.mobile,
      'address': instance.address,
      'image_url': instance.imageUrl,
    };
