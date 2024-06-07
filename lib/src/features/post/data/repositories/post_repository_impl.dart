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
  Future<Either<Failure, String?>> createPost({required Post post}) async {
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
}
