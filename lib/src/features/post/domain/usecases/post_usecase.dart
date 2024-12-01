import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
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

  Future<Either<Failure, Post>> fetchPost({
    required int postId,
  }) async {
    return _postRepository.fetchPost(postId: postId);
  }

  Future<Either<Failure, void>> likePost({
    required LikePostReq likePostReq,
  }) async {
    return _postRepository.likePost(likePostReq: likePostReq);
  }

  Future<Either<Failure, void>> unlikePost({
    required int postId,
  }) async {
    return _postRepository.unlikePost(postId: postId);
  }

  Future<Either<Failure, List<AppUser?>>> fetchPostLikedUsers({
    required int postId,
  }) async {
    return _postRepository.fetchPostLikedUsers(
      postId: postId,
    );
  }

  Future<Either<Failure, ResponseMsg>> deletePost({
    required int postId,
  }) async {
    return _postRepository.deletePost(postId: postId);
  }

  Future<Either<Failure, Comment?>> commentPost({
    required CommentReq commentReq,
  }) async {
    return _postRepository.commentPost(
      commentReq: commentReq,
    );
  }

  Future<Either<Failure, List<Comment?>>> fetchPostComments({
    required int postId,
  }) async {
    return _postRepository.fetchPostComments(
      postId: postId,
    );
  }

  Future<Either<Failure, void>> likeComment({
    required int commentId,
  }) async {
    return _postRepository.likeComment(
      commentId: commentId,
    );
  }

  Future<Either<Failure, void>> unlikeComment({
    required int commentId,
  }) async {
    return _postRepository.unlikeComment(
      commentId: commentId,
    );
  }
}
