import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
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
  Future<Either<Failure, ResponseMsg?>> featurePost({
    required FeaturePostReq featurePostReq,
  }) async {
    try {
      final res = await _feedDatasource.featurePost(
        saveFeaturePostReq: featurePostReq,
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
  Future<Either<Failure, ResponseMsg?>> unFeaturePost({
    required int postId,
    required UnFeaturePostReq unFeaturePostReq,
  }) async {
    try {
      final res = await _feedDatasource.unFeaturePost(
        postId: postId,
        unFeaturePostReq: unFeaturePostReq,
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
