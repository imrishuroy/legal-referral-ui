import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
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
    on<ProjectAwarded>(_onProjectAwarded);
    on<ActiveProjectsFetched>(_onActiveProjectsFetched);
    on<AwardedProjectsFetched>(_onAwardedProjectsFetched);
    on<ProjectAccepted>(_onProjectAccepted);
    on<ProjectStarted>(_onProjectStarted);
    on<ProjectCompletionInitiated>(_onProjectCompletionInitiated);
    on<ProjectCompletionInitiationCancelled>(
      _onProjectCompletionInitiationCancelled,
    );
    on<ProjectCompleted>(_onProjectCompleted);
    on<ProjectRejected>(_onProjectRejected);
    on<ProjectReviewed>(_onProjectReviewed);
    on<CompletedProjectsFetched>(_onCompletedProjectsFetched);
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
    // if all connections are selected, deselect all
    if (state.selectedConnections.length == connections.length) {
      emit(state.copyWith(selectedConnections: []));
      return;
    }

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
      userId: event.userId,
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

  Future<void> _onProjectAwarded(
    ProjectAwarded event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.awardProject(
      awardProjectReq: event.awardProjectReq,
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
      (project) {
        final referralId = event.awardProjectReq.referralId;
        final updatedReferrals = state.referrals
            .where((referral) => referral?.referralId != referralId)
            .toList();

        emit(
          state.copyWith(
            referrals: updatedReferrals,
            status: ReferralStatus.awardProject,
          ),
        );
      },
    );
  }

  Future<void> _onActiveProjectsFetched(
    ActiveProjectsFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchActiveProjects(
      userId: event.userId,
      role: event.role,
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
      (projects) {
        emit(
          state.copyWith(
            activeProjects: projects,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onAwardedProjectsFetched(
    AwardedProjectsFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchAwardedProjects(
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
      (projects) {
        emit(
          state.copyWith(
            awardedProjects: projects,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProjectAccepted(
    ProjectAccepted event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.acceptProject(
      projectId: event.projectId,
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
      (project) {
        final updatedProjects = state.awardedProjects
            .where((project) => project?.projectId != event.projectId)
            .toList();

        emit(
          state.copyWith(
            awardedProjects: updatedProjects,
            activeProjects: [
              ...state.activeProjects,
              project,
            ],
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProjectStarted(
    ProjectStarted event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.startProject(
      projectId: event.projectId,
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
      (project) {
        // update the referredActiveProjects list, update the project status
        final updatedProjects = state.activeProjects
            .map(
              (p) => p?.projectId == event.projectId
                  ? p?.copyWith(status: ProjectStatus.started)
                  : p,
            )
            .toList();

        emit(
          state.copyWith(
            activeProjects: updatedProjects,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProjectCompletionInitiationCancelled(
    ProjectCompletionInitiationCancelled event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.cancelInitiateCompleteProject(
      projectId: event.projectId,
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
      (project) {
        final updatedProjects = state.activeProjects
            .map(
              (p) => p?.projectId == event.projectId
                  ? p?.copyWith(status: ProjectStatus.completeInitiated)
                  : p,
            )
            .toList();

        emit(
          state.copyWith(
            activeProjects: updatedProjects,
            status: ReferralStatus.initial,
          ),
        );
      },
    );
  }

  Future<void> _onProjectCompleted(
    ProjectCompleted event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.completeProject(
      projectId: event.projectId,
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
      (project) {
        final updatedProjects = state.activeProjects
            .map(
              (p) => p?.projectId == event.projectId
                  ? p?.copyWith(status: ProjectStatus.completed)
                  : p,
            )
            .toList();

        emit(
          state.copyWith(
            activeProjects: updatedProjects,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProjectRejected(
    ProjectRejected event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.rejectProject(
      projectId: event.projectId,
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
      (project) {
        final updatedProjects = state.awardedProjects
            .where((project) => project?.projectId != event.projectId)
            .toList();

        emit(
          state.copyWith(
            awardedProjects: updatedProjects,
            activeProjects: [
              ...state.activeProjects,
              project,
            ],
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProjectReviewed(
    ProjectReviewed event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.addProjectReview(
      projectReview: event.projectReview,
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
      (review) {
        emit(
          state.copyWith(
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onProjectCompletionInitiated(
    ProjectCompletionInitiated event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.initiateCompleteProject(
      projectId: event.projectId,
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
      (project) {
        final updatedProjects = state.activeProjects
            .map(
              (p) => p?.projectId == event.projectId
                  ? p?.copyWith(
                      status: ProjectStatus.completeInitiated,
                    )
                  : p,
            )
            .toList();

        emit(
          state.copyWith(
            activeProjects: updatedProjects,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onCompletedProjectsFetched(
    CompletedProjectsFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchCompletedProjects(
      userId: event.userId,
      role: event.role,
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
      (projects) {
        emit(
          state.copyWith(
            completedProjects: projects,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }
}
