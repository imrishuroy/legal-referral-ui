part of 'firm_bloc.dart';

abstract class FirmState extends Equatable {
  const FirmState();  

  @override
  List<Object> get props => [];
}
class FirmInitial extends FirmState {}
