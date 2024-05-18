import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

@singleton
class ReferralDataSource {
  ReferralDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<String?> addReferral({
    required AddReferralReq referral,
  }) async {
    try {
      final res = await _apiClient.addReferral(
        referral,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Referral?>> fetchReferrals({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchReferrals(
        userId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<AppUser?>> fetchReferredUsers({
    required int referralId,
  }) async {
    try {
      final res = await _apiClient.fetchReferredUsers(
        referralId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Proposal?>> fetchProposals({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchProposals(
        userId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ProposalReq?> fetchProposalByReferralId({
    required int referralId,
  }) async {
    try {
      final res = await _apiClient.fetchProposalByReferralId(
        referralId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ProposalReq?> createProposal({
    required ProposalReq proposalReq,
  }) async {
    try {
      final res = await _apiClient.createProposal(
        proposalReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ProposalReq?> updateProposal({
    required int proposalId,
    required ProposalReq proposalReq,
  }) async {
    try {
      final res = await _apiClient.updateProposal(
        proposalId,
        proposalReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
