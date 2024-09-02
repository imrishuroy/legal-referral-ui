import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/firm/data/data.dart';
import 'package:legal_referral_ui/src/features/firm/domain/entities/firm.dart';

@singleton
class FirmDataSource {
  FirmDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<Firm> addFirm({required AddFirmReq firm}) async {
    try {
      return await _apiClient.addFirm(
        firm.name,
        firm.ownerUserId,
        firm.orgType,
        firm.file,
        firm.website,
        firm.location,
        firm.about,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Firm>> fetchMyFirms({
    required String ownerId,
  }) async {
    try {
      return await _apiClient.fetchMyFirms(ownerId);
    } catch (e) {
      rethrow;
    }
  }
}
