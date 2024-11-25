part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountInfoFetched extends AccountEvent {
  const AccountInfoFetched({
    required this.userId,
  });
  final String userId;

  @override
  List<Object> get props => [userId];
}

class FAQFetched extends AccountEvent {}

class FAQCreated extends AccountEvent {
  const FAQCreated({
    required this.faq,
  });

  final FAQ faq;

  @override
  List<Object> get props => [faq];
}
