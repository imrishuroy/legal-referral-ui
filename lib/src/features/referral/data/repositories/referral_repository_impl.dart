import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

@LazySingleton(as: ReferralRepository)
class ReferralRepositoryImpl extends ReferralRepository {
  ReferralRepositoryImpl({
    required ReferralDataSource referralDataSource,
  }) : _referralDataSource = referralDataSource;

  final ReferralDataSource _referralDataSource;

  @override
  Future<Either<Failure, String?>> addReferral({
    required AddReferralReq referral,
  }) async {
    try {
      final res = await _referralDataSource.addReferral(
        referral: referral,
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
  Future<Either<Failure, List<Referral?>>> fetchReferrals({
    required String userId,
  }) async {
    try {
      final res = await _referralDataSource.fetchReferrals(
        userId: userId,
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
  Future<Either<Failure, List<AppUser?>>> fetchReferredUsers({
    required int referralId,
  }) async {
    try {
      final res = await _referralDataSource.fetchReferredUsers(
        referralId: referralId,
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
  Future<Either<Failure, List<Proposal?>>> fetchProposals({
    required String userId,
  }) async {
    try {
      final res = await _referralDataSource.fetchProposals(
        userId: userId,
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
  Future<Either<Failure, ProposalReq?>> createProposal({
    required ProposalReq proposalReq,
  }) async {
    try {
      final res = await _referralDataSource.createProposal(
        proposalReq: proposalReq,
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
  Future<Either<Failure, ProposalReq?>> fetchProposalByReferralId({
    required int referralId,
  }) async {
    try {
      final res = await _referralDataSource.fetchProposalByReferralId(
        referralId: referralId,
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
  Future<Either<Failure, ProposalReq?>> updateProposal({
    required int proposalId,
    required ProposalReq proposalReq,
  }) async {
    try {
      final res = await _referralDataSource.updateProposal(
        proposalId: proposalId,
        proposalReq: proposalReq,
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
