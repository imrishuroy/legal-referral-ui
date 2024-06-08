import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';

@lazySingleton
class FeedUsecase {
  FeedUsecase({
    required FeedRepository feedRepository,
  }) : _feedRepository = feedRepository;

  final FeedRepository _feedRepository;

  Future<Either<Failure, List<Feed?>>> fetchFeeds({
    required String userId,
  }) async {
    return _feedRepository.fetchFeeds(userId: userId);
  }
}
