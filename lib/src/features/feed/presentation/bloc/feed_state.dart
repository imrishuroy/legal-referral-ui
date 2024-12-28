part of 'feed_bloc.dart';

enum FeedStatus { initial, loading, success, failure }

enum FeedAction {
  initial,
  edit,
  delete,
  save,
  unsave,
  like,
  unlike,
  comment,
  reply,
  report,
  block,
  featured,
  unfeatured,
}

enum FeedActionStatus { initial, loading, success, failure }

class FeedState extends Equatable {
  const FeedState({
    required this.feedAction,
    required this.status,
    required this.feeds,
    this.feedActionStatus,
    this.offset = 1,
    this.hasReachedMax = false,
    this.postLikedUsers = const [],
    this.comments = const [],
    this.feed,
    this.isPostFeatured = false,
    this.parentCommentId,
    this.isPostReported = false,
    this.failure,
  });

  factory FeedState.initial() => const FeedState(
        feedAction: FeedAction.initial,
        feedActionStatus: FeedActionStatus.initial,
        status: FeedStatus.initial,
        feeds: [],
      );

  final int offset;
  final List<Feed?> feeds;
  final bool hasReachedMax;
  final List<AppUser?> postLikedUsers;
  final List<Comment?> comments;
  final Feed? feed;
  final int? parentCommentId;
  final bool isPostFeatured;
  final FeedAction feedAction;
  final FeedActionStatus? feedActionStatus;
  final bool isPostReported;
  final FeedStatus status;
  final Failure? failure;

  FeedState copyWith({
    FeedAction? feedAction,
    FeedActionStatus? feedActionStatus,
    FeedStatus? status,
    int? offset,
    List<Feed?>? feeds,
    bool? hasReachedMax,
    List<AppUser?>? postLikedUsers,
    List<Comment?>? comments,
    bool? isPostFeatured,
    Feed? feed,
    int? parentCommentId,
    bool? isPostReported,
    Failure? failure,
  }) {
    return FeedState(
      feedAction: feedAction ?? this.feedAction,
      feedActionStatus: feedActionStatus ?? this.feedActionStatus,
      status: status ?? this.status,
      offset: offset ?? this.offset,
      feeds: feeds ?? this.feeds,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      postLikedUsers: postLikedUsers ?? this.postLikedUsers,
      comments: comments ?? this.comments,
      isPostFeatured: isPostFeatured ?? this.isPostFeatured,
      feed: feed ?? this.feed,
      parentCommentId: parentCommentId,
      isPostReported: isPostReported ?? this.isPostReported,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        feedAction,
        feedActionStatus,
        status,
        offset,
        feeds,
        hasReachedMax,
        postLikedUsers,
        comments,
        isPostFeatured,
        feed,
        parentCommentId,
        isPostReported,
        failure,
      ];
}
