import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';

abstract class FeedRepository {
  Future<Either<Failure, List<Feed?>>> fetchFeeds({
    required String userId,
  });
}
