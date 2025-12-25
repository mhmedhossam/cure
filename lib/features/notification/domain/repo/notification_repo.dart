import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/notification/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationsModel>> getNotifications();
  Future<Either<Failure, NotificationsModel>> getUnreadNotifications();
}
