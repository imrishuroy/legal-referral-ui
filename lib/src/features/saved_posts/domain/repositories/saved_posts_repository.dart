import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';

abstract class SavedPostsRepository {
  Future<Either<Failure, List<SavedPost>>> fetchSavedPosts({
    required String userId,
  });

  Future<Either<Failure, void>> unsavePost({
    required int savedPostId,
  });

  Future<Either<Failure, void>> savePost({
    required String userId,
    required int postId,
  });
}
