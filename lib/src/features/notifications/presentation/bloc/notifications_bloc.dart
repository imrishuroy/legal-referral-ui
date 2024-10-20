import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/notifications/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

const _limit = 10;

const _throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> _throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({required NotificationsUsecase notificationsUsecase})
      : _notificationsUsecase = notificationsUsecase,
        super(NotificationsState.initial()) {
    on<NotificationsFetched>(
      _onNotificationsFetched,
      transformer: _throttleDroppable(_throttleDuration),
    );
  }

  final NotificationsUsecase _notificationsUsecase;

  Future<void> _onNotificationsFetched(
    NotificationsFetched event,
    Emitter<NotificationsState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (state.status == NotificationsStatus.initial) {
      emit(state.copyWith(status: NotificationsStatus.loading));
      final result = await _notificationsUsecase.fetchNotifications(
        userId: event.userId,
        limit: _limit,
        offset: state.offset,
      );

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: NotificationsStatus.failure,
            failure: failure,
          ),
        ),
        (notifications) {
          emit(
            state.copyWith(
              status: NotificationsStatus.success,
              notifications: notifications,
              offset: state.offset + 1,
              hasReachedMax: notifications.length < _limit,
            ),
          );
        },
      );
    } else {
      final result = await _notificationsUsecase.fetchNotifications(
        userId: event.userId,
        limit: _limit,
        offset: state.offset,
      );
      result.fold(
        (failure) => emit(
          state.copyWith(
            status: NotificationsStatus.failure,
            failure: failure,
          ),
        ),
        (notifications) {
          emit(
            state.copyWith(
              status: NotificationsStatus.success,
              notifications: List.of(state.notifications)
                ..addAll(notifications),
              offset: state.offset + 1,
              hasReachedMax: notifications.length < _limit,
            ),
          );
        },
      );
    }
  }
}
