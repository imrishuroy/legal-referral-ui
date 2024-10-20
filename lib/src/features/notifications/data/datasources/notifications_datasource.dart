import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/api_client.dart';
import 'package:legal_referral_ui/src/features/notifications/domain/domain.dart';

@singleton
class NotificationsDatasource {
  NotificationsDatasource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<List<Notification>> fetchNotifications({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _apiClient.fetchNotifications(
        userId,
        limit,
        offset,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
