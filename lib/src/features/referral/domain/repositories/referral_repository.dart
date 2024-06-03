import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

abstract class ReferralRepository {
  Future<Either<Failure, String?>> createReferral({
    required CreateReferral referral,
  });

  Future<Either<Failure, List<Project?>>> fetchReferrals({
    required String userId,
  });

  Future<Either<Failure, List<ReferedUser?>>> fetchReferredUsers({
    required int projectId,
  });

  Future<Either<Failure, List<Project?>>> fetchProposals({
    required String userId,
  });

  Future<Either<Failure, Proposal?>> fetchProposalByReferralId({
    required String userId,
    required int projectId,
  });

  Future<Either<Failure, Proposal?>> createProposal({
    required Proposal proposal,
  });

  Future<Either<Failure, Proposal?>> updateProposal({
    required int proposalId,
    required Proposal proposal,
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

  Future<Either<Failure, List<AppUser?>>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, List<AppUser?>>> fetchUsers({
    required int limit,
    required int offset,
  });
}
