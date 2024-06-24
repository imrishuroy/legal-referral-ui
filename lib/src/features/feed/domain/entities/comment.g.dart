// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      commentId: (json['comment_id'] as num).toInt(),
      postId: (json['post_id'] as num).toInt(),
      content: json['content'] as String,
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
      authorUserId: json['author_user_id'] as String,
      parentCommentId: (json['parent_comment_id'] as num?)?.toInt(),
      authorFirstName: json['author_first_name'] as String?,
      authorLastName: json['author_last_name'] as String?,
      authorPracticeArea: json['author_practice_area'] as String?,
      authorAvatarUrl: json['author_avatar_url'] as String?,
      isLiked: json['is_liked'] as bool? ?? false,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'post_id': instance.postId,
      'content': instance.content,
      'created_at': const DateTimeJsonConverter().toJson(instance.createdAt),
      'author_user_id': instance.authorUserId,
      'parent_comment_id': instance.parentCommentId,
      'author_first_name': instance.authorFirstName,
      'author_last_name': instance.authorLastName,
      'author_practice_area': instance.authorPracticeArea,
      'author_avatar_url': instance.authorAvatarUrl,
      'is_liked': instance.isLiked,
      'likes_count': instance.likesCount,
    };
