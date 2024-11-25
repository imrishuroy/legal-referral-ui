part of 'account_bloc.dart';

enum AccountStatus { initial, loading, success, failure }

class AccountState extends Equatable {
  const AccountState({
    required this.status,
    this.accountInfo,
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
  final AccountInfo? accountInfo;
  final Failure? failure;

  AccountState copyWith({
    AccountStatus? status,
    List<FAQ>? faqs,
    AccountInfo? accountInfo,
    Failure? failure,
  }) {
    return AccountState(
      status: status ?? this.status,
      faqs: faqs ?? this.faqs,
      accountInfo: accountInfo ?? this.accountInfo,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        faqs,
        accountInfo,
        failure,
      ];
}
