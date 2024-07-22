import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/advertisement/data/data.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';

abstract class AdRepository {
  Future<Either<Failure, ResponseMsg?>> createAd({
    required CreateAdReq ad,
  });

  Future<Either<Failure, List<Ad?>>> fetchPlayingAds();

  Future<Either<Failure, List<Ad?>>> fetchExpiredAds();

  Future<Either<Failure, Ad?>> extendAdPeriod({
    required ExtendAdReq ad,
  });
}
