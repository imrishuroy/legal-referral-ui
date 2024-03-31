import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';

abstract class WizardRepository {
  Future<Either<Failure, int?>> getWizardStep({
    required String userId,
  });

  Future<Either<Failure, ResponseMsg?>> sendMobileOtp({
    required SendMobileOtpReq sendMobileOtpReq,
  });

  Future<Either<Failure, ResponseMsg?>> verifyMobileOtp({
    required VerifyMobileOtpReq verifyMobileOtpReq,
  });

  Future<Either<Failure, License?>> saveLicense({
    required License license,
  });
}
