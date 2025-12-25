import 'package:round_8_mobile_cure_team3/features/notification/data/models/notification_model.dart';

abstract class NotificationDataSource {
  Future<NotificationsModel?> getNotification();
  Future<NotificationsModel?> getUnreadNotification();
}