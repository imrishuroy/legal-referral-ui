import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/advertisement/data/data.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';

@lazySingleton
class AdUsecase {
  AdUsecase({
    required AdRepository adRepository,
  }) : _adRepository = adRepository;

  final AdRepository _adRepository;

  Future<Either<Failure, ResponseMsg?>> createAd({
    required CreateAdReq ad,
  }) async {
    try {
      return await _adRepository.createAd(ad: ad);
    } catch (error) {
      rethrow;
    }
  }

  Future<Either<Failure, List<Ad?>>> fetchPlayingAds() async {
    try {
      return await _adRepository.fetchPlayingAds();
    } catch (error) {
      rethrow;
    }
  }

  Future<Either<Failure, List<Ad?>>> fetchExpiredAds() async {
    try {
      return await _adRepository.fetchExpiredAds();
    } catch (error) {
      rethrow;
    }
  }

  Future<Either<Failure, Ad?>> extendAdPeriod({
    required ExtendAdReq ad,
  }) async {
    try {
      return await _adRepository.extendAdPeriod(ad: ad);
    } catch (error) {
      rethrow;
    }
  }
}
