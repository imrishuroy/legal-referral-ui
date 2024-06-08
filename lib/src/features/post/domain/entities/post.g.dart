// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      ownerId: json['owner_id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      type: $enumDecode(_$PostTypeEnumMap, json['post_type']),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
      postId: (json['post_id'] as num).toInt(),
      filesUrls: (json['media'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      pollId: (json['poll_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) {
  final val = <String, dynamic>{
    'owner_id': instance.ownerId,
    'title': instance.title,
    'content': instance.content,
    'post_type': _$PostTypeEnumMap[instance.type]!,
    'post_id': instance.postId,
    'media': instance.filesUrls,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('poll_id', instance.pollId);
  return val;
}

const _$PostTypeEnumMap = {
  PostType.text: 'text',
  PostType.image: 'image',
  PostType.video: 'video',
  PostType.poll: 'poll',
};
