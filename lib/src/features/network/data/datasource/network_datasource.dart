import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/api_client.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

@singleton
class NetworkDataSource {
  NetworkDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<ResponseMsg?> sendConnection({
    required SendConnectionReq sendConnectionReq,
  }) async {
    try {
      final responseMsg = await _apiClient.sendConnection(
        sendConnectionReq,
      );
      return responseMsg;
    } catch (_) {
      rethrow;
    }
  }

  Future<Connection?> acceptConnection({
    required int id,
  }) async {
    try {
      final responseMsg = await _apiClient.acceptConnection(
        id,
      );
      return responseMsg;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> rejectConnection({
    required int id,
  }) async {
    try {
      final responseMsg = await _apiClient.rejectConnection(
        id,
      );
      return responseMsg;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<ConnectionInvitation?>> fetchConnectionInvitations({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    try {
      final connectionInvitations = await _apiClient.fetchConnectionInvitations(
        userId,
        offset,
        limit,
      );
      return connectionInvitations;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Connection?>> fetchConnections({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    try {
      final connections = await _apiClient.fetchConnections(
        userId,
        offset,
        limit,
      );
      return connections;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Recommendation?>> fetchRecommendations({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    try {
      final recommendations = await _apiClient.fetchRecommendations(
        userId,
        offset,
        limit,
      );
      return recommendations;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> cancelRecommendation({
    required CancelRecommendationReq cancelRecommendationReq,
  }) async {
    try {
      final responseMsg = await _apiClient.cancelRecommendation(
        cancelRecommendationReq,
      );

      return responseMsg;
    } catch (_) {
      rethrow;
    }
  }

  Future<UserConnectionStatus> checkConnection({
    required String userId,
    required String otherUserId,
  }) async {
    try {
      final responseMsg = await _apiClient.checkConnection(
        userId,
        otherUserId,
      );

      return responseMsg;
    } catch (_) {
      rethrow;
    }
  }
}
