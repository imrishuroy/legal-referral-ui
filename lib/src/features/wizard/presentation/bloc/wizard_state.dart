part of 'wizard_bloc.dart';

enum WizardStatus {
  initial,

  loading,
  success,
  failure,
}

enum WizardStepStatus {
  wizardStepLoading,
  wizardStepLoaded,
}

enum MobileOtpStatus {
  initial,
  verifying,
  sent,
  resent,
  verified,
  failed,
}

enum WizardStep {
  contact,
  socialAvatar,
  uploadLicense,
  license,
  aboutYou,
  // experience,
  // education,
  // social,
  // pricing,
}

class WizardState extends Equatable {
  const WizardState({
    required this.wizardStepStatus,
    required this.wizardStatus,
    required this.mobileOtpStatus,
    required this.failure,
    this.wizardStep = WizardStep.contact,
  });

  factory WizardState.initial() => const WizardState(
        wizardStepStatus: WizardStepStatus.wizardStepLoading,
        wizardStatus: WizardStatus.initial,
        mobileOtpStatus: MobileOtpStatus.initial,
        failure: null,
      );

  final WizardStepStatus wizardStepStatus;
  final WizardStatus wizardStatus;
  final MobileOtpStatus mobileOtpStatus;
  final WizardStep wizardStep;
  final Failure? failure;

  WizardState copyWith({
    WizardStepStatus? wizardStepStatus,
    WizardStatus? wizardStatus,
    MobileOtpStatus? mobileOtpStatus,
    WizardStep? wizardStep,
    Failure? failure,
  }) {
    return WizardState(
      wizardStepStatus: wizardStepStatus ?? this.wizardStepStatus,
      wizardStatus: wizardStatus ?? this.wizardStatus,
      mobileOtpStatus: mobileOtpStatus ?? this.mobileOtpStatus,
      wizardStep: wizardStep ?? this.wizardStep,
      failure: failure ?? this.failure,
    );
  }

  @override
  String toString() {
    return 'WizardState(wizardStepStatus: $wizardStepStatus, '
        'wizardStatus: $wizardStatus, '
        'mobileOtpStatus: $mobileOtpStatus, '
        'wizardStep: $wizardStep, failure: $failure)';
  }

  @override
  List<Object?> get props => [
        wizardStepStatus,
        wizardStatus,
        mobileOtpStatus,
        wizardStep,
        failure,
      ];
}
