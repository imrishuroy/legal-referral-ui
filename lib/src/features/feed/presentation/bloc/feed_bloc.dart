import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';

part 'feed_event.dart';
part 'feed_state.dart';

@singleton
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({required FeedUsecase feedUsecase})
      : _feedUsecase = feedUsecase,
        super(FeedState.initial()) {
    on<FeedsFetched>(_onFeedsFetched);
  }

  final FeedUsecase _feedUsecase;

  Future<void> _onFeedsFetched(
    FeedsFetched event,
    Emitter<FeedState> emit,
  ) async {
    emit(state.copyWith(status: FeedStatus.loading));
    final response = await _feedUsecase.fetchFeeds(
      userId: event.userId,
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
          ),
        );
      },
    );
  }
}
