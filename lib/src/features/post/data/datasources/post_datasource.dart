import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/api_client.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

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

  Future<Post> fetchPost({required int postId}) async {
    try {
      final post = await _apiClient.fetchPost(postId);
      return post;
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
