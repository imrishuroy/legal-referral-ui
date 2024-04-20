import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfile?>> fetchUserProfile({
    required String userId,
  });

  Future<Either<Failure, List<Firm?>>> searchFirm({
    required String query,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, Experience?>> addExperience({
    required AddExperienceReq addExperienceReq,
  });

  Future<Either<Failure, Education?>> addEducation({
    required Education education,
  });

  Future<Either<Failure, AppUser?>> uploadUserInfo({
    required UploadUserInfoReq uploadUserInfoReq,
  });

  Future<Either<Failure, Social?>> addSocial({
    required Social social,
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
}
