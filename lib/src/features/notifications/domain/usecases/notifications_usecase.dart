import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/features/notifications/domain/domain.dart';

@lazySingleton
class NotificationsUsecase {
  NotificationsUsecase({
    required NotificationsRepository notificationsRepository,
  }) : _notificationsRepository = notificationsRepository;

  final NotificationsRepository _notificationsRepository;

  Future<Either<Failure, List<Notification>>> fetchNotifications({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    return _notificationsRepository.fetchNotifications(
      userId: userId,
      limit: limit,
      offset: offset,
    );
  }
}
