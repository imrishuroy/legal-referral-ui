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
      isEmailVerified: json['is_email_verified'] as bool,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_email_verified': instance.isEmailVerified,
    };
