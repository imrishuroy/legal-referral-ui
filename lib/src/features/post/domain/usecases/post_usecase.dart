import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

@lazySingleton
class PostUsecase {
  PostUsecase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  final PostRepository _postRepository;

  Future<Either<Failure, String?>> createPost({
    required CreatePostReq post,
  }) async {
    return _postRepository.createPost(post: post);
  }

  Future<Either<Failure, void>> likePost({
    required int postId,
  }) async {
    return _postRepository.likePost(postId: postId);
  }

  Future<Either<Failure, void>> unlikePost({
    required int postId,
  }) async {
    return _postRepository.unlikePost(postId: postId);
  }
}
