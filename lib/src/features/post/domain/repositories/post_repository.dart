import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

abstract class PostRepository {
  Future<Either<Failure, String?>> createPost({
    required CreatePostReq post,
  });

  Future<Either<Failure, Post>> fetchPost({
    required int postId,
  });

  Future<Either<Failure, void>> likePost({
    required LikePostReq likePostReq,
  });

  Future<Either<Failure, void>> unlikePost({
    required int postId,
  });

  Future<Either<Failure, ResponseMsg>> deletePost({
    required int postId,
  });
}
