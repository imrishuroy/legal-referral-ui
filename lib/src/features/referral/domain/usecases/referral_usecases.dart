import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

@lazySingleton
class ReferralUseCases {
  ReferralUseCases({
    required ReferralRepository referralRepository,
  }) : _referralRepository = referralRepository;

  final ReferralRepository _referralRepository;

  Future<Either<Failure, String?>> addReferral({
    required AddReferralReq referral,
  }) async {
    return _referralRepository.addReferral(
      referral: referral,
    );
  }

  Future<Either<Failure, List<Referral?>>> fetchReferrals({
    required String userId,
  }) async {
    return _referralRepository.fetchReferrals(
      userId: userId,
    );
  }

  Future<Either<Failure, List<AppUser?>>> fetchReferredUsers({
    required int referralId,
  }) async {
    return _referralRepository.fetchReferredUsers(
      referralId: referralId,
    );
  }

  Future<Either<Failure, List<Proposal?>>> fetchProposals({
    required String userId,
  }) async {
    return _referralRepository.fetchProposals(
      userId: userId,
    );
  }

  Future<Either<Failure, ProposalReq?>> fetchProposalByReferralId({
    required String userId,
    required int referralId,
  }) async {
    return _referralRepository.fetchProposalByReferralId(
      userId: userId,
      referralId: referralId,
    );
  }

  Future<Either<Failure, ProposalReq?>> createProposal({
    required ProposalReq proposalReq,
  }) async {
    return _referralRepository.createProposal(
      proposalReq: proposalReq,
    );
  }

  Future<Either<Failure, ProposalReq?>> updateProposal({
    required int proposalId,
    required ProposalReq proposalReq,
  }) async {
    return _referralRepository.updateProposal(
      proposalId: proposalId,
      proposalReq: proposalReq,
    );
  }

  Future<Either<Failure, Project?>> awardProject({
    required AwardProjectReq awardProjectReq,
  }) async {
    return _referralRepository.awardProject(
      awardProjectReq: awardProjectReq,
    );
  }

  Future<Either<Failure, List<Project?>>> fetchActiveProjects({
    required String userId,
    required String role,
  }) async {
    return _referralRepository.fetchActiveProjects(
      userId: userId,
      role: role,
    );
  }

  Future<Either<Failure, List<Project?>>> fetchAwardedProjects({
    required String userId,
  }) async {
    return _referralRepository.fetchAwardedProjects(
      userId: userId,
    );
  }

  Future<Either<Failure, Project?>> acceptProject({
    required int projectId,
  }) async {
    return _referralRepository.acceptProject(
      projectId: projectId,
    );
  }

  Future<Either<Failure, Project?>> startProject({
    required int projectId,
  }) async {
    return _referralRepository.startProject(
      projectId: projectId,
    );
  }

  Future<Either<Failure, Project?>> completeProject({
    required int projectId,
  }) async {
    return _referralRepository.completeProject(
      projectId: projectId,
    );
  }

  Future<Either<Failure, Project?>> rejectProject({
    required int projectId,
  }) async {
    return _referralRepository.rejectProject(
      projectId: projectId,
    );
  }

  Future<Either<Failure, ProjectReview?>> addProjectReview({
    required ProjectReview projectReview,
  }) async {
    return _referralRepository.addProjectReview(
      projectReview: projectReview,
    );
  }

  Future<Either<Failure, Project?>> initiateCompleteProject({
    required int projectId,
  }) async {
    return _referralRepository.initiateCompleteProject(
      projectId: projectId,
    );
  }

  Future<Either<Failure, Project?>> cancelInitiateCompleteProject({
    required int projectId,
  }) async {
    return _referralRepository.cancelInitiateCompleteProject(
      projectId: projectId,
    );
  }

  Future<Either<Failure, List<Project?>>> fetchCompletedProjects({
    required String userId,
    required String role,
  }) async {
    return _referralRepository.fetchCompletedProjects(
      userId: userId,
      role: role,
    );
  }
}
