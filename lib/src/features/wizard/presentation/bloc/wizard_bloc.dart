import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/usecases/wizard_usecase.dart';

part 'wizard_event.dart';
part 'wizard_state.dart';

@injectable
class WizardBloc extends Bloc<WizardEvent, WizardState> {
  WizardBloc({
    required WizardUseCase wizardUseCase,
  })  : _wizardUseCase = wizardUseCase,
        super(WizardState.initial()) {
    on<MobileOtpSent>(_onMobileOtpSent);
    on<MobileOtpVerified>(_onMobileOtpVerified);
  }

  final WizardUseCase _wizardUseCase;

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
        debugPrint('Mobile OTP sent');
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

    final response = await _wizardUseCase.verifyMobileOtp(
      verifyMobileOtpReq: VerifyMobileOtpReq(
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
}
