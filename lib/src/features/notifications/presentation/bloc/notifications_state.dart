part of 'notifications_bloc.dart';

enum NotificationsStatus { initial, loading, success, failure }

class NotificationsState extends Equatable {
  const NotificationsState({
    required this.status,
    required this.notifications,
    this.offset = 1,
    this.hasReachedMax = false,
    this.failure,
  });

  factory NotificationsState.initial() {
    return const NotificationsState(
      status: NotificationsStatus.initial,
      notifications: [],
    );
  }

  final NotificationsStatus status;
  final List<Notification> notifications;
  final int offset;
  final bool hasReachedMax;
  final Failure? failure;

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<Notification>? notifications,
    int? offset,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      offset: offset ?? this.offset,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        notifications,
        offset,
        hasReachedMax,
        failure,
      ];
}
