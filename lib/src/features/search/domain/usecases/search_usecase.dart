import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/search/domain/domain.dart';

@lazySingleton
class SearchUseCase {
  SearchUseCase({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  final SearchRepository _searchRepository;

  Future<Either<Failure, List<AppUser?>>> searchUsers({
    required String query,
    required String filter,
    required int limit,
    required int offset,
  }) async {
    return _searchRepository.searchUsers(
      query: query,
      filter: filter,
      limit: limit,
      offset: offset,
    );
  }

  Future<Either<Failure, List<Post?>>> searchPosts({
    required String query,
    required int limit,
    required int offset,
  }) async {
    return _searchRepository.searchPosts(
      query: query,
      limit: limit,
      offset: offset,
    );
  }
}
