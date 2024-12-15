import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/feed/data/data.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';

@singleton
class FeedDatasource {
  FeedDatasource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<List<Feed?>> fetchFeeds({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _apiClient.fetchFeeds(
        userId,
        limit,
        offset,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<PostLikesAndCommentsCount> fetchPostLikesAndCommentsCount({
    required int postId,
  }) async {
    try {
      final response = await _apiClient.fetchPostLikesAndCommentsCount(
        postId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isPostLiked({required int postId}) async {
    try {
      final response = await _apiClient.isPostLiked(
        postId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseMsg?> featurePost({
    required FeaturePostReq saveFeaturePostReq,
  }) async {
    try {
      final res = await _apiClient.featurePost(
        saveFeaturePostReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> unFeaturePost({
    required int postId,
    required UnFeaturePostReq unFeaturePostReq,
  }) async {
    try {
      final res = await _apiClient.unFeaturePost(
        postId,
        unFeaturePostReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
