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
    required int referralId,
  });

  Future<Either<Failure, ProposalReq?>> createProposal({
    required ProposalReq proposalReq,
  });

  Future<Either<Failure, ProposalReq?>> updateProposal({
    required int proposalId,
    required ProposalReq proposalReq,
  });
}
