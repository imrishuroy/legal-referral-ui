// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedImpl _$$FeedImplFromJson(Map<String, dynamic> json) => _$FeedImpl(
      feedId: (json['feed_id'] as num).toInt(),
      type: $enumDecode(_$FeedTypeEnumMap, json['feed_type']),
      post: json['feed_post'] == null
          ? null
          : Post.fromJson(json['feed_post'] as Map<String, dynamic>),
      ad: json['ad'] == null
          ? null
          : Ad.fromJson(json['ad'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedImplToJson(_$FeedImpl instance) =>
    <String, dynamic>{
      'feed_id': instance.feedId,
      'feed_type': _$FeedTypeEnumMap[instance.type]!,
      'feed_post': instance.post,
      'ad': instance.ad,
    };

const _$FeedTypeEnumMap = {
  FeedType.post: 'post',
  FeedType.ad: 'ad',
};
