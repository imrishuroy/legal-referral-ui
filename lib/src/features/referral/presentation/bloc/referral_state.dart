part of 'referral_bloc.dart';

enum ReferralStatus { initial, loading, success, failure }

class ReferralState extends Equatable {
  const ReferralState({
    required this.status,
    this.referrals = const [],
    this.connections = const [],
    this.selectedConnections = const [],
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
  final ReferralStatus status;
  final Failure? failure;

  ReferralState copyWith({
    List<Referral?>? referrals,
    List<Connection?>? connections,
    List<Connection?>? selectedConnections,
    ReferralStatus? status,
    Failure? failure,
  }) {
    return ReferralState(
      referrals: referrals ?? this.referrals,
      connections: connections ?? this.connections,
      selectedConnections: selectedConnections ?? this.selectedConnections,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        referrals,
        connections,
        selectedConnections,
        status,
        failure,
      ];
}
