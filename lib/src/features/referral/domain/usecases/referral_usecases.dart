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
    required int referralId,
  }) async {
    return _referralRepository.fetchProposalByReferralId(
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
}
