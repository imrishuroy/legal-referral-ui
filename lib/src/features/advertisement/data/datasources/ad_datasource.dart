import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/data/data.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';

@singleton
class AdDatasource {
  AdDatasource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<ResponseMsg?> createAd({
    required CreateAdReq ad,
  }) async {
    try {
      final response = await _apiClient.createAd(
        ad.type.name,
        ad.title,
        ad.description,
        ad.link,
        ad.paymentCycle.name,
        ad.authorId,
        DateTimeUtil.getJsonFormattedDate(ad.startDate),
        DateTimeUtil.getJsonFormattedDate(ad.endDate),
        ad.files,
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Ad?>> fetchPlayingAds() async {
    try {
      final response = await _apiClient.fetchPlayingAds();
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Ad?>> fetchExpiredAds() async {
    try {
      final response = await _apiClient.fetchExpiredAds();
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Ad?> extendAdPeriod({
    required ExtendAdReq ad,
  }) async {
    try {
      final response = await _apiClient.extendAdPeriod(
        ad.adId,
        ad,
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
