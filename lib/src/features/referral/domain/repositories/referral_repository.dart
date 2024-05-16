import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';

abstract class ReferralRepository {
  Future<Either<Failure, String?>> addReferral({
    required AddReferralReq referral,
  });
}
