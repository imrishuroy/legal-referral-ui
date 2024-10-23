import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/notifications/data/data.dart';
import 'package:legal_referral_ui/src/features/notifications/domain/domain.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl extends NotificationsRepository {
  NotificationsRepositoryImpl({
    required NotificationsDatasource notificationsDatasource,
  }) : _notificationsDatasource = notificationsDatasource;

  final NotificationsDatasource _notificationsDatasource;

  @override
  Future<Either<Failure, List<Notification>>> fetchNotifications({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _notificationsDatasource.fetchNotifications(
        userId: userId,
        limit: limit,
        offset: offset,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }
}
