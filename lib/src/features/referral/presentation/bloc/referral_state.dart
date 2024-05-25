part of 'referral_bloc.dart';

enum ReferralStatus {
  initial,
  loading,
  success,
  failure,
  referralAdded,

  awardProject,
}

class ReferralState extends Equatable {
  const ReferralState({
    required this.status,
    this.referrals = const [],
    this.connections = const [],
    this.selectedConnections = const [],
    this.referredUsers = const [],
    this.proposals = const [],
    this.proposalReq,
    this.activeProjects = const [],
    this.awardedProjects = const [],
    this.isProposalEditing = false,
    this.completedProjects = const [],
    this.failure,
  });

  factory ReferralState.initial() {
    return const ReferralState(
      status: ReferralStatus.initial,
    );
  }

  final List<Referral?> referrals;
  final List<Connection?> connections;
  final List<Connection?> selectedConnections;
  final List<AppUser?> referredUsers;
  final List<Proposal?> proposals;
  final ProposalReq? proposalReq;
  final bool isProposalEditing;
  final List<Project?> activeProjects;
  final List<Project?> awardedProjects;
  final List<Project?> completedProjects;
  final ReferralStatus status;
  final Failure? failure;

  ReferralState copyWith({
    List<Referral?>? referrals,
    List<Connection?>? connections,
    List<Connection?>? selectedConnections,
    List<AppUser?>? referredUsers,
    List<Proposal?>? proposals,
    ProposalReq? proposalReq,
    bool? isProposalEditing,
    List<Project?>? activeProjects,
    List<Project?>? awardedProjects,
    List<Project?>? completedProjects,
    ReferralStatus? status,
    Failure? failure,
  }) {
    return ReferralState(
      referrals: referrals ?? this.referrals,
      connections: connections ?? this.connections,
      selectedConnections: selectedConnections ?? this.selectedConnections,
      referredUsers: referredUsers ?? this.referredUsers,
      proposals: proposals ?? this.proposals,
      proposalReq: proposalReq ?? this.proposalReq,
      isProposalEditing: isProposalEditing ?? this.isProposalEditing,
      activeProjects: activeProjects ?? this.activeProjects,
      awardedProjects: awardedProjects ?? this.awardedProjects,
      completedProjects: completedProjects ?? this.completedProjects,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        referrals,
        connections,
        selectedConnections,
        referredUsers,
        proposals,
        proposalReq,
        isProposalEditing,
        activeProjects,
        awardedProjects,
        completedProjects,
        status,
        failure,
      ];
}
