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
  Future<Either<Failure, String?>> createReferral({
    required CreateReferral referral,
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
  Future<Either<Failure, List<Project?>>> fetchReferrals({
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
  Future<Either<Failure, List<ReferedUser?>>> fetchReferredUsers({
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.fetchReferredUsers(
        projectId: projectId,
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
  Future<Either<Failure, List<Project?>>> fetchProposals({
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
  Future<Either<Failure, Proposal?>> createProposal({
    required Proposal proposal,
  }) async {
    try {
      final res = await _referralDataSource.createProposal(
        proposal: proposal,
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
  Future<Either<Failure, Proposal?>> fetchProposalByReferralId({
    required String userId,
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.fetchProposalByReferralId(
        userId: userId,
        projectId: projectId,
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
  Future<Either<Failure, Proposal?>> updateProposal({
    required int proposalId,
    required Proposal proposal,
  }) async {
    try {
      final res = await _referralDataSource.updateProposal(
        proposalId: proposalId,
        project: proposal,
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
  Future<Either<Failure, Project?>> awardProject({
    required AwardProjectReq awardProjectReq,
  }) async {
    try {
      final res = await _referralDataSource.awardProject(
        awardProjectReq: awardProjectReq,
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
  Future<Either<Failure, List<Project?>>> fetchActiveProjects({
    required String userId,
    required String role,
  }) async {
    try {
      final res = await _referralDataSource.fetchActiveProjects(
        userId: userId,
        role: role,
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
  Future<Either<Failure, List<Project?>>> fetchAwardedProjects({
    required String userId,
  }) async {
    try {
      final res = await _referralDataSource.fetchAwardedProjects(
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
  Future<Either<Failure, Project?>> acceptProject({
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.acceptProject(
        projectId: projectId,
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
  Future<Either<Failure, Project?>> startProject({
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.startProject(
        projectId: projectId,
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
  Future<Either<Failure, Project?>> completeProject({
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.completeProject(
        projectId: projectId,
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
  Future<Either<Failure, Project?>> rejectProject({
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.rejectProject(
        projectId: projectId,
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
  Future<Either<Failure, ProjectReview?>> addProjectReview({
    required ProjectReview projectReview,
  }) async {
    try {
      final res = await _referralDataSource.addProjectReview(
        projectReview: projectReview,
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
  Future<Either<Failure, Project?>> initiateCompleteProject({
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.initiateCompleteProject(
        projectId: projectId,
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
  Future<Either<Failure, Project?>> cancelInitiateCompleteProject({
    required int projectId,
  }) async {
    try {
      final res = await _referralDataSource.cancelInitiateCompleteProject(
        projectId: projectId,
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
  Future<Either<Failure, List<Project?>>> fetchCompletedProjects({
    required String userId,
    required String role,
  }) async {
    try {
      final res = await _referralDataSource.fetchCompletedProjects(
        userId: userId,
        role: role,
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
  Future<Either<Failure, List<AppUser?>>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _referralDataSource.fetchConnectedUsers(
        userId: userId,
        limit: limit,
        offset: offset,
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
  Future<Either<Failure, List<AppUser?>>> fetchUsers({
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _referralDataSource.fetchUsers(
        limit: limit,
        offset: offset,
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
