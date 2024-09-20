part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
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
