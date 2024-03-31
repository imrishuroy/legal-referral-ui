// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LicenseImpl _$$LicenseImplFromJson(Map<String, dynamic> json) =>
    _$LicenseImpl(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      licenseNumber: json['license_number'] as String,
      issueDate: json['issue_date'] as String,
      issueState: json['issue_state'] as String,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$LicenseImplToJson(_$LicenseImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'license_number': instance.licenseNumber,
      'issue_date': instance.issueDate,
      'issue_state': instance.issueState,
      'id': instance.id,
    };
