part of 'referral_bloc.dart';

abstract class ReferralEvent extends Equatable {
  const ReferralEvent();

  @override
  List<Object> get props => [];
}

class ReferralAdded extends ReferralEvent {
  const ReferralAdded({required this.referral});

  final AddReferralReq referral;

  @override
  List<Object> get props => [referral];
}

class ConnectionsFetched extends ReferralEvent {
  const ConnectionsFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ConnectionSelected extends ReferralEvent {
  const ConnectionSelected({required this.connection});

  final Connection connection;

  @override
  List<Object> get props => [connection];
}

class AllConnectionsSelected extends ReferralEvent {}

class ReferralFetched extends ReferralEvent {
  const ReferralFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ReferredUsersFetched extends ReferralEvent {
  const ReferredUsersFetched({required this.referralId});

  final int referralId;

  @override
  List<Object> get props => [referralId];
}

class ProposalsFetched extends ReferralEvent {
  const ProposalsFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ProposalFetched extends ReferralEvent {
  const ProposalFetched({
    required this.userId,
    required this.referralId,
  });

  final String userId;
  final int referralId;

  @override
  List<Object> get props => [userId, referralId];
}

class ProposalEditToggled extends ReferralEvent {}

class ProposalSent extends ReferralEvent {
  const ProposalSent({required this.proposalReq});

  final ProposalReq proposalReq;

  @override
  List<Object> get props => [proposalReq];
}

class ProposalUpdated extends ReferralEvent {
  const ProposalUpdated({required this.proposalId, required this.proposalReq});

  final int proposalId;
  final ProposalReq proposalReq;

  @override
  List<Object> get props => [proposalId, proposalReq];
}

class ProjectAwarded extends ReferralEvent {
  const ProjectAwarded({required this.awardProjectReq});

  final AwardProjectReq awardProjectReq;

  @override
  List<Object> get props => [awardProjectReq];
}

class ActiveProjectsFetched extends ReferralEvent {
  const ActiveProjectsFetched({
    required this.userId,
    required this.role,
  });

  final String userId;
  final String role;

  @override
  List<Object> get props => [userId, role];
}

class AwardedProjectsFetched extends ReferralEvent {
  const AwardedProjectsFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ProjectAccepted extends ReferralEvent {
  const ProjectAccepted({required this.projectId});

  final int projectId;

  @override
  List<Object> get props => [projectId];
}

class ProjectStarted extends ReferralEvent {
  const ProjectStarted({required this.projectId});

  final int projectId;

  @override
  List<Object> get props => [projectId];
}

class ProjectCompleted extends ReferralEvent {
  const ProjectCompleted({required this.projectId});

  final int projectId;

  @override
  List<Object> get props => [projectId];
}

class ProjectRejected extends ReferralEvent {
  const ProjectRejected({required this.projectId});

  final int projectId;

  @override
  List<Object> get props => [projectId];
}

class ProjectReviewed extends ReferralEvent {
  const ProjectReviewed({required this.projectReview});

  final ProjectReview projectReview;

  @override
  List<Object> get props => [projectReview];
}

class ProjectCompletionInitiated extends ReferralEvent {
  const ProjectCompletionInitiated({required this.projectId});

  final int projectId;

  @override
  List<Object> get props => [projectId];
}

class ProjectCompletionInitiationCancelled extends ReferralEvent {
  const ProjectCompletionInitiationCancelled({required this.projectId});

  final int projectId;

  @override
  List<Object> get props => [projectId];
}

class CompletedProjectsFetched extends ReferralEvent {
  const CompletedProjectsFetched({
    required this.role,
    required this.userId,
  });

  final String role;
  final String userId;

  @override
  List<Object> get props => [role, userId];
}

// class ReferredCompletedProjectsFetched extends ReferralEvent {
//   const ReferredCompletedProjectsFetched({required this.userId});

//   final String userId;

//   @override
//   List<Object> get props => [userId];
// }
