import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';

@lazySingleton
class DiscussionUsecase {
  DiscussionUsecase({
    required DiscussionRepository discussionRepository,
  }) : _discussionRepository = discussionRepository;

  final DiscussionRepository _discussionRepository;

  Future<Either<Failure, Discussion?>> createDiscussion({
    required CreateDiscussionReq createDiscussionReq,
  }) async {
    try {
      return await _discussionRepository.createDiscussion(
        createDiscussionReq: createDiscussionReq,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, List<AppUser?>>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      return await _discussionRepository.fetchConnectedUsers(
        userId: userId,
        limit: limit,
        offset: offset,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, List<AppUser?>>> fetchUsers({
    required int limit,
    required int offset,
  }) async {
    try {
      return await _discussionRepository.fetchUsers(
        limit: limit,
        offset: offset,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, List<DiscussionInviteRes?>>> fetchDiscussionInvites({
    required String userId,
  }) async {
    try {
      return await _discussionRepository.fetchDiscussionInvites(
        userId: userId,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, List<Discussion?>>> fetchActiveDiscussions({
    required String userId,
  }) async {
    try {
      return await _discussionRepository.fetchActiveDiscussions(
        userId: userId,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, List<DiscussionMessage>>> fetchDiscussionMessages({
    required int discussionId,
    required int limit,
    required int offset,
  }) async {
    try {
      return await _discussionRepository.fetchDiscussionMessages(
        discussionId: discussionId,
        limit: limit,
        offset: offset,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, DiscussionMessage?>> sendMessageToDiscussion({
    required DiscussionMessage discussionMessage,
  }) async {
    try {
      return await _discussionRepository.sendMessageToDiscussion(
        discussionMessage: discussionMessage,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, ResponseMsg>> joinDiscussion({
    required int discussionId,
  }) async {
    try {
      return await _discussionRepository.joinDiscussion(
        discussionId: discussionId,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, ResponseMsg>> rejectDiscussion({
    required int discussionId,
  }) async {
    try {
      return await _discussionRepository.rejectDiscussion(
        discussionId: discussionId,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Either<Failure, List<AppUser?>>> fetchDiscussionParticipants({
    required int discussionId,
  }) async {
    try {
      return await _discussionRepository.fetchDiscussionParticipants(
        discussionId: discussionId,
      );
    } catch (_) {
      rethrow;
    }
  }
}
