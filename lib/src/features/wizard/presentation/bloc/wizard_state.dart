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

enum WizardStep {
  socialAvatar,
  uploadLicense,
  license,
  aboutYou,
}

class WizardState extends Equatable {
  const WizardState({
    required this.wizardStepStatus,
    required this.wizardStatus,
    required this.failure,
    this.wizardStep = WizardStep.socialAvatar,
  });

  factory WizardState.initial() => const WizardState(
        wizardStepStatus: WizardStepStatus.wizardStepLoading,
        wizardStatus: WizardStatus.initial,
        failure: null,
      );

  final WizardStepStatus wizardStepStatus;
  final WizardStatus wizardStatus;
  final WizardStep wizardStep;
  final Failure? failure;

  WizardState copyWith({
    WizardStepStatus? wizardStepStatus,
    WizardStatus? wizardStatus,
    WizardStep? wizardStep,
    Failure? failure,
  }) {
    return WizardState(
      wizardStepStatus: wizardStepStatus ?? this.wizardStepStatus,
      wizardStatus: wizardStatus ?? this.wizardStatus,
      wizardStep: wizardStep ?? this.wizardStep,
      failure: failure ?? this.failure,
    );
  }

  @override
  String toString() {
    return 'WizardState(wizardStepStatus: $wizardStepStatus, '
        'wizardStatus: $wizardStatus, '
        'wizardStep: $wizardStep, failure: $failure)';
  }

  @override
  List<Object?> get props => [
        wizardStepStatus,
        wizardStatus,
        wizardStep,
        failure,
      ];
}
