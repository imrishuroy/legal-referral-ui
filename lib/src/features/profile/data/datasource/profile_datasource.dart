import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/profile/data/models/add_experience_req.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

@singleton
class ProfileDataSource {
  ProfileDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<List<Firm?>> searchFirm({
    required String query,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _apiClient.searchFirm(
        query,
        limit,
        offset,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Experience?> addExperience({
    required AddExperienceReq addExperienceReq,
  }) async {
    try {
      final res = await _apiClient.addExperience(addExperienceReq);
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
