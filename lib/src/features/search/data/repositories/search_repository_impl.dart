import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';
import 'package:legal_referral_ui/src/features/search/data/data.dart';
import 'package:legal_referral_ui/src/features/search/domain/repositories/search_repository.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  SearchRepositoryImpl({
    required SearchDataSource searchDataSource,
  }) : _searchDataSource = searchDataSource;

  final SearchDataSource _searchDataSource;

  @override
  Future<Either<Failure, List<AppUser?>>> searchUsers({
    required String query,
    required String filter,
    required int limit,
    required int offset,
  }) async {
    try {
      final users = await _searchDataSource.searchUsers(
        query: query,
        filter: filter,
        limit: limit,
        offset: offset,
      );
      return Right(users);
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
