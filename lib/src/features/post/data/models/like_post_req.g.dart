// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikePostReq _$LikePostReqFromJson(Map<String, dynamic> json) => LikePostReq(
      postOwnerId: json['post_user_id'] as String,
      currentUserId: json['current_user_id'] as String,
      postId: (json['post_id'] as num).toInt(),
    );

Map<String, dynamic> _$LikePostReqToJson(LikePostReq instance) =>
    <String, dynamic>{
      'post_user_id': instance.postOwnerId,
      'current_user_id': instance.currentUserId,
      'post_id': instance.postId,
    };
