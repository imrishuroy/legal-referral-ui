part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class NotificationsFetched extends NotificationsEvent {
  const NotificationsFetched({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}
