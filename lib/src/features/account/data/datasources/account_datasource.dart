import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/api_client.dart';
import 'package:legal_referral_ui/src/features/account/domain/domain.dart';

@singleton
class AccountDatasource {
  AccountDatasource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<List<FAQ>> fetchFAQs() async {
    try {
      final response = await _apiClient.fetchFAQs();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<FAQ> createFAQ({
    required FAQ faq,
  }) async {
    try {
      final response = await _apiClient.createFAQ(
        faq,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
