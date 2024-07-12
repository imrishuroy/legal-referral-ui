import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';

abstract class DiscussionRepository {
  Future<Either<Failure, List<AppUser?>>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, List<AppUser?>>> fetchUsers({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, Discussion?>> createDiscussion({
    required CreateDiscussionReq createDiscussionReq,
  });

  Future<Either<Failure, ResponseMsg?>> updateDiscussionTopic({
    required int discussionId,
    required UpdateDiscussionTopicReq updateDiscussionTopicReq,
  });

  Future<Either<Failure, List<DiscussionInviteRes?>>> fetchDiscussionInvites({
    required String userId,
  });

  Future<Either<Failure, List<Discussion?>>> fetchActiveDiscussions({
    required String userId,
  });

  Future<Either<Failure, List<DiscussionMessage>>> fetchDiscussionMessages({
    required int discussionId,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, DiscussionMessage?>> sendMessageToDiscussion({
    required DiscussionMessage discussionMessage,
  });

  Future<Either<Failure, ResponseMsg>> joinDiscussion({
    required int discussionId,
  });

  Future<Either<Failure, ResponseMsg>> rejectDiscussion({
    required int discussionId,
  });

  Future<Either<Failure, List<AppUser?>>> fetchDiscussionParticipants({
    required int discussionId,
  });

  Future<Either<Failure, List<AppUser?>>> fetchDiscussionUninvitedUsers({
    required int discussionId,
  });
}
