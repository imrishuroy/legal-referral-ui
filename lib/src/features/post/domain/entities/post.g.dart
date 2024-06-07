// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postId: json['post_id'] as String,
      ownerId: json['owner_id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      type: $enumDecode(_$PostTypeEnumMap, json['type']),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['poll_id'] as String),
      pollId: json['pollId'] as String?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'content': instance.content,
      'type': _$PostTypeEnumMap[instance.type]!,
      'poll_id': const DateTimeJsonConverter().toJson(instance.createdAt),
      'pollId': instance.pollId,
    };

const _$PostTypeEnumMap = {
  PostType.text: 'text',
  PostType.image: 'image',
  PostType.video: 'video',
  PostType.poll: 'poll',
};
