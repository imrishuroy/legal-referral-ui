import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/feed/data/data.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';

@lazySingleton
class FeedUsecase {
  FeedUsecase({
    required FeedRepository feedRepository,
  }) : _feedRepository = feedRepository;

  final FeedRepository _feedRepository;

  Future<Either<Failure, List<Feed?>>> fetchFeeds({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    return _feedRepository.fetchFeeds(
      userId: userId,
      limit: limit,
      offset: offset,
    );
  }

  Future<Either<Failure, PostLikesAndCommentsCount>>
      fetchPostLikesAndCommentsCount({
    required int postId,
  }) async {
    return _feedRepository.fetchPostLikesAndCommentsCount(
      postId: postId,
    );
  }

  Future<Either<Failure, bool>> isPostLiked({
    required int postId,
  }) async {
    return _feedRepository.isPostLiked(
      postId: postId,
    );
  }

  Future<Either<Failure, ResponseMsg?>> featurePost({
    required FeaturePostReq featurePostReq,
  }) async {
    return _feedRepository.featurePost(
      featurePostReq: featurePostReq,
    );
  }

  Future<Either<Failure, ResponseMsg?>> unFeaturePost({
    required int postId,
    required UnFeaturePostReq unFeaturePostReq,
  }) async {
    return _feedRepository.unFeaturePost(
      postId: postId,
      unFeaturePostReq: unFeaturePostReq,
    );
  }
}
