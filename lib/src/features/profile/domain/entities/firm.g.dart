// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirmImpl _$$FirmImplFromJson(Map<String, dynamic> json) => _$FirmImpl(
      name: json['name'] as String,
      orgType: json['org_type'] as String,
      logoUrl: json['logo_url'] as String,
      website: json['website'] as String,
      location: json['location'] as String,
      about: json['about'] as String,
      firmId: json['firm_id'] as int?,
    );

Map<String, dynamic> _$$FirmImplToJson(_$FirmImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'org_type': instance.orgType,
      'logo_url': instance.logoUrl,
      'website': instance.website,
      'location': instance.location,
      'about': instance.about,
    };
