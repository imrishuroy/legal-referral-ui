import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
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

  Future<List<AppUser?>> fetchPostLikedUsers({
    required int postId,
  }) async {
    try {
      final response = await _apiClient.fetchPostLikedUsers(
        postId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Comment?> commentPost({
    required CommentReq commentReq,
  }) async {
    try {
      final response = await _apiClient.commentPost(
        commentReq.postId,
        commentReq,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Comment?>> fetchPostComments({
    required int postId,
  }) async {
    try {
      final response = await _apiClient.fetchPostComments(
        postId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> likeComment({
    required int commentId,
  }) async {
    try {
      await _apiClient.likeComment(
        commentId,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> unlikeComment({
    required int commentId,
  }) async {
    try {
      await _apiClient.unlikeComment(
        commentId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
