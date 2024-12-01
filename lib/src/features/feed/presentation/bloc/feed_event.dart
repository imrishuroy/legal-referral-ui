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

class FeedPostLiked extends FeedEvent {
  const FeedPostLiked({
    required this.userId,
    required this.senderId,
    required this.postId,
    required this.index,
    required this.isFromeDetails,
  });
  final String userId;
  final String senderId;
  final int postId;
  final int index;
  final bool isFromeDetails;

  @override
  List<Object> get props => [userId, senderId, postId, index, isFromeDetails];
}

class FeedPostUnliked extends FeedEvent {
  const FeedPostUnliked({
    required this.postId,
    required this.index,
    required this.isFromeDetails,
  });
  final int postId;
  final int index;
  final bool isFromeDetails;

  @override
  List<Object> get props => [postId, index, isFromeDetails];
}

class FeedPostLikedUsersFetched extends FeedEvent {
  const FeedPostLikedUsersFetched({
    required this.postId,
  });
  final int postId;

  @override
  List<Object> get props => [postId];
}

class FeedPostCommented extends FeedEvent {
  const FeedPostCommented({
    required this.comment,
    required this.user,
    required this.index,
  });
  final CommentReq comment;
  final AppUser? user;
  final int index;
}

class FeedPostCommentsFetched extends FeedEvent {
  const FeedPostCommentsFetched({
    required this.postId,
  });
  final int postId;

  @override
  List<Object> get props => [postId];
}

class FeedPostCommentLiked extends FeedEvent {
  const FeedPostCommentLiked({
    required this.commentId,
  });
  final int commentId;

  @override
  List<Object> get props => [commentId];
}

class FeedPostCommentUnliked extends FeedEvent {
  const FeedPostCommentUnliked({
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

class FeedPostParentCommentIdChanged extends FeedEvent {
  const FeedPostParentCommentIdChanged({
    required this.parentCommentId,
  });
  final int parentCommentId;

  @override
  List<Object> get props => [parentCommentId];
}

class PostLikesAndCommentsCountFetched extends FeedEvent {
  const PostLikesAndCommentsCountFetched({
    required this.postId,
  });
  final int postId;

  @override
  List<Object> get props => [postId];
}

class PostIsLikedFetched extends FeedEvent {
  const PostIsLikedFetched({
    required this.postId,
  });
  final int postId;

  @override
  List<Object> get props => [postId];
}

class PostSaved extends FeedEvent {
  const PostSaved({
    required this.userId,
    required this.postId,
  });
  final String userId;
  final int postId;

  @override
  List<Object> get props => [userId, postId];
}

class FeaturePostSaved extends FeedEvent {
  const FeaturePostSaved({
    required this.userId,
    required this.postId,
  });
  final String userId;
  final int postId;

  @override
  List<Object> get props => [userId, postId];
}

class PostDeleted extends FeedEvent {
  const PostDeleted({
    required this.postId,
  });
  final int postId;

  @override
  List<Object> get props => [postId];
}
