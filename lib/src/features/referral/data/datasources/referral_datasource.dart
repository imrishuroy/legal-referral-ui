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
    required CreateReferral referral,
  }) async {
    try {
      final res = await _apiClient.createReferral(
        referral,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Project?>> fetchReferrals({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchActiveReferrals(
        userId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<ReferedUser?>> fetchReferredUsers({
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.fetchReferredUsers(
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Project?>> fetchProposals({
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

  Future<Proposal?> fetchProposalByReferralId({
    required String userId,
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.fetchProposalByReferralId(
        userId,
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Proposal?> createProposal({
    required Proposal proposal,
  }) async {
    try {
      final res = await _apiClient.createProposal(
        proposal,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Proposal?> updateProposal({
    required int proposalId,
    required Proposal project,
  }) async {
    try {
      final res = await _apiClient.updateProposal(
        proposalId,
        project,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Project?> awardProject({
    required AwardProjectReq awardProjectReq,
  }) async {
    try {
      final res = await _apiClient.awardProject(
        awardProjectReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Project?>> fetchActiveProjects({
    required String userId,
    required String role,
  }) async {
    try {
      final res = await _apiClient.fetchActiveProjects(
        userId,
        role,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Project?>> fetchAwardedProjects({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchAwardedProjects(
        userId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Project?> acceptProject({
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.acceptProject(
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Project?> startProject({
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.startProject(
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Project?> completeProject({
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.completeProject(
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Project?> rejectProject({
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.rejectProject(
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ProjectReview?> addProjectReview({
    required ProjectReview projectReview,
  }) async {
    try {
      final res = await _apiClient.addProjectReview(
        projectReview,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Project?> initiateCompleteProject({
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.initiateCompleteProject(
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Project?> cancelInitiateCompleteProject({
    required int projectId,
  }) async {
    try {
      final res = await _apiClient.cancelInitiateCompleteProject(
        projectId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Project?>> fetchCompletedProjects({
    required String userId,
    required String role,
  }) async {
    try {
      final res = await _apiClient.fetchCompletedProjects(
        userId,
        role,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<AppUser?>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _apiClient.fetchConnectedUsers(
        userId,
        limit,
        offset,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<AppUser?>> fetchUsers({
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _apiClient.fetchUsers(
        limit,
        offset,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
