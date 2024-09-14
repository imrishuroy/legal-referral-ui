import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/saved_posts/data/data.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';

@singleton
class SavedPostsDatasource {
  SavedPostsDatasource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<void> savePost({
    required SavePostReq savePostReq,
  }) async {
    try {
      await _apiClient.savePost(
        savePostReq,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> unsavePost({
    required int savedPostId,
  }) async {
    try {
      await _apiClient.unsavePost(
        savedPostId,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SavedPost>> fetchSavedPosts({
    required String userId,
  }) async {
    try {
      return await _apiClient.fetchSavedPosts(
        userId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
