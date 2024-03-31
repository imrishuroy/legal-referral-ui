import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/usecases/wizard_usecase.dart';

part 'wizard_event.dart';
part 'wizard_state.dart';

@injectable
class WizardBloc extends Bloc<WizardEvent, WizardState> {
  WizardBloc({
    required WizardUseCase wizardUseCase,
  })  : _wizardUseCase = wizardUseCase,
        super(WizardState.initial()) {
    on<WizardStepFetched>(_onWizardStepFetched);
    on<WizardStepChanged>(_onWizardStepChanged);
    on<MobileOtpSent>(_onMobileOtpSent);
    on<MobileOtpVerified>(_onMobileOtpVerified);
    on<LicenseSaved>(_onLicenseSaved);
    on<AboutYouSaved>(_onAboutYouSaved);
  }

  final WizardUseCase _wizardUseCase;

  Future<void> _onWizardStepFetched(
    WizardStepFetched event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStepStatus: WizardStepStatus.wizardStepLoading,
      ),
    );

    final response = await _wizardUseCase.getWizardStep(
      userId: event.userId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            failure: failure,
          ),
        );
      },
      (step) {
        AppLogger.info('Wizard step: $step');
        final wizardStep = _wizardStep(step ?? 0);

        emit(
          state.copyWith(
            wizardStep: wizardStep,
            wizardStepStatus: WizardStepStatus.wizardStepLoaded,
          ),
        );
      },
    );
  }

  Future<void> _onWizardStepChanged(
    WizardStepChanged event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStep: event.wizardStep,
      ),
    );
  }

  Future<void> _onMobileOtpSent(
    MobileOtpSent event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final response = await _wizardUseCase.sendMobileOtp(
      sendMobileOtpReq: SendMobileOtpReq(
        mobile: event.mobile,
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            mobileOtpStatus: MobileOtpStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.success,
            mobileOtpStatus: MobileOtpStatus.sent,
          ),
        );
      },
    );
  }

  Future<void> _onMobileOtpVerified(
    MobileOtpVerified event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        mobileOtpStatus: MobileOtpStatus.verifying,
      ),
    );

    if (event.userId == null) {
      emit(
        state.copyWith(
          wizardStatus: WizardStatus.failure,
          mobileOtpStatus: MobileOtpStatus.failed,
          failure: const Failure(
            message: 'Failed to verify OTP',
          ),
        ),
      );
      return;
    }

    final response = await _wizardUseCase.verifyMobileOtp(
      verifyMobileOtpReq: VerifyMobileOtpReq(
        userId: event.userId!,
        mobile: event.mobile,
        otp: event.otp,
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            mobileOtpStatus: MobileOtpStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            mobileOtpStatus: MobileOtpStatus.verified,
          ),
        );
      },
    );
  }

  Future<void> _onLicenseSaved(
    LicenseSaved event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final response = await _wizardUseCase.saveLicense(
      license: event.license,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.success,
            wizardStep: WizardStep.aboutYou,
          ),
        );
      },
    );
  }

  Future<void> _onAboutYouSaved(
    AboutYouSaved event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final response = await _wizardUseCase.saveAboutYou(
      aboutYouReq: event.aboutYouReq,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.success,
            wizardStep: WizardStep.socialAvatar,
          ),
        );
      },
    );
  }

  WizardStep _wizardStep(int step) {
    switch (step) {
      case 1:
        return WizardStep.license;
      case 2:
        return WizardStep.aboutYou;
      case 3:
        return WizardStep.socialAvatar;
      case 4:
        return WizardStep.uploadLicense;
      case 5:
        return WizardStep.experience;
      case 6:
        return WizardStep.education;
      case 7:
        return WizardStep.social;
      case 8:
        return WizardStep.pricing;
      default:
        return WizardStep.contact;
    }
  }
}
