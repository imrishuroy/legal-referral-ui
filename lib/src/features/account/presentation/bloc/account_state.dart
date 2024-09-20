part of 'account_bloc.dart';

enum AccountStatus { initial, loading, success, failure }

class AccountState extends Equatable {
  const AccountState({
    required this.status,
    this.faqs = const [],
    this.failure,
  });

  factory AccountState.initial() {
    return const AccountState(
      status: AccountStatus.initial,
    );
  }

  final AccountStatus status;
  final List<FAQ> faqs;
  final Failure? failure;

  AccountState copyWith({
    AccountStatus? status,
    List<FAQ>? faqs,
    Failure? failure,
  }) {
    return AccountState(
      status: status ?? this.status,
      faqs: faqs ?? this.faqs,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        faqs,
        failure,
      ];
}
