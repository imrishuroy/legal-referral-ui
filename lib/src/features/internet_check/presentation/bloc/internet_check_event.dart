part of 'internet_check_bloc.dart';

abstract class InternetCheckEvent extends Equatable {
  const InternetCheckEvent();

  @override
  List<Object?> get props => [];
}

class CheckConnectivity extends InternetCheckEvent {}
