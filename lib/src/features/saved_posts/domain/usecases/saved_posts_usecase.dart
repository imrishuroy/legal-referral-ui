import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';

@lazySingleton
class SavedPostsUsecase {
  SavedPostsUsecase({
    required SavedPostsRepository savedPostsRepository,
  }) : _savedPostsRepository = savedPostsRepository;

  final SavedPostsRepository _savedPostsRepository;

  Future<Either<Failure, void>> savePost({
    required String userId,
    required int postId,
  }) async {
    return _savedPostsRepository.savePost(
      userId: userId,
      postId: postId,
    );
  }

  Future<Either<Failure, void>> unsavePost({
    required int savedPostId,
  }) async {
    return _savedPostsRepository.unsavePost(
      savedPostId: savedPostId,
    );
  }

  Future<Either<Failure, List<SavedPost>>> fetchSavedPosts({
    required String userId,
  }) async {
    return _savedPostsRepository.fetchSavedPosts(
      userId: userId,
    );
  }
}
