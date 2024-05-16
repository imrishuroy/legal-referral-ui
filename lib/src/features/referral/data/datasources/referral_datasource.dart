import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';

@singleton
class ReferralDataSource {
  ReferralDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<String?> addReferral({
    required AddReferralReq referral,
  }) async {
    try {
      final res = await _apiClient.addReferral(
        referral,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
