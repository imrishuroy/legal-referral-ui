import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';

abstract class PostRepository {
  Future<Either<Failure, String?>> createPost({
    required CreatePostReq post,
  });

  Future<Either<Failure, void>> likePost({
    required int postId,
  });

  Future<Either<Failure, void>> unlikePost({
    required int postId,
  });
}
