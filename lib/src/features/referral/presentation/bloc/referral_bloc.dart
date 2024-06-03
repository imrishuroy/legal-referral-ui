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
  })  : _referralUseCases = referralUseCases,
        super(ReferralState.initial()) {
    on<ReferConnectionToggled>(_onReferConnectionToggled);
    on<UserConnectionsFetched>(_onUserConnectionsFetched);
    on<UsersFetched>(_onUsersFetched);
    on<UserSelected>(_onUserSelected);
    on<AllUsersSelected>(_onAllUsersSelected);
    on<ReferralInitialized>(_onReferralInitialized);
    on<TabIndexChanged>(_onTabIndexChanged);
    on<ReferralCreated>(_onReferralCreated);
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
    on<ReferralStateReset>(_onReferralStateReset);
  }

  final ReferralUseCases _referralUseCases;

  Future<void> _onReferConnectionToggled(
    ReferConnectionToggled event,
    Emitter<ReferralState> emit,
  ) async {
    emit(
      state.copyWith(
        referConnection: !state.referConnection,
      ),
    );
  }

  Future<void> _onUserConnectionsFetched(
    UserConnectionsFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchConnectedUsers(
      userId: event.userId,
      limit: event.limit,
      offset: event.offset,
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
      (users) {
        emit(
          state.copyWith(
            users: users,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onUsersFetched(
    UsersFetched event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));

    final res = await _referralUseCases.fetchUsers(
      limit: event.limit,
      offset: event.offset,
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
      (users) {
        emit(
          state.copyWith(
            users: users,
            status: ReferralStatus.success,
          ),
        );
      },
    );
  }

  void _onUserSelected(
    UserSelected event,
    Emitter<ReferralState> emit,
  ) {
    final selectedUsers = state.selectedUsers;
    final user = event.user;
    if (selectedUsers.contains(user)) {
      final updatedUsers = selectedUsers.where((u) => u != user).toList();
      emit(state.copyWith(selectedUsers: updatedUsers));
    } else {
      final updatedUsers = [...selectedUsers, user];
      emit(state.copyWith(selectedUsers: updatedUsers));
    }
  }

  void _onAllUsersSelected(
    AllUsersSelected event,
    Emitter<ReferralState> emit,
  ) {
    final users = state.users;
    // if all users are selected, deselect all
    if (state.selectedUsers.length == users.length) {
      emit(state.copyWith(selectedUsers: []));
      return;
    }

    emit(state.copyWith(selectedUsers: users));
  }

  Future<void> _onReferralInitialized(
    ReferralInitialized event,
    Emitter<ReferralState> emit,
  ) async {
    emit(
      state.copyWith(
        tabIndex: event.tabIndex,
        status: ReferralStatus.success,
      ),
    );
  }

  Future<void> _onReferralStateReset(
    ReferralStateReset event,
    Emitter<ReferralState> emit,
  ) async {
    AppLogger.info('Referral state reset');
    emit(state.copyWith(status: ReferralStatus.loading));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(status: ReferralStatus.success));
  }

  Future<void> _onTabIndexChanged(
    TabIndexChanged event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(tabIndex: event.index));
  }

  Future<void> _onReferralCreated(
    ReferralCreated event,
    Emitter<ReferralState> emit,
  ) async {
    emit(state.copyWith(status: ReferralStatus.loading));
    final res = await _referralUseCases.createReferral(
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
      (proposalsProjects) {
        emit(
          state.copyWith(
            proposalsProjects: proposalsProjects,
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
      (proposal) {
        emit(
          state.copyWith(
            proposal: proposal,
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
      proposal: event.proposal,
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
            proposal: proposal,
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
      proposal: event.proposal,
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
            proposal: proposal,
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
        emit(
          state.copyWith(
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
        emit(
          state.copyWith(
            isReset: true,
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
