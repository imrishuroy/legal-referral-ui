import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl({
    required ProfileDataSource profileDataSource,
  }) : _profileDataSource = profileDataSource;

  final ProfileDataSource _profileDataSource;

  @override
  Future<Either<Failure, UserProfile?>> fetchUserProfile({
    required String userId,
  }) async {
    try {
      final res = await _profileDataSource.fetchUserProfile(
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
    } catch (e) {
      AppLogger.error('Error fetching user profile: $e');
      return Left(
        Failure(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String?>> updateUserAvatar({
    required String userId,
    required File file,
  }) async {
    try {
      final res = await _profileDataSource.updateUserAvatar(
        userId: userId,
        file: file,
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
  Future<Either<Failure, List<Firm?>>> searchFirm({
    required String query,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _profileDataSource.searchFirm(
        query: query,
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
  Future<Either<Failure, Education?>> addEducation({
    required Education education,
  }) async {
    try {
      final res = await _profileDataSource.addEducation(
        education: education,
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
  Future<Either<Failure, AppUser?>> uploadUserInfo({
    required UploadUserInfoReq uploadUserInfoReq,
  }) async {
    try {
      final res = await _profileDataSource.uploadUserInfo(
        uploadUserInfoReq: uploadUserInfoReq,
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
  Future<Either<Failure, Price?>> addPrice({
    required Price price,
  }) async {
    try {
      final res = await _profileDataSource.addPrice(
        price: price,
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
  Future<Either<Failure, Price?>> updatePrice({
    required int priceId,
    required Price price,
  }) async {
    try {
      final res = await _profileDataSource.updatePrice(
        priceId: priceId,
        price: price,
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
  Future<Either<Failure, Social?>> addSocial({
    required Social social,
  }) async {
    try {
      final res = await _profileDataSource.addSocial(
        social: social,
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
  Future<Either<Failure, Social?>> updateSocial({
    required int socialId,
    required Social social,
  }) async {
    try {
      final res = await _profileDataSource.updateSocial(
        socialId: socialId,
        social: social,
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
  Future<Either<Failure, List<Social?>>> fetchSocials({
    required EntityType entityType,
    required String entityId,
  }) async {
    try {
      final res = await _profileDataSource.fetchSocials(
        entityType: entityType,
        entityId: entityId,
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
  Future<Either<Failure, ResponseMsg?>> deleteSocial({
    required int socialId,
  }) async {
    try {
      final res = await _profileDataSource.deleteSocial(
        socialId: socialId,
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
  Future<Either<Failure, ResponseMsg?>> toggleReferral({
    required String userId,
    required ToggleReferralReq toggleReferralReq,
  }) async {
    try {
      final res = await _profileDataSource.toggleReferral(
        userId: userId,
        toggleReferralReq: toggleReferralReq,
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
  Future<Either<Failure, String?>> updateUserBanner({
    required String userId,
    required File file,
  }) async {
    try {
      final res = await _profileDataSource.updateUserBanner(
        userId: userId,
        file: file,
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

  // profile/experiences
  @override
  Future<Either<Failure, UserExperience?>> addExperience({
    required String userId,
    required AddUpdateExperienceReq experienceReq,
  }) async {
    try {
      final res = await _profileDataSource.addExperience(
        userId: userId,
        addExperienceReq: experienceReq,
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
  Future<Either<Failure, List<UserExperience?>>> fetchExperiences({
    required String userId,
  }) async {
    try {
      final res = await _profileDataSource.fetchExperiences(
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
  Future<Either<Failure, UserExperience?>> updateExperience({
    required String userId,
    required int experienceId,
    required AddUpdateExperienceReq experienceReq,
  }) async {
    try {
      final res = await _profileDataSource.updateExperience(
        userId: userId,
        experienceId: experienceId,
        experienceReq: experienceReq,
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
  Future<Either<Failure, ResponseMsg?>> deleteExperience({
    required String userId,
    required int experienceId,
  }) async {
    try {
      final res = await _profileDataSource.deleteExperience(
        userId: userId,
        experienceId: experienceId,
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

  // profile/educations
  @override
  Future<Either<Failure, List<Education?>>> fetchEducations({
    required String userId,
  }) async {
    try {
      final res = await _profileDataSource.fetchEducations(
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
  Future<Either<Failure, Education?>> updateEducation({
    required String userId,
    required int educationId,
    required Education education,
  }) async {
    try {
      final res = await _profileDataSource.updateEducation(
        userId: userId,
        educationId: educationId,
        education: education,
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
  Future<Either<Failure, ResponseMsg?>> deleteEducation({
    required String userId,
    required int educationId,
  }) async {
    try {
      final res = await _profileDataSource.deleteEducation(
        userId: userId,
        educationId: educationId,
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
