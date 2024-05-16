import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

@lazySingleton
class ReferralUseCases {
  ReferralUseCases({
    required ReferralRepository referralRepository,
  }) : _referralRepository = referralRepository;

  final ReferralRepository _referralRepository;

  Future<Either<Failure, String?>> addReferral({
    required AddReferralReq referral,
  }) async {
    return _referralRepository.addReferral(
      referral: referral,
    );
  }
}
