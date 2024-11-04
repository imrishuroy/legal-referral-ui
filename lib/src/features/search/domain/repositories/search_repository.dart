import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<AppUser?>>> searchUsers({
    required String query,
    required String filter,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, List<Post?>>> searchPosts({
    required String query,
    required int limit,
    required int offset,
  });
}
