part of 'referral_bloc.dart';

abstract class ReferralEvent extends Equatable {
  const ReferralEvent();

  @override
  List<Object> get props => [];
}

class ReferConnectionToggled extends ReferralEvent {
  const ReferConnectionToggled();
}

class UserConnectionsFetched extends ReferralEvent {
  const UserConnectionsFetched({
    required this.userId,
    required this.limit,
    required this.offset,
  });

  final String userId;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [userId, limit, offset];
}

class UsersFetched extends ReferralEvent {
  const UsersFetched({
    required this.userId,
    required this.limit,
    required this.offset,
  });

  final String userId;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [userId, limit, offset];
}

class ReferralInitialized extends ReferralEvent {
  const ReferralInitialized({required this.tabIndex});

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}

class TabIndexChanged extends ReferralEvent {
  const TabIndexChanged({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}

class ReferralCreated extends ReferralEvent {
  const ReferralCreated({required this.referral});

  final CreateReferral referral;

  @override
  List<Object> get props => [referral];
}

class ConnectionsFetched extends ReferralEvent {
  const ConnectionsFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class UserSelected extends ReferralEvent {
  const UserSelected({required this.user});

  final AppUser user;

  @override
  List<Object> get props => [user];
}

class AllUsersSelected extends ReferralEvent {}

class ReferralFetched extends ReferralEvent {
  const ReferralFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ReferredUsersFetched extends ReferralEvent {
  const ReferredUsersFetched({required this.projectId});

  final int projectId;

  @override
  List<Object> get props => [projectId];
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
    required this.projectId,
  });

  final String userId;
  final int projectId;

  @override
  List<Object> get props => [userId, projectId];
}

class ProposalEditToggled extends ReferralEvent {}

class ProposalSent extends ReferralEvent {
  const ProposalSent({required this.proposal});

  final Proposal proposal;

  @override
  List<Object> get props => [proposal];
}

class ProposalUpdated extends ReferralEvent {
  const ProposalUpdated({required this.proposalId, required this.proposal});

  final int proposalId;
  final Proposal proposal;

  @override
  List<Object> get props => [proposalId, proposal];
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

class ReferralStateReset extends ReferralEvent {}
