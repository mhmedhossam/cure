part of 'notification_cubit.dart';


@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

/// Success state for ALL notifications
final class NotificationSuccess extends NotificationState {
  final List<NotificationDetail> notifications;

  NotificationSuccess(this.notifications);
}

/// Success state for UNREAD notifications
final class UnreadNotificationSuccess extends NotificationState {
  final List<NotificationDetail> notifications;

  UnreadNotificationSuccess(this.notifications);
}

final class NotificationError extends NotificationState {
  final String message;

  NotificationError(this.message);
}
