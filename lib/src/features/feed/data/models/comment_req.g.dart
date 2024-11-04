// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentReq _$CommentReqFromJson(Map<String, dynamic> json) => CommentReq(
      userId: json['user_id'] as String,
      senderId: json['sender_id'] as String,
      postId: (json['post_id'] as num).toInt(),
      content: json['content'] as String,
      parentCommentId: (json['parent_comment_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommentReqToJson(CommentReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'sender_id': instance.senderId,
      'post_id': instance.postId,
      'content': instance.content,
      'parent_comment_id': instance.parentCommentId,
    };
