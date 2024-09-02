// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialImpl _$$SocialImplFromJson(Map<String, dynamic> json) => _$SocialImpl(
      entityType: $enumDecode(_$EntityTypeEnumMap, json['entity_type']),
      platform: $enumDecode(_$SocialPlatformEnumMap, json['platform']),
      link: json['link'] as String,
      socialId: (json['social_id'] as num?)?.toInt(),
      entityId: json['entity_id'] as String?,
    );

Map<String, dynamic> _$$SocialImplToJson(_$SocialImpl instance) =>
    <String, dynamic>{
      'entity_type': _$EntityTypeEnumMap[instance.entityType]!,
      'platform': _$SocialPlatformEnumMap[instance.platform]!,
      'link': instance.link,
    };

const _$EntityTypeEnumMap = {
  EntityType.user: 'user',
  EntityType.firm: 'firm',
};

const _$SocialPlatformEnumMap = {
  SocialPlatform.facebook: 'facebook',
  SocialPlatform.twitter: 'twitter',
  SocialPlatform.linkedin: 'linkedin',
  SocialPlatform.instagram: 'instagram',
  SocialPlatform.snapchat: 'snapchat',
  SocialPlatform.none: 'none',
};
