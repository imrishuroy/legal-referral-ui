import 'dart:io';

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

  Future<Either<Failure, ResponseMsg?>> uploadLicense({
    required File file,
  }) async {
    return _wizardRepository.uploadLicense(
      file: file,
    );
  }
}
