import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/data/data.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';

@LazySingleton(as: FeedRepository)
class FeedRepositoryImpl extends FeedRepository {
  FeedRepositoryImpl({
    required FeedDatasource feedDatasource,
  }) : _feedDatasource = feedDatasource;

  final FeedDatasource _feedDatasource;

  @override
  Future<Either<Failure, List<Feed?>>> fetchFeeds({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _feedDatasource.fetchFeeds(
        userId: userId,
        limit: limit,
        offset: offset,
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
  Future<Either<Failure, List<AppUser?>>> fetchPostLikedUsers({
    required int postId,
  }) async {
    try {
      final response = await _feedDatasource.fetchPostLikedUsers(
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

  @override
  Future<Either<Failure, Comment?>> commentPost({
    required CommentReq commentReq,
  }) async {
    try {
      final response = await _feedDatasource.commentPost(
        commentReq: commentReq,
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
  Future<Either<Failure, List<Comment?>>> fetchPostComments({
    required int postId,
  }) async {
    try {
      final response = await _feedDatasource.fetchPostComments(
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

  @override
  Future<Either<Failure, void>> likeComment({
    required int commentId,
  }) async {
    try {
      await _feedDatasource.likeComment(
        commentId: commentId,
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
  Future<Either<Failure, void>> unlikeComment({
    required int commentId,
  }) async {
    try {
      await _feedDatasource.unlikeComment(
        commentId: commentId,
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
}
