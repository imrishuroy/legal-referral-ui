// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikePostReq _$LikePostReqFromJson(Map<String, dynamic> json) => LikePostReq(
      userId: json['user_id'] as String,
      senderId: json['sender_id'] as String,
      postId: (json['post_id'] as num).toInt(),
    );

Map<String, dynamic> _$LikePostReqToJson(LikePostReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'sender_id': instance.senderId,
      'post_id': instance.postId,
    };
