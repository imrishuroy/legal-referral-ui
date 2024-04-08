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
      emailVerified: json['email_verified'] as bool? ?? false,
      mobileVerified: json['mobile_verified'] as bool? ?? false,
      wizardStep: json['wizard_step'] as int? ?? 0,
      wizardCompleted: json['wizard_completed'] as bool? ?? false,
      joinDate: _$JsonConverterFromJson<String, DateTime?>(
          json['join_date'], const DateTimeConverter().fromJson),
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
      'signup_method': instance.signupMethod,
      'email_verified': instance.emailVerified,
      'mobile_verified': instance.mobileVerified,
      'wizard_step': instance.wizardStep,
      'wizard_completed': instance.wizardCompleted,
      'mobile': instance.mobile,
      'address': instance.address,
      'image_url': instance.imageUrl,
      'user_id': instance.userId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
