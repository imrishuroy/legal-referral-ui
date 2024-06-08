// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedImpl _$$FeedImplFromJson(Map<String, dynamic> json) => _$FeedImpl(
      feedId: (json['feed_id'] as num).toInt(),
      user: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedImplToJson(_$FeedImpl instance) =>
    <String, dynamic>{
      'feed_id': instance.feedId,
      'user': instance.user,
      'created_at': const DateTimeJsonConverter().toJson(instance.createdAt),
      'post': instance.post,
    };
