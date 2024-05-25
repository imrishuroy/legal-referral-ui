import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

abstract class ReferralRepository {
  Future<Either<Failure, String?>> addReferral({
    required AddReferralReq referral,
  });

  Future<Either<Failure, List<Referral?>>> fetchReferrals({
    required String userId,
  });

  Future<Either<Failure, List<AppUser?>>> fetchReferredUsers({
    required int referralId,
  });

  Future<Either<Failure, List<Proposal?>>> fetchProposals({
    required String userId,
  });

  Future<Either<Failure, ProposalReq?>> fetchProposalByReferralId({
    required String userId,
    required int referralId,
  });

  Future<Either<Failure, ProposalReq?>> createProposal({
    required ProposalReq proposalReq,
  });

  Future<Either<Failure, ProposalReq?>> updateProposal({
    required int proposalId,
    required ProposalReq proposalReq,
  });

  Future<Either<Failure, Project?>> awardProject({
    required AwardProjectReq awardProjectReq,
  });

  Future<Either<Failure, List<Project?>>> fetchActiveProjects({
    required String userId,
    required String role,
  });

  Future<Either<Failure, List<Project?>>> fetchAwardedProjects({
    required String userId,
  });

  Future<Either<Failure, Project?>> acceptProject({
    required int projectId,
  });

  Future<Either<Failure, Project?>> startProject({
    required int projectId,
  });

  Future<Either<Failure, Project?>> completeProject({
    required int projectId,
  });

  Future<Either<Failure, Project?>> rejectProject({
    required int projectId,
  });

  Future<Either<Failure, ProjectReview?>> addProjectReview({
    required ProjectReview projectReview,
  });

  Future<Either<Failure, Project?>> initiateCompleteProject({
    required int projectId,
  });

  Future<Either<Failure, Project?>> cancelInitiateCompleteProject({
    required int projectId,
  });

  Future<Either<Failure, List<Project?>>> fetchCompletedProjects({
    required String userId,
    required String role,
  });
}
