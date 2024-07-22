// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedImpl _$$FeedImplFromJson(Map<String, dynamic> json) => _$FeedImpl(
      type: $enumDecode(_$FeedTypeEnumMap, json['feed_type']),
      feedPost: json['feed_post'] == null
          ? null
          : FeedPost.fromJson(json['feed_post'] as Map<String, dynamic>),
      ad: json['ad'] == null
          ? null
          : Ad.fromJson(json['ad'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedImplToJson(_$FeedImpl instance) =>
    <String, dynamic>{
      'feed_type': _$FeedTypeEnumMap[instance.type]!,
      'feed_post': instance.feedPost,
      'ad': instance.ad,
    };

const _$FeedTypeEnumMap = {
  FeedType.post: 'post',
  FeedType.ad: 'ad',
};

_$FeedPostImpl _$$FeedPostImplFromJson(Map<String, dynamic> json) =>
    _$FeedPostImpl(
      user: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
      feedId: (json['feed_id'] as num?)?.toInt(),
      isLiked: json['is_liked'] as bool? ?? false,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedPostImplToJson(_$FeedPostImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'created_at': const DateTimeJsonConverter().toJson(instance.createdAt),
      'feed_id': instance.feedId,
      'is_liked': instance.isLiked,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'post': instance.post,
    };
