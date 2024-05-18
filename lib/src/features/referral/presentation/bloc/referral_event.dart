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
  const ProposalFetched({required this.referralId});

  final int referralId;

  @override
  List<Object> get props => [referralId];
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
