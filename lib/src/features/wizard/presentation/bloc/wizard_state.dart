part of 'wizard_bloc.dart';

enum WizardStatus {
  initial,
  loading,
  success,
  failure,
}

enum MobileOtpStatus {
  initial,
  verifying,
  sent,
  resent,
  verified,
  failed,
}

class WizardState extends Equatable {
  const WizardState({
    required this.wizardStatus,
    required this.mobileOtpStatus,
    required this.failure,
  });

  factory WizardState.initial() => const WizardState(
        wizardStatus: WizardStatus.initial,
        mobileOtpStatus: MobileOtpStatus.initial,
        failure: null,
      );

  final WizardStatus wizardStatus;
  final MobileOtpStatus mobileOtpStatus;
  final Failure? failure;

  WizardState copyWith({
    WizardStatus? wizardStatus,
    MobileOtpStatus? mobileOtpStatus,
    Failure? failure,
  }) {
    return WizardState(
      wizardStatus: wizardStatus ?? this.wizardStatus,
      mobileOtpStatus: mobileOtpStatus ?? this.mobileOtpStatus,
      failure: failure ?? this.failure,
    );
  }

  @override
  String toString() {
    return 'WizardState{wizardStatus: $wizardStatus, '
        'mobileOtpStatus: $mobileOtpStatus, failure: $failure}';
  }

  @override
  List<Object?> get props => [
        wizardStatus,
        mobileOtpStatus,
        failure,
      ];
}
