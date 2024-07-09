import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/api_client.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';

@singleton
class DiscussionDatasource {
  DiscussionDatasource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<Discussion?> createDiscussion({
    required CreateDiscussionReq createDiscussionReq,
  }) async {
    try {
      final discussion = await _apiClient.createDiscussion(
        createDiscussionReq,
      );
      return discussion;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<AppUser?>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _apiClient.fetchConnectedUsers(
        userId,
        limit,
        offset,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<AppUser?>> fetchUsers({
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _apiClient.fetchUsers(
        limit,
        offset,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<DiscussionInviteRes?>> fetchDiscussionInvites({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchDiscussionInvites(
        userId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Discussion?>> fetchActiveDiscussions({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchActiveDiscussions(
        userId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<DiscussionMessage>> fetchDiscussionMessages({
    required int discussionId,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _apiClient.fetchDiscussionMessages(
        discussionId,
        limit,
        offset,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<DiscussionMessage?> sendMessageToDiscussion({
    required DiscussionMessage discussionMessage,
  }) async {
    try {
      final res = await _apiClient.sendMessageToDiscussion(
        discussionMessage.discussionId,
        discussionMessage,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg> joinDiscussion({
    required int discussionId,
  }) async {
    try {
      final res = await _apiClient.joinDiscussion(
        discussionId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg> rejectDiscussion({
    required int discussionId,
  }) async {
    try {
      final res = await _apiClient.rejectDiscussion(
        discussionId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<AppUser?>> fetchDiscussionParticipants({
    required int discussionId,
  }) async {
    try {
      final res = await _apiClient.fetchDiscussionParticipants(
        discussionId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
