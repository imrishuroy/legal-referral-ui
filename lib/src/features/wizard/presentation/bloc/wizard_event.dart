part of 'wizard_bloc.dart';

abstract class WizardEvent extends Equatable {
  const WizardEvent();

  @override
  List<Object> get props => [];
}

class WizardStepFetched extends WizardEvent {
  const WizardStepFetched({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}

class WizardStepChanged extends WizardEvent {
  const WizardStepChanged({
    required this.wizardStep,
  });
  final WizardStep wizardStep;

  @override
  List<Object> get props => [wizardStep];
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

class LicenseSaved extends WizardEvent {
  const LicenseSaved({
    required this.license,
  });

  final License license;

  @override
  List<Object> get props => [license];
}

class AboutYouSaved extends WizardEvent {
  const AboutYouSaved({
    required this.aboutYouReq,
  });

  final AboutYouReq aboutYouReq;

  @override
  List<Object> get props => [aboutYouReq];
}

class SocialSaved extends WizardEvent {
  const SocialSaved({
    required this.userId,
    required this.email,
    required this.password,
    required this.file,
  });

  final String userId;
  final String email;
  final String password;
  final XFile file;

  @override
  List<Object> get props => [
        userId,
        email,
        password,
        file,
      ];
}

class ProfileImageUploaded extends WizardEvent {
  const ProfileImageUploaded({
    required this.userId,
    required this.file,
  });

  final String userId;
  final XFile file;

  @override
  List<Object> get props => [userId, file];
}
