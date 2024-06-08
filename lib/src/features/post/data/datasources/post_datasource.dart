import 'package:injectable/injectable.dart';
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
        post.title,
        post.content,
        post.type.name,
        post.files,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
