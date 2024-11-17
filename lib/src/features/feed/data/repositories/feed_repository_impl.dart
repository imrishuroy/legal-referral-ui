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
  Future<Either<Failure, PostLikesAndCommentsCount>>
      fetchPostLikesAndCommentsCount({
    required int postId,
  }) async {
    try {
      final response = await _feedDatasource.fetchPostLikesAndCommentsCount(
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
  Future<Either<Failure, bool>> isPostLiked({
    required int postId,
  }) async {
    try {
      final res = await _feedDatasource.isPostLiked(
        postId: postId,
      );
      return Right(res);
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
  Future<Either<Failure, ResponseMsg?>> saveFeaturePost({
    required SaveFeaturePostReq saveFeaturePostReq,
  }) async {
    try {
      final res = await _feedDatasource.saveFeaturePost(
        saveFeaturePostReq: saveFeaturePostReq,
      );
      return Right(res);
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
  Future<Either<Failure, ResponseMsg?>> unSaveFeaturePost({
    required int postId,
  }) async {
    try {
      final res = await _feedDatasource.unsaveFeaturePost(
        postId: postId,
      );
      return Right(res);
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
