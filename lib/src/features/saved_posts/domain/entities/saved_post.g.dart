// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedPostImpl _$$SavedPostImplFromJson(Map<String, dynamic> json) =>
    _$SavedPostImpl(
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
      owner: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
      savedPostId: (json['saved_post_id'] as num).toInt(),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
    );

Map<String, dynamic> _$$SavedPostImplToJson(_$SavedPostImpl instance) =>
    <String, dynamic>{
      'post': instance.post,
      'user': instance.owner,
      'saved_post_id': instance.savedPostId,
      'created_at': const DateTimeJsonConverter().toJson(instance.createdAt),
    };
