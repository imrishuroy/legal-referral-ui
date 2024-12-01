part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostTextChanged extends PostEvent {
  const PostTextChanged({
    required this.text,
  });

  final String text;

  @override
  List<Object> get props => [text];
}

class PostCreated extends PostEvent {
  const PostCreated({
    required this.ownerId,
    required this.content,
  });

  final String ownerId;
  final String content;

  @override
  List<Object> get props => [ownerId, content];
}

class FilePicked extends PostEvent {
  const FilePicked({required this.postType});

  final PostType postType;

  @override
  List<Object> get props => [postType];
}

class FileRemoved extends PostEvent {
  const FileRemoved({
    this.index,
  });

  final int? index;
}

class PostFetched extends PostEvent {
  const PostFetched({
    required this.postId,
  });

  final int postId;

  @override
  List<Object> get props => [postId];
}

class PostLikesAndCommentsCountFetched extends PostEvent {
  const PostLikesAndCommentsCountFetched({
    required this.postId,
  });

  final int postId;

  @override
  List<Object> get props => [postId];
}

class PostLiked extends PostEvent {
  const PostLiked({
    required this.postOwnerId,
    required this.currentUserId,
    required this.postId,
  });

  final String postOwnerId;
  final String currentUserId;
  final int postId;

  @override
  List<Object> get props => [postOwnerId, currentUserId, postId];
}

class PostUnliked extends PostEvent {
  const PostUnliked({
    required this.postId,
  });

  final int postId;

  @override
  List<Object> get props => [postId];
}

class PostLikedUsersFetched extends PostEvent {
  const PostLikedUsersFetched({
    required this.postId,
  });

  final int postId;

  @override
  List<Object> get props => [postId];
}

class PostCommented extends PostEvent {
  const PostCommented({
    required this.comment,
    required this.user,
  });

  final CommentReq comment;
  final AppUser? user;
}

class PostCommentsFetched extends PostEvent {
  const PostCommentsFetched({
    required this.postId,
  });

  final int postId;

  @override
  List<Object> get props => [postId];
}

class PostCommentLiked extends PostEvent {
  const PostCommentLiked({
    required this.commentId,
  });

  final int commentId;

  @override
  List<Object> get props => [commentId];
}

class PostCommentUnliked extends PostEvent {
  const PostCommentUnliked({
    required this.commentId,
  });

  final int commentId;

  @override
  List<Object> get props => [commentId];
}

class PostParentCommentIdChanged extends PostEvent {
  const PostParentCommentIdChanged({
    required this.parentCommentId,
  });

  final int parentCommentId;

  @override
  List<Object> get props => [parentCommentId];
}
