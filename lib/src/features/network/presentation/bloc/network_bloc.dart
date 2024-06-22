import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

part 'network_event.dart';
part 'network_state.dart';

@injectable
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc({
    required NetworkUseCase networkUseCase,
  })  : _networkUseCase = networkUseCase,
        super(NetworkState.initial()) {
    on<ConnectionInvitationsFetched>(_onConnectionInvitationsFetched);
    on<RecommendationsFetched>(_onRecommendationsFetched);
    on<ConnectionsFetched>(_onConnectionsFetched);
    on<ConnectionAccepted>(_onConnectionAccepted);
    on<ConnectionRejected>(_onConnectionRejected);
    on<ConnectionReqSent>(_onConnectionReqSent);
    on<RecommendationCancelled>(_onRecommendationCancelled);
    on<ConnectionChecked>(_onConnectionChecked);
  }

  Future<void> _onConnectionInvitationsFetched(
    ConnectionInvitationsFetched event,
    Emitter<NetworkState> emit,
  ) async {
    emit(
      state.copyWith(
        inviteStatus: InviteStatus.loading,
      ),
    );

    final result = await _networkUseCase.fetchConnectionInvitations(
      userId: event.userId,
      offset: 1,
      limit: 10,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          inviteStatus: InviteStatus.failure,
          failure: failure,
        ),
      ),
      (connectionInvitations) => emit(
        state.copyWith(
          inviteStatus: InviteStatus.success,
          connectionInvitations: connectionInvitations,
        ),
      ),
    );
  }

  Future<void> _onRecommendationsFetched(
    RecommendationsFetched event,
    Emitter<NetworkState> emit,
  ) async {
    emit(
      state.copyWith(
        recommendationStatus: RecommendationStatus.loading,
      ),
    );

    final result = await _networkUseCase.fetchRecommendations(
      userId: event.userId,
      offset: 1,
      limit: 10,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          recommendationStatus: RecommendationStatus.failure,
          failure: failure,
        ),
      ),
      (recommendations) => emit(
        state.copyWith(
          recommendationStatus: RecommendationStatus.success,
          recommendations: recommendations,
        ),
      ),
    );
  }

  Future<void> _onConnectionsFetched(
    ConnectionsFetched event,
    Emitter<NetworkState> emit,
  ) async {
    emit(
      state.copyWith(
        connectionStatus: ConnectionStatus.loading,
      ),
    );

    final result = await _networkUseCase.fetchConnections(
      userId: event.userId,
      offset: 1,
      limit: 10,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          connectionStatus: ConnectionStatus.failure,
          failure: failure,
        ),
      ),
      (connections) => emit(
        state.copyWith(
          connectionStatus: ConnectionStatus.success,
          connections: connections,
        ),
      ),
    );
  }

  Future<void> _onConnectionAccepted(
    ConnectionAccepted event,
    Emitter<NetworkState> emit,
  ) async {
    final result = await _networkUseCase.acceptConnection(
      id: event.connectionId,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: NetworkStatus.failure,
          failure: failure,
        ),
      ),
      (connection) => emit(
        state.copyWith(
          status: NetworkStatus.success,
          connectionInvitations: state.connectionInvitations
              .where((invitation) => invitation?.id != event.connectionId)
              .toList(),
        ),
      ),
    );

    add(
      ConnectionsFetched(
        userId: event.userId,
        offset: 1,
        limit: 6,
      ),
    );
  }

  Future<void> _onConnectionRejected(
    ConnectionRejected event,
    Emitter<NetworkState> emit,
  ) async {
    final result = await _networkUseCase.rejectConnection(
      id: event.connectionId,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: NetworkStatus.failure,
          failure: failure,
        ),
      ),
      (connection) => emit(
        state.copyWith(
          status: NetworkStatus.success,
          connectionInvitations: state.connectionInvitations
              .where((invitation) => invitation?.id != event.connectionId)
              .toList(),
        ),
      ),
    );
  }

  Future<void> _onConnectionReqSent(
    ConnectionReqSent event,
    Emitter<NetworkState> emit,
  ) async {
    final result = await _networkUseCase.sendConnection(
      sendConnectionReq: event.sendConnectionReq,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: NetworkStatus.failure,
          failure: failure,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: NetworkStatus.success,
          recommendations: state.recommendations
              .map(
                (recommendation) => recommendation?.userId ==
                        event.sendConnectionReq.recipientId
                    ? recommendation?.copyWith(
                        status: ConnectionInvitationStatus.pending,
                      )
                    : recommendation,
              )
              .toList(),
          userConnectionStatus: const UserConnectionStatus(
            status: ConnectionInvitationStatus.pending,
          ),
        ),
      ),
    );
  }

  Future<void> _onRecommendationCancelled(
    RecommendationCancelled event,
    Emitter<NetworkState> emit,
  ) async {
    final result = await _networkUseCase.cancelRecommendation(
      cancelRecommendationReq: CancelRecommendationReq(
        recommendedUserId: event.recommendedUserId,
      ),
    );
    result.fold(
        (failure) => emit(
              state.copyWith(
                status: NetworkStatus.failure,
                failure: failure,
              ),
            ), (_) {
      emit(
        state.copyWith(
          status: NetworkStatus.success,
          recommendations: state.recommendations
              .where(
                (recommendation) =>
                    recommendation?.userId != event.recommendedUserId,
              )
              .toList(),
        ),
      );
    });
  }

  Future<void> _onConnectionChecked(
    ConnectionChecked event,
    Emitter<NetworkState> emit,
  ) async {
    emit(
      state.copyWith(
        status: NetworkStatus.loading,
      ),
    );

    final result = await _networkUseCase.checkConnection(
      userId: event.userId,
      otherUserId: event.otherUserId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: NetworkStatus.failure,
          failure: failure,
        ),
      ),
      (userConnectionStatus) {
        emit(
          state.copyWith(
            status: NetworkStatus.success,
            userConnectionStatus: userConnectionStatus,
          ),
        );
      },
    );
  }

  final NetworkUseCase _networkUseCase;
}
