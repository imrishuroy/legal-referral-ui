import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
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

  Future<Either<Failure, List<AppUser?>>> fetchPostLikedUsers({
    required int postId,
  }) async {
    return _feedRepository.fetchPostLikedUsers(
      postId: postId,
    );
  }

  Future<Either<Failure, Comment?>> commentPost({
    required CommentReq commentReq,
  }) async {
    return _feedRepository.commentPost(
      commentReq: commentReq,
    );
  }

  Future<Either<Failure, List<Comment?>>> fetchPostComments({
    required int postId,
  }) async {
    return _feedRepository.fetchPostComments(
      postId: postId,
    );
  }

  Future<Either<Failure, void>> likeComment({
    required int commentId,
  }) async {
    return _feedRepository.likeComment(
      commentId: commentId,
    );
  }

  Future<Either<Failure, void>> unlikeComment({
    required int commentId,
  }) async {
    return _feedRepository.unlikeComment(
      commentId: commentId,
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

  Future<Either<Failure, ResponseMsg?>> saveFeaturePost({
    required SaveFeaturePostReq saveFeaturePostReq,
  }) async {
    return _feedRepository.saveFeaturePost(
      saveFeaturePostReq: saveFeaturePostReq,
    );
  }

  Future<Either<Failure, ResponseMsg?>> unSaveFeaturePost({
    required int postId,
  }) async {
    return _feedRepository.unSaveFeaturePost(
      postId: postId,
    );
  }
}
