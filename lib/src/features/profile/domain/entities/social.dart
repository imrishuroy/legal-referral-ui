import 'package:freezed_annotation/freezed_annotation.dart';

part 'social.freezed.dart';
part 'social.g.dart';

enum EntityType { user, firm }

enum SocialPlatform { facebook, twitter, linkedin, instagram, snapchat }

@freezed
class Social with _$Social {
  const factory Social({
    @JsonKey(name: 'entity_type') required EntityType entityType,
    @JsonKey(name: 'platform') required SocialPlatform platform,
    @JsonKey(name: 'link') required String link,
    @JsonKey(name: 'social_id', includeToJson: false) int? socialId,
    @JsonKey(name: 'entity_id', includeToJson: false) String? entityId,
  }) = _Social;

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);
}
