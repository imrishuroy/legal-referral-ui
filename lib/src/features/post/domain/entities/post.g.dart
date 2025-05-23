// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
      ownerId: json['owner_id'] as String,
      postType: $enumDecode(_$PostTypeEnumMap, json['post_type']),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
      postId: (json['post_id'] as num).toInt(),
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool?,
      ownerFirstName: json['owner_first_name'] as String?,
      ownerLastName: json['owner_last_name'] as String?,
      ownerAvatarUrl: json['owner_avatar_url'] as String?,
      ownerPracticeArea: json['owner_practice_area'] as String?,
      content: json['content'] as String?,
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      pollId: (json['poll_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
      'owner_id': instance.ownerId,
      'post_type': _$PostTypeEnumMap[instance.postType]!,
      'post_id': instance.postId,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'is_liked': instance.isLiked,
      'owner_first_name': instance.ownerFirstName,
      'owner_last_name': instance.ownerLastName,
      'owner_avatar_url': instance.ownerAvatarUrl,
      'owner_practice_area': instance.ownerPracticeArea,
      'content': instance.content,
      'media': instance.media,
      if (instance.pollId case final value?) 'poll_id': value,
    };

const _$PostTypeEnumMap = {
  PostType.text: 'text',
  PostType.image: 'image',
  PostType.document: 'document',
  PostType.link: 'link',
  PostType.video: 'video',
  PostType.poll: 'poll',
};
