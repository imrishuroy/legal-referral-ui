part of 'network_bloc.dart';

enum NetworkStatus { initial, loading, success, failure }

enum InviteStatus { initial, loading, success, failure }

enum RecommendationStatus { initial, loading, success, failure }

enum ConnectionStatus { initial, loading, success, failure }

class NetworkState extends Equatable {
  const NetworkState({
    this.status = NetworkStatus.initial,
    this.inviteStatus = InviteStatus.initial,
    this.recommendationStatus = RecommendationStatus.initial,
    this.connectionStatus = ConnectionStatus.initial,
    this.connectionInvitations = const [],
    this.recommendations = const [],
    this.connections = const [],
    this.userConnectionStatus = const UserConnectionStatus(
      status: ConnectionInvitationStatus.none,
    ),
    this.failure,
  });

  factory NetworkState.initial() {
    return const NetworkState();
  }

  final NetworkStatus status;
  final InviteStatus inviteStatus;
  final RecommendationStatus recommendationStatus;
  final ConnectionStatus connectionStatus;
  final List<ConnectionInvitation?> connectionInvitations;
  final List<Recommendation?> recommendations;
  final List<Connection?> connections;
  final UserConnectionStatus userConnectionStatus;
  final Failure? failure;

  NetworkState copyWith({
    NetworkStatus? status,
    InviteStatus? inviteStatus,
    RecommendationStatus? recommendationStatus,
    ConnectionStatus? connectionStatus,
    List<ConnectionInvitation?>? connectionInvitations,
    List<Recommendation?>? recommendations,
    List<Connection?>? connections,
    UserConnectionStatus? userConnectionStatus,
    Failure? failure,
  }) {
    return NetworkState(
      status: status ?? this.status,
      inviteStatus: inviteStatus ?? this.inviteStatus,
      recommendationStatus: recommendationStatus ?? this.recommendationStatus,
      connectionStatus: connectionStatus ?? this.connectionStatus,
      connectionInvitations:
          connectionInvitations ?? this.connectionInvitations,
      recommendations: recommendations ?? this.recommendations,
      connections: connections ?? this.connections,
      userConnectionStatus: userConnectionStatus ?? this.userConnectionStatus,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        inviteStatus,
        recommendationStatus,
        connectionStatus,
        connectionInvitations,
        recommendations,
        connections,
        userConnectionStatus,
        failure,
      ];
}
