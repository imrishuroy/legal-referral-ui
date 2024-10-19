import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl extends PostRepository {
  PostRepositoryImpl({
    required PostDatasource postDatasource,
  }) : _postDatasource = postDatasource;

  final PostDatasource _postDatasource;

  @override
  Future<Either<Failure, String?>> createPost({
    required CreatePostReq post,
  }) async {
    try {
      final response = await _postDatasource.createPost(
        post: post,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Post>> fetchPost({
    required int postId,
  }) async {
    try {
      final post = await _postDatasource.fetchPost(postId: postId);
      return Right(post);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> likePost({
    required LikePostReq likePostReq,
  }) async {
    try {
      await _postDatasource.likePost(
        likePostReq: likePostReq,
      );
      return const Right(null);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> unlikePost({
    required int postId,
  }) async {
    try {
      await _postDatasource.unlikePost(
        postId: postId,
      );
      return const Right(null);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResponseMsg>> deletePost({required int postId}) async {
    try {
      final response = await _postDatasource.deletePost(
        postId: postId,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }
}
