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

  @override
  List<Object> get props => [postId, index];
}

class PostUnliked extends FeedEvent {
  const PostUnliked({
    required this.postId,
    required this.index,
  });
  final int postId;
  final int index;

  @override
  List<Object> get props => [postId, index];
}
