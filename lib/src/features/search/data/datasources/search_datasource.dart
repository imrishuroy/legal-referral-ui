import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

@lazySingleton
class SearchDataSource {
  SearchDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<List<AppUser?>> searchUsers({
    required String query,
    required String filter,
    required int limit,
    required int offset,
  }) async {
    try {
      final users = await _apiClient.searchUsers(
        query,
        filter,
        limit,
        offset,
      );
      return users;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Post?>> searchPosts({
    required String query,
    required int limit,
    required int offset,
  }) async {
    try {
      final posts = await _apiClient.searchPosts(
        query,
        limit,
        offset,
      );
      return posts;
    } catch (_) {
      rethrow;
    }
  }
}
