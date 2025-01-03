import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/feed/data/data.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';

abstract class FeedRepository {
  Future<Either<Failure, List<Feed?>>> fetchFeeds({
    required String userId,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, PostLikesAndCommentsCount>>
      fetchPostLikesAndCommentsCount({
    required int postId,
  });

  Future<Either<Failure, bool>> isPostLiked({
    required int postId,
  });

  Future<Either<Failure, ResponseMsg?>> featurePost({
    required FeaturePostReq featurePostReq,
  });

  Future<Either<Failure, ResponseMsg?>> unFeaturePost({
    required int postId,
    required UnFeaturePostReq unFeaturePostReq,
  });

  Future<Either<Failure, void>> ignoreFeed({
    required int feeId,
  });
}
