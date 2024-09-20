import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfile?>> fetchUserProfile({
    required String userId,
  });

  Future<Either<Failure, String?>> updateUserAvatar({
    required String userId,
    required File file,
  });

  Future<Either<Failure, List<Firm?>>> searchFirm({
    required String query,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, AppUser?>> uploadUserInfo({
    required UploadUserInfoReq uploadUserInfoReq,
  });

  Future<Either<Failure, Price?>> addPrice({
    required Price price,
  });

  Future<Either<Failure, Price?>> updatePrice({
    required int priceId,
    required Price price,
  });

  Future<Either<Failure, ResponseMsg?>> toggleReferral({
    required String userId,
    required ToggleReferralReq toggleReferralReq,
  });

  Future<Either<Failure, String?>> updateUserBanner({
    required String userId,
    required File file,
  });

  // profile/socials

  Future<Either<Failure, Social?>> addSocial({
    required Social social,
  });

  Future<Either<Failure, Social?>> updateSocial({
    required int socialId,
    required Social social,
  });

  Future<Either<Failure, List<Social?>>> fetchSocials({
    required EntityType entityType,
    required String entityId,
  });

  Future<Either<Failure, ResponseMsg?>> deleteSocial({
    required int socialId,
  });

  // profile/experiences
  Future<Either<Failure, UserExperience?>> addExperience({
    required String userId,
    required AddUpdateExperienceReq experienceReq,
  });

  Future<Either<Failure, UserExperience?>> updateExperience({
    required String userId,
    required int experienceId,
    required AddUpdateExperienceReq experienceReq,
  });

  Future<Either<Failure, List<UserExperience?>>> fetchExperiences({
    required String userId,
  });

  Future<Either<Failure, ResponseMsg?>> deleteExperience({
    required String userId,
    required int experienceId,
  });

  // profile/educations

  Future<Either<Failure, Education?>> addEducation({
    required Education education,
  });

  Future<Either<Failure, List<Education?>>> fetchEducations({
    required String userId,
  });

  Future<Either<Failure, Education?>> updateEducation({
    required String userId,
    required int educationId,
    required Education education,
  });

  Future<Either<Failure, ResponseMsg?>> deleteEducation({
    required String userId,
    required int educationId,
  });

  Future<Either<Failure, ResponseMsg?>> unSaveFeaturePost({
    required int postId,
  });

  Future<Either<Failure, List<FeaturePost>>> fetchFeaturePosts({
    required String userId,
  });
}
