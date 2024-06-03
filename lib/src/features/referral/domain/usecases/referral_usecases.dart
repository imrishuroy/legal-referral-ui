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

  Future<Either<Failure, String?>> createReferral({
    required CreateReferral referral,
  }) async {
    return _referralRepository.createReferral(
      referral: referral,
    );
  }

  Future<Either<Failure, List<Project?>>> fetchReferrals({
    required String userId,
  }) async {
    return _referralRepository.fetchReferrals(
      userId: userId,
    );
  }

  Future<Either<Failure, List<ReferedUser?>>> fetchReferredUsers({
    required int projectId,
  }) async {
    return _referralRepository.fetchReferredUsers(
      projectId: projectId,
    );
  }

  Future<Either<Failure, List<Project?>>> fetchProposals({
    required String userId,
  }) async {
    return _referralRepository.fetchProposals(
      userId: userId,
    );
  }

  Future<Either<Failure, Proposal?>> fetchProposalByReferralId({
    required String userId,
    required int projectId,
  }) async {
    return _referralRepository.fetchProposalByReferralId(
      userId: userId,
      projectId: projectId,
    );
  }

  Future<Either<Failure, Proposal?>> createProposal({
    required Proposal proposal,
  }) async {
    return _referralRepository.createProposal(
      proposal: proposal,
    );
  }

  Future<Either<Failure, Proposal?>> updateProposal({
    required int proposalId,
    required Proposal proposal,
  }) async {
    return _referralRepository.updateProposal(
      proposalId: proposalId,
      proposal: proposal,
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

  Future<Either<Failure, List<AppUser?>>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    return _referralRepository.fetchConnectedUsers(
      userId: userId,
      limit: limit,
      offset: offset,
    );
  }

  Future<Either<Failure, List<AppUser?>>> fetchUsers({
    required int limit,
    required int offset,
  }) async {
    return _referralRepository.fetchUsers(
      limit: limit,
      offset: offset,
    );
  }
}
