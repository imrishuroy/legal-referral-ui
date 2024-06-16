import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

abstract class NetworkRepository {
  Future<Either<Failure, ResponseMsg?>> sendConnection({
    required SendConnectionReq sendConnectionReq,
  });

  Future<Either<Failure, Connection?>> acceptConnection({
    required int id,
  });

  Future<Either<Failure, ResponseMsg?>> rejectConnection({
    required int id,
  });

  Future<Either<Failure, List<ConnectionInvitation?>>>
      fetchConnectionInvitations({
    required String userId,
    required int offset,
    required int limit,
  });

  Future<Either<Failure, List<Connection?>>> fetchConnections({
    required String userId,
    required int offset,
    required int limit,
  });

  Future<Either<Failure, List<Recommendation?>>> fetchRecommendations({
    required String userId,
    required int offset,
    required int limit,
  });

  Future<Either<Failure, ResponseMsg?>> cancelRecommendation({
    required CancelRecommendationReq cancelRecommendationReq,
  });

  Future<Either<Failure, UserConnectionStatus>> checkConnection({
    required String userId,
    required String otherUserId,
  });
}
