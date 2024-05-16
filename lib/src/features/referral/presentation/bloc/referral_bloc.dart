import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

part 'referral_event.dart';
part 'referral_state.dart';

@injectable
class ReferralBloc extends Bloc<ReferralEvent, ReferralState> {
  ReferralBloc({
    required ReferralUseCases referralUseCases,
    required NetworkUseCase networkUseCase,
  })  : _referralUseCases = referralUseCases,
        _networkUseCase = networkUseCase,
        super(ReferralState.initial()) {
    on<ReferralCreated>(_onReferralCreated);
    on<ConnectionsFetched>(_onConnectionFetched);
    on<ConnectionSelected>(_onConnectionSelected);
    on<AllConnectionsSelected>(_onAllConnectionsSelected);
  }

  final ReferralUseCases _referralUseCases;
  final NetworkUseCase _networkUseCase;

  Future<void> _onReferralCreated(
    ReferralCreated event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));
    final res = await _referralUseCases.addReferral(
      referral: event.referral,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ReferralStatus.failure,
            failure: failure,
          ),
        );
      },
      (referral) {
        emit(
          state.copyWith(
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onConnectionFetched(
    ConnectionsFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _networkUseCase.fetchConnections(
      userId: event.userId,
      offset: 1,
      limit: 10,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ReferralStatus.failure,
            failure: failure,
          ),
        );
      },
      (connections) {
        emit(
          state.copyWith(
            connections: connections,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  void _onConnectionSelected(
    ConnectionSelected event,
    Emitter<ReferralState> emit,
  ) {
    final selectedConnections = state.selectedConnections;
    final connection = event.connection;

    if (selectedConnections.contains(connection)) {
      final updatedConnections =
          selectedConnections.where((c) => c != connection).toList();
      emit(state.copyWith(selectedConnections: updatedConnections));
    } else {
      final updatedConnections = [...selectedConnections, connection];
      emit(state.copyWith(selectedConnections: updatedConnections));
    }
  }

  void _onAllConnectionsSelected(
    AllConnectionsSelected event,
    Emitter<ReferralState> emit,
  ) {
    final connections = state.connections;
    emit(state.copyWith(selectedConnections: connections));
  }
}
