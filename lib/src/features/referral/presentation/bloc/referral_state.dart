part of 'referral_bloc.dart';

enum ReferralStatus { initial, loading, success, failure, referralAdded }

class ReferralState extends Equatable {
  const ReferralState({
    required this.status,
    this.referrals = const [],
    this.connections = const [],
    this.selectedConnections = const [],
    this.referredUsers = const [],
    this.proposals = const [],
    this.proposalReq,
    this.isProposalEditing = false,
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
        status,
        failure,
      ];
}
