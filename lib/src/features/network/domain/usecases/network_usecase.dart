import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

@lazySingleton
class NetworkUseCase {
  NetworkUseCase({required NetworkRepository networkRepository})
      : _networkRepository = networkRepository;

  final NetworkRepository _networkRepository;

  Future<Either<Failure, ResponseMsg?>> sendConnection({
    required SendConnectionReq sendConnectionReq,
  }) async {
    return _networkRepository.sendConnection(
      sendConnectionReq: sendConnectionReq,
    );
  }

  Future<Either<Failure, Connection?>> acceptConnection({
    required int id,
  }) async {
    return _networkRepository.acceptConnection(
      id: id,
    );
  }

  Future<Either<Failure, ResponseMsg?>> rejectConnection({
    required int id,
  }) async {
    return _networkRepository.rejectConnection(
      id: id,
    );
  }

  Future<Either<Failure, List<ConnectionInvitation?>>>
      fetchConnectionInvitations({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    return _networkRepository.fetchConnectionInvitations(
      userId: userId,
      offset: offset,
      limit: limit,
    );
  }

  Future<Either<Failure, List<Connection?>>> fetchConnections({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    return _networkRepository.fetchConnections(
      userId: userId,
      offset: offset,
      limit: limit,
    );
  }

  Future<Either<Failure, List<Recommendation?>>> fetchRecommendations({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    return _networkRepository.fetchRecommendations(
      userId: userId,
      offset: offset,
      limit: limit,
    );
  }

  Future<Either<Failure, ResponseMsg?>> cancelRecommendation({
    required CancelRecommendationReq cancelRecommendationReq,
  }) async {
    return _networkRepository.cancelRecommendation(
      cancelRecommendationReq: cancelRecommendationReq,
    );
  }

  Future<Either<Failure, UserConnectionStatus>> checkConnection({
    required String userId,
    required String otherUserId,
  }) async {
    return _networkRepository.checkConnection(
      userId: userId,
      otherUserId: otherUserId,
    );
  }
}
