part of 'feed_bloc.dart';

enum FeedStatus { initial, loading, success, failure }

class FeedState extends Equatable {
  const FeedState({
    required this.status,
    required this.feeds,
    this.offset = 1,
    this.hasReachedMax = false,
    this.postLikedUsers = const [],
    this.comments = const [],
    this.feed,
    this.parentCommentId,
    this.failure,
  });

  factory FeedState.initial() => const FeedState(
        status: FeedStatus.initial,
        feeds: [],
      );

  final FeedStatus status;

  final int offset;
  final List<Feed?> feeds;
  final bool hasReachedMax;
  final List<AppUser?> postLikedUsers;
  final List<Comment?> comments;
  final Feed? feed;
  final int? parentCommentId;
  final Failure? failure;

  FeedState copyWith({
    FeedStatus? status,
    int? offset,
    List<Feed?>? feeds,
    bool? hasReachedMax,
    List<AppUser?>? postLikedUsers,
    List<Comment?>? comments,
    Feed? feed,
    int? parentCommentId,
    Failure? failure,
  }) {
    return FeedState(
      status: status ?? this.status,
      offset: offset ?? this.offset,
      feeds: feeds ?? this.feeds,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      postLikedUsers: postLikedUsers ?? this.postLikedUsers,
      comments: comments ?? this.comments,
      feed: feed ?? this.feed,
      parentCommentId: parentCommentId,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        status,
        offset,
        feeds,
        hasReachedMax,
        postLikedUsers,
        comments,
        feed,
        parentCommentId,
        failure,
      ];
}
