import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
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
    on<ReferralAdded>(_onReferralAdded);
    on<ConnectionsFetched>(_onConnectionFetched);
    on<ConnectionSelected>(_onConnectionSelected);
    on<AllConnectionsSelected>(_onAllConnectionsSelected);
    on<ReferralFetched>(_onReferralFetched);
    on<ReferredUsersFetched>(_onReferredUsersFetched);
    on<ProposalsFetched>(_onProposalsFetched);
    on<ProposalFetched>(_onProposalFetched);
    on<ProposalEditToggled>(_onProposalEditToggled);
    on<ProposalSent>(_onProposalSent);
    on<ProposalUpdated>(_onProposalUpdated);
  }

  final ReferralUseCases _referralUseCases;
  final NetworkUseCase _networkUseCase;

  Future<void> _onReferralAdded(
    ReferralAdded event,
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
            status: ReferralStatus.referralAdded,
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

  Future<void> _onReferralFetched(
    ReferralFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchReferrals(
      userId: event.userId,
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
      (referrals) {
        emit(
          state.copyWith(
            referrals: referrals,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onReferredUsersFetched(
    ReferredUsersFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchReferredUsers(
      referralId: event.referralId,
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
      (referredUsers) {
        emit(
          state.copyWith(
            referredUsers: referredUsers,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProposalsFetched(
    ProposalsFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchProposals(
      userId: event.userId,
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
      (proposals) {
        emit(
          state.copyWith(
            proposals: proposals,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProposalFetched(
    ProposalFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchProposalByReferralId(
      referralId: event.referralId,
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
      (proposal) {
        emit(
          state.copyWith(
            proposalReq: proposal,
            isProposalEditing: proposal == null,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  void _onProposalEditToggled(
    ProposalEditToggled event,
    Emitter<ReferralState> emit,
  ) {
    emit(
      state.copyWith(
        isProposalEditing: !state.isProposalEditing,
      ),
    );
  }

  Future<void> _onProposalSent(
    ProposalSent event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.createProposal(
      proposalReq: event.proposalReq,
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
      (proposal) {
        debugPrint('Proposal sent ----: $proposal');
        emit(
          state.copyWith(
            proposalReq: proposal,
            isProposalEditing: false,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProposalUpdated(
    ProposalUpdated event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.updateProposal(
      proposalId: event.proposalId,
      proposalReq: event.proposalReq,
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
      (proposal) {
        emit(
          state.copyWith(
            proposalReq: proposal,
            isProposalEditing: false,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }
}
