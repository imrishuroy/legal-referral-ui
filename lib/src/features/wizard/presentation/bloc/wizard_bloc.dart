import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
    on<LicenseSaved>(_onLicenseSaved);
    on<AboutYouSaved>(_onAboutYouSaved);
    on<LicenseUploaded>(_onLicenseUploaded);
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
          ),
        );
      },
    );
  }

  Future<void> _onLicenseUploaded(
    LicenseUploaded event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final response = await _wizardUseCase.uploadLicense(
      file: event.file,
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

  WizardStep _wizardStep(int step) {
    switch (step) {
      case 0:
        return WizardStep.license;
      case 1:
        return WizardStep.uploadLicense;
      case 2:
        return WizardStep.aboutYou;

      default:
        return WizardStep.license;
    }
  }
}
