part of 'wizard_bloc.dart';

abstract class WizardEvent extends Equatable {
  const WizardEvent();

  @override
  List<Object> get props => [];
}

class MobileOtpSent extends WizardEvent {
  const MobileOtpSent({
    required this.mobile,
  });

  final String mobile;

  @override
  List<Object> get props => [mobile];
}

class MobileOtpVerified extends WizardEvent {
  const MobileOtpVerified({
    required this.userId,
    required this.mobile,
    required this.otp,
  });

  final String? userId;
  final String mobile;
  final String otp;
}
