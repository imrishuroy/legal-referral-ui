import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/api_client.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';

@singleton
class PostDatasource {
  PostDatasource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<String?> createPost({required CreatePostReq post}) async {
    try {
      final response = await _apiClient.createPost(
        post.ownerId,
        post.content,
        post.type.name,
        post.files,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> likePost({required LikePostReq likePostReq}) async {
    try {
      await _apiClient.likePost(
        likePostReq.postId,
        likePostReq,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> unlikePost({required int postId}) async {
    try {
      await _apiClient.unlikePost(postId);
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg> deletePost({
    required int postId,
  }) async {
    try {
      final res = await _apiClient.deletePost(
        postId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
