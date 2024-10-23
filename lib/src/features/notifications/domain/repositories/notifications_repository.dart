import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/notifications/domain/domain.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<Notification>>> fetchNotifications({
    required String userId,
    required int limit,
    required int offset,
  });
}
