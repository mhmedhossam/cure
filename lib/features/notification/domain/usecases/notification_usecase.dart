import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/notification/data/models/notification_model.dart';

import '../repo/notification_repo.dart';

class NotificationUseCase {
  final NotificationRepository repository;

  NotificationUseCase({required this.repository});

  Future<Either<Failure, NotificationsModel>> getNotifications() async {
    return await repository.getNotifications();
  }

  Future<Either<Failure, NotificationsModel>> getUnreadNotifications() async {
    return await repository.getUnreadNotifications();
  }
}
