// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_likes_and_comments_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLikesAndCommentsCount _$PostLikesAndCommentsCountFromJson(
        Map<String, dynamic> json) =>
    PostLikesAndCommentsCount(
      likes: (json['likes'] as num).toInt(),
      comments: (json['comments'] as num).toInt(),
    );

Map<String, dynamic> _$PostLikesAndCommentsCountToJson(
        PostLikesAndCommentsCount instance) =>
    <String, dynamic>{
      'likes': instance.likes,
      'comments': instance.comments,
    };
