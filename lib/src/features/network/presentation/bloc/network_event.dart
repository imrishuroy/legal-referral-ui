part of 'network_bloc.dart';

sealed class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class ConnectionInvitationsFetched extends NetworkEvent {
  const ConnectionInvitationsFetched({
    required this.userId,
    required this.offset,
    required this.limit,
  });
  final String userId;
  final int offset;
  final int limit;

  @override
  List<Object> get props => [userId, offset, limit];
}

class RecommendationsFetched extends NetworkEvent {
  const RecommendationsFetched({
    required this.userId,
    required this.offset,
    required this.limit,
  });
  final String userId;
  final int offset;
  final int limit;

  @override
  List<Object> get props => [userId, offset, limit];
}

class ConnectionsFetched extends NetworkEvent {
  const ConnectionsFetched({
    required this.userId,
    required this.offset,
    required this.limit,
  });
  final String userId;
  final int offset;
  final int limit;

  @override
  List<Object> get props => [userId, offset, limit];
}

class ConnectionReqSent extends NetworkEvent {
  const ConnectionReqSent({
    required this.sendConnectionReq,
  });

  final SendConnectionReq sendConnectionReq;

  @override
  List<Object> get props => [sendConnectionReq];
}

class ConnectionAccepted extends NetworkEvent {
  const ConnectionAccepted({
    required this.connectionId,
    required this.userId,
  });

  final int connectionId;
  final String userId;

  @override
  List<Object> get props => [connectionId, userId];
}

class ConnectionRejected extends NetworkEvent {
  const ConnectionRejected({
    required this.connectionId,
  });

  final int connectionId;

  @override
  List<Object> get props => [connectionId];
}

class RecommendationCancelled extends NetworkEvent {
  const RecommendationCancelled({
    required this.recommendedUserId,
  });

  final String recommendedUserId;

  @override
  List<Object> get props => [recommendedUserId];
}

class ConnectionChecked extends NetworkEvent {
  const ConnectionChecked({
    required this.userId,
    required this.otherUserId,
  });

  final String userId;
  final String otherUserId;

  @override
  List<Object> get props => [userId, otherUserId];
}
