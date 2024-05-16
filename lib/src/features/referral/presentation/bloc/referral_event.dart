part of 'referral_bloc.dart';

abstract class ReferralEvent extends Equatable {
  const ReferralEvent();

  @override
  List<Object> get props => [];
}

class ReferralCreated extends ReferralEvent {
  const ReferralCreated({required this.referral});

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
