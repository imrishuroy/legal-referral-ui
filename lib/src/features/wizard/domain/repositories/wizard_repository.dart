import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';

abstract class WizardRepository {
  Future<Either<Failure, int?>> getWizardStep({
    required String userId,
  });

  Future<Either<Failure, License?>> saveLicense({
    required License license,
  });

  Future<Either<Failure, ResponseMsg?>> saveAboutYou({
    required AboutYouReq aboutYouReq,
  });

  Future<Either<Failure, ResponseMsg?>> uploadLicense({
    required File file,
  });
}
