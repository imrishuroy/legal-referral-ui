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
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
      ownerId: json['owner_id'] as String,
      postId: (json['post_id'] as num).toInt(),
      content: json['content'] as String?,
      postType: $enumDecode(_$PostTypeEnumMap, json['post_type']),
      pollId: (json['poll_id'] as num?)?.toInt(),
      ownerFirstName: json['owner_first_name'] as String?,
      ownerLastName: json['owner_last_name'] as String?,
      ownerAvatarUrl: json['owner_avatar_url'] as String?,
      ownerPracticeArea: json['owner_practice_area'] as String?,
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isLiked: json['is_liked'] as bool? ?? false,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FeedPostImplToJson(_$FeedPostImpl instance) =>
    <String, dynamic>{
      'created_at': const DateTimeJsonConverter().toJson(instance.createdAt),
      'owner_id': instance.ownerId,
      'post_id': instance.postId,
      'content': instance.content,
      'post_type': _$PostTypeEnumMap[instance.postType]!,
      'poll_id': instance.pollId,
      'owner_first_name': instance.ownerFirstName,
      'owner_last_name': instance.ownerLastName,
      'owner_avatar_url': instance.ownerAvatarUrl,
      'owner_practice_area': instance.ownerPracticeArea,
      'media': instance.media,
      'is_liked': instance.isLiked,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
    };

const _$PostTypeEnumMap = {
  PostType.text: 'text',
  PostType.image: 'image',
  PostType.document: 'document',
  PostType.link: 'link',
  PostType.video: 'video',
  PostType.poll: 'poll',
};
