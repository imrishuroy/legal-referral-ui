import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

@lazySingleton
class PostUsecase {
  PostUsecase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  final PostRepository _postRepository;

  Future<Either<Failure, String?>> createPost({required Post post}) async {
    return _postRepository.createPost(post: post);
  }
}
