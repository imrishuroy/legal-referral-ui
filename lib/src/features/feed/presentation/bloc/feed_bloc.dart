import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
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
  })  : _feedUsecase = feedUsecase,
        _postUsecase = postUsecase,
        super(FeedState.initial()) {
    on<FeedsFetched>(
      _onFeedsFetched,
      transformer: _throttleDroppable(_throttleDuration),
    );
    on<FeedRefreshed>(_onFeedRefreshed);
    on<PostLiked>(_onPostLiked);
    on<PostUnliked>(_onPostUnliked);
  }

  final FeedUsecase _feedUsecase;
  final PostUsecase _postUsecase;

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

  Future<void> _onPostLiked(
    PostLiked event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _postUsecase.likePost(
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
      (_) {
        final updatedFeeds = List.of(state.feeds);
        final index = event.index;
        if (index >= 0 && index < updatedFeeds.length) {
          final feed = updatedFeeds[index];
          final updatedFeed = feed?.copyWith(
            likesCount:
                feed.isLiked ? feed.likesCount - 1 : feed.likesCount + 1,
            isLiked: !feed.isLiked,
          );
          updatedFeeds[index] = updatedFeed;
        }

        emit(
          state.copyWith(
            status: FeedStatus.success,
            feeds: updatedFeeds,
          ),
        );
      },
    );
  }

  Future<void> _onPostUnliked(
    PostUnliked event,
    Emitter<FeedState> emit,
  ) async {
    final response = await _postUsecase.unlikePost(
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
      (_) {
        final feeds = List.of(state.feeds);
        final index = event.index;
        if (index >= 0 && index < feeds.length) {
          final feed = feeds[index];
          final updatedFeed = feed?.copyWith(
            likesCount:
                feed.isLiked ? feed.likesCount - 1 : feed.likesCount + 1,
            isLiked: !feed.isLiked,
          );
          feeds[index] = updatedFeed;
        }

        emit(
          state.copyWith(
            status: FeedStatus.success,
            feeds: feeds,
          ),
        );
      },
    );
  }
}
