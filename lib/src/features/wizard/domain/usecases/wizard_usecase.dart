import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';

@lazySingleton
class WizardUseCase {
  WizardUseCase({required WizardRepository wizardRepository})
      : _wizardRepository = wizardRepository;

  final WizardRepository _wizardRepository;

  Future<Either<Failure, ResponseMsg?>> sendMobileOtp({
    required SendMobileOtpReq sendMobileOtpReq,
  }) async {
    return _wizardRepository.sendMobileOtp(
      sendMobileOtpReq: sendMobileOtpReq,
    );
  }

  Future<Either<Failure, ResponseMsg?>> verifyMobileOtp({
    required VerifyMobileOtpReq verifyMobileOtpReq,
  }) async {
    return _wizardRepository.verifyMobileOtp(
      verifyMobileOtpReq: verifyMobileOtpReq,
    );
  }
}
