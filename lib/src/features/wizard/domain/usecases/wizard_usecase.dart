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

  Future<Either<Failure, int?>> getWizardStep({
    required String userId,
  }) async {
    return _wizardRepository.getWizardStep(
      userId: userId,
    );
  }

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

  Future<Either<Failure, License?>> saveLicense({
    required License license,
  }) async {
    return _wizardRepository.saveLicense(
      license: license,
    );
  }

  Future<Either<Failure, ResponseMsg?>> saveAboutYou({
    required AboutYouReq aboutYouReq,
  }) async {
    return _wizardRepository.saveAboutYou(
      aboutYouReq: aboutYouReq,
    );
  }

  Future<Either<Failure, ResponseMsg?>> uploadUserImage({
    required UploadUserImageReq uploadUserImageReq,
  }) async {
    return _wizardRepository.uploadUserImage(
      uploadUserImageReq: uploadUserImageReq,
    );
  }

  Future<Either<Failure, ResponseMsg?>> uploadLicense({
    required UploadLicenseReq uploadLicenseReq,
  }) async {
    return _wizardRepository.uploadLicense(
      uploadLicenseReq: uploadLicenseReq,
    );
  }
}
