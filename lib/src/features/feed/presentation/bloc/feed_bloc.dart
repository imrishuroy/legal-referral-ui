import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/data/data.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'feed_event.dart';
part 'feed_state.dart';

const _limit = 10;

const _throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> _throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@singleton
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({
    required FeedUsecase feedUsecase,
    required PostUsecase postUsecase,
    required SavedPostsUsecase savedPostUseCase,
    required AuthBloc authBloc,
  })  : _feedUsecase = feedUsecase,
        _postUsecase = postUsecase,
        _savedPostUseCase = savedPostUseCase,
        _authBloc = authBloc,
        super(FeedState.initial()) {
    on<FeedsFetched>(
      _onFeedsFetched,
      transformer: _throttleDroppable(_throttleDuration),
    );
    on<FeedRefreshed>(_onFeedRefreshed);
    on<FeedPostLiked>(_onFeedPostLiked);
    on<FeedPostUnliked>(_onFeedPostUnliked);
    on<PostLikedUsersFetched>(_onPostLikedUsersFetched);
    on<Commented>(_onCommented);
    on<CommentsFetched>(_onCommentsFetched);
    on<CommentLiked>(_onCommentLiked);
    on<CommentUnliked>(_onCommentUnliked);
    on<FeedDetailsInitialized>(_onFeedDetailsInitialized);
    on<ParentCommentIdChanged>(_onParentCommentIdChanged);
    on<PostLikesAndCommentsCountFetched>(_onPostLikesAndCommentsCountFetched);
    on<PostIsLikedFetched>(_onIsLikedPostFetched);
    on<PostSaved>(_onPostSaved);
    on<FeaturePostSaved>(_onFeaturePostSaved);
    on<PostDeleted>(_onPostDeleted);
  }

  final FeedUsecase _feedUsecase;
  final PostUsecase _postUsecase;
  final SavedPostsUsecase _savedPostUseCase;
  final AuthBloc _authBloc;

  Future<void> _onFeedsFetched(
    FeedsFetched event,
    Emitter<FeedState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (state.status == FeedStatus.initial) {
      emit(state.copyWith(status: FeedStatus.loading));
      final response = await _feedUsecase.fetchFeeds(
        userId: event.userId,
        limit: _limit,
        offset: state.offset,
      );

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              status: FeedStatus.failure,
              failure: failure,
            ),
          );
        },
        (feeds) {
          emit(
            state.copyWith(
              status: FeedStatus.success,
              feeds: feeds,
              offset: state.offset + 1,
              hasReachedMax: feeds.length < _limit,
            ),
          );
        },
      );
    } else {
      final response = await _feedUsecase.fetchFeeds(
        userId: event.userId,
        limit: _limit,
        offset: state.offset,
      );

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              status: FeedStatus.failure,
              failure: failure,
            ),
          );
        },
        (feeds) {
          emit(
            state.copyWith(
              status: FeedStatus.success,
              feeds: List.of(state.feeds)..addAll(feeds),
              offset: state.offset + 1,
              hasReachedMax: feeds.length < _limit,
            ),
          );
        },
      );
    }
  }

  Future<void> _onFeedRefreshed(
    FeedRefreshed event,
    Emitter<FeedState> emit,
  ) async {
    emit(FeedState.initial());
    add(FeedsFetched(userId: event.userId));
  }

  Future<void> _onFeedPostLiked(
    FeedPostLiked event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _postUsecase.likePost(
      postId: event.postId,
    );

    if (response.isRight()) {
      final index = event.index;
      var feed = state.feed;
      final feeds = List.of(state.feeds);
      Feed? updatedFeed;
      if (feed == null && index != null) {
        feed = feeds[index];
      }
      updatedFeed = feed?.copyWith(
        feedPost: feed.feedPost?.copyWith(
          likesCount: feed.feedPost?.isLiked ?? false
              ? (state.feed?.feedPost?.likesCount ?? 0) > 0
                  ? (state.feed?.feedPost?.likesCount ?? 0) - 1
                  : 0
              : (state.feed?.feedPost?.likesCount ?? 0) + 1,
          isLiked: !feed.feedPost!.isLiked,
        ),
      );

      if (index != null) {
        if (index >= 0 && index < feeds.length) {
          feeds[index] = updatedFeed;
        }
      }

      emit(
        state.copyWith(
          feeds: feeds,
          feed: updatedFeed,
          status: FeedStatus.success,
          postLikedUsers: [
            _authBloc.state.user,
            ...state.postLikedUsers,
          ],
        ),
      );
    }
  }

  Future<void> _onFeedPostUnliked(
    FeedPostUnliked event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _postUsecase.unlikePost(
      postId: event.postId,
    );

    if (response.isRight()) {
      final index = event.index;
      var feed = state.feed;
      final feeds = List.of(state.feeds);

      if (feed == null && index != null) {
        feed = feeds[index];
      }

      Feed? updatedFeed;
      updatedFeed = feed?.copyWith(
        feedPost: feed.feedPost?.copyWith(
          likesCount: feed.feedPost?.isLiked ?? false
              ? (state.feed?.feedPost?.likesCount ?? 0) > 0
                  ? (state.feed?.feedPost?.likesCount ?? 0) - 1
                  : 0
              : (state.feed?.feedPost?.likesCount ?? 0) + 1,
          isLiked: !feed.feedPost!.isLiked,
        ),
      );

      if (index != null) {
        if (index >= 0 && index < feeds.length) {
          feeds[index] = updatedFeed;
        }
      }

      final postLikesUsers = List.of(state.postLikedUsers);

      emit(
        state.copyWith(
          feeds: feeds,
          feed: updatedFeed,
          postLikedUsers: postLikesUsers..removeAt(0),
          status: FeedStatus.success,
        ),
      );
    }
  }

  Future<void> _onPostLikedUsersFetched(
    PostLikedUsersFetched event,
    Emitter<FeedState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FeedStatus.loading,
      ),
    );

    final response = await _feedUsecase.fetchPostLikedUsers(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FeedStatus.failure,
            failure: failure,
          ),
        );
      },
      (postLikedUsers) {
        emit(
          state.copyWith(
            status: FeedStatus.success,
            postLikedUsers: postLikedUsers,
          ),
        );
      },
    );
  }

  Future<void> _onCommented(
    Commented event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _feedUsecase.commentPost(
      commentReq: event.comment,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FeedStatus.failure,
            failure: failure,
          ),
        );
      },
      (comment) {
        final index = event.index;
        final feeds = List.of(state.feeds);
        Feed? updatedFeed;
        if (index >= 0 && index < feeds.length) {
          final feed = feeds[index];
          updatedFeed = feed?.copyWith(
            feedPost: feed.feedPost?.copyWith(
              commentsCount: feed.feedPost!.commentsCount + 1,
            ),
          );
          feeds[index] = updatedFeed;
        }

        emit(
          state.copyWith(
            comments: [
              ...state.comments,
              comment?.copyWith(
                authorUserId: event.user?.userId ?? '',
                authorAvatarUrl: event.user?.avatarUrl,
                authorFirstName: event.user?.firstName,
                authorLastName: event.user?.lastName,
                authorPracticeArea: event.user?.practiceArea,
              ),
            ],
            feeds: feeds,
            feed: updatedFeed,
            status: FeedStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onCommentsFetched(
    CommentsFetched event,
    Emitter<FeedState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FeedStatus.loading,
      ),
    );

    final response = await _feedUsecase.fetchPostComments(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FeedStatus.failure,
            failure: failure,
          ),
        );
      },
      (comments) {
        emit(
          state.copyWith(
            status: FeedStatus.success,
            comments: comments,
          ),
        );
      },
    );
  }

  Future<void> _onCommentLiked(
    CommentLiked event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _feedUsecase.likeComment(
      commentId: event.commentId,
    );

    response.fold(
      (failure) {},
      (_) {
        final comments = List.of(state.comments);

        final commentId = event.commentId;

        final index =
            comments.indexWhere((comment) => comment?.commentId == commentId);

        if (index >= 0 && index < comments.length) {
          final comment = comments[index];
          final updatedComment = comment?.copyWith(
            likesCount: comment.isLiked
                ? comment.likesCount - 1
                : comment.likesCount + 1,
            isLiked: !comment.isLiked,
          );
          comments[index] = updatedComment;
        }

        emit(
          state.copyWith(
            status: FeedStatus.success,
            comments: comments,
          ),
        );
      },
    );
  }

  Future<void> _onCommentUnliked(
    CommentUnliked event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _feedUsecase.unlikeComment(
      commentId: event.commentId,
    );

    response.fold(
      (_) {},
      (_) {
        final comments = List.of(state.comments);

        final commentId = event.commentId;

        final index =
            comments.indexWhere((comment) => comment?.commentId == commentId);

        if (index >= 0 && index < comments.length) {
          final comment = comments[index];
          final updatedComment = comment?.copyWith(
            likesCount: comment.isLiked
                ? comment.likesCount - 1
                : comment.likesCount + 1,
            isLiked: !comment.isLiked,
          );
          comments[index] = updatedComment;
        }

        emit(
          state.copyWith(
            status: FeedStatus.success,
            comments: comments,
          ),
        );
      },
    );
  }

  void _onFeedDetailsInitialized(
    FeedDetailsInitialized event,
    Emitter<FeedState> emit,
  ) {
    emit(
      state.copyWith(
        feed: event.feed,
      ),
    );
  }

  void _onParentCommentIdChanged(
    ParentCommentIdChanged event,
    Emitter<FeedState> emit,
  ) {
    emit(
      state.copyWith(
        parentCommentId: event.parentCommentId,
      ),
    );
  }

  Future<void> _onPostLikesAndCommentsCountFetched(
    PostLikesAndCommentsCountFetched event,
    Emitter<FeedState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FeedStatus.loading,
      ),
    );

    final response = await _feedUsecase.fetchPostLikesAndCommentsCount(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FeedStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        emit(
          state.copyWith(
            status: FeedStatus.success,
            feed: state.feed?.copyWith(
              feedPost: state.feed?.feedPost?.copyWith(
                likesCount: res.likes,
                commentsCount: res.comments,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onIsLikedPostFetched(
    PostIsLikedFetched event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _feedUsecase.isPostLiked(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FeedStatus.failure,
            failure: failure,
          ),
        );
      },
      (isLiked) {
        emit(
          state.copyWith(
            status: FeedStatus.success,
            feed: state.feed?.copyWith(
              feedPost: state.feed?.feedPost?.copyWith(
                isLiked: isLiked,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onPostSaved(
    PostSaved event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _savedPostUseCase.savePost(
      userId: event.userId,
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            feedActionsStatus: FeedActionsStatus.failure,
            failure: failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            feedActionsStatus: FeedActionsStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onFeaturePostSaved(
    FeaturePostSaved event,
    Emitter<FeedState> emit,
  ) async {
    final saveFeaturePostReq = SaveFeaturePostReq(
      userId: event.userId,
      postId: event.postId,
    );

    final response = await _feedUsecase.saveFeaturePost(
      saveFeaturePostReq: saveFeaturePostReq,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            feedActionsStatus: FeedActionsStatus.failure,
            failure: failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            feedActionsStatus: FeedActionsStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onPostDeleted(
    PostDeleted event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _postUsecase.deletePost(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            feedActionsStatus: FeedActionsStatus.failure,
            failure: failure,
          ),
        );
      },
      (_) {
        final feeds = List.of(state.feeds);
        feeds.removeWhere(
          (feed) => feed?.feedPost?.post?.postId == event.postId,
        );

        emit(
          state.copyWith(
            feedActionsStatus: FeedActionsStatus.success,
            feeds: feeds,
          ),
        );
      },
    );
  }
}
