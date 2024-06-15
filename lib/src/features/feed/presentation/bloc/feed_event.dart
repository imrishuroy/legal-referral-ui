part of 'feed_bloc.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class FeedsFetched extends FeedEvent {
  const FeedsFetched({required this.userId});
  final String userId;

  @override
  List<Object> get props => [userId];
}

class FeedRefreshed extends FeedEvent {
  const FeedRefreshed({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}

class PostLiked extends FeedEvent {
  const PostLiked({
    required this.postId,
    required this.index,
  });
  final int postId;
  final int index;
}

class PostUnliked extends FeedEvent {
  const PostUnliked({
    required this.postId,
    required this.index,
  });
  final int postId;
  final int index;
}

class PostLikedUsersFetched extends FeedEvent {
  const PostLikedUsersFetched({
    required this.postId,
  });
  final int postId;

  @override
  List<Object> get props => [postId];
}

class Commented extends FeedEvent {
  const Commented({
    required this.comment,
    required this.user,
    required this.index,
  });
  final CommentReq comment;
  final AppUser? user;
  final int index;
}

class CommentsFetched extends FeedEvent {
  const CommentsFetched({
    required this.postId,
  });
  final int postId;

  @override
  List<Object> get props => [postId];
}

class CommentLiked extends FeedEvent {
  const CommentLiked({
    required this.commentId,
  });
  final int commentId;

  @override
  List<Object> get props => [commentId];
}

class CommentUnliked extends FeedEvent {
  const CommentUnliked({
    required this.commentId,
  });
  final int commentId;

  @override
  List<Object> get props => [commentId];
}

class FeedDetailsInitialized extends FeedEvent {
  const FeedDetailsInitialized({
    required this.feed,
  });
  final Feed? feed;
}

class ParentCommentIdChanged extends FeedEvent {
  const ParentCommentIdChanged({
    required this.parentCommentId,
  });
  final int parentCommentId;

  @override
  List<Object> get props => [parentCommentId];
}
