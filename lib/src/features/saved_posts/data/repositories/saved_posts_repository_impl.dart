import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/saved_posts/data/data.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';

@LazySingleton(as: SavedPostsRepository)
class SavedPostsRepositoryImpl extends SavedPostsRepository {
  SavedPostsRepositoryImpl({
    required SavedPostsDatasource savedPostsDatasource,
  }) : _savedPostsDatasource = savedPostsDatasource;

  final SavedPostsDatasource _savedPostsDatasource;

  @override
  Future<Either<Failure, List<SavedPost>>> fetchSavedPosts({
    required String userId,
  }) async {
    try {
      final savedPosts = await _savedPostsDatasource.fetchSavedPosts(
        userId: userId,
      );
      return Right(savedPosts);
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
  Future<Either<Failure, void>> unsavePost({
    required int savedPostId,
  }) async {
    try {
      await _savedPostsDatasource.unsavePost(
        savedPostId: savedPostId,
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
  Future<Either<Failure, void>> savePost({
    required String userId,
    required int postId,
  }) async {
    try {
      await _savedPostsDatasource.savePost(
        savePostReq: SavePostReq(
          userId: userId,
          postId: postId,
        ),
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
