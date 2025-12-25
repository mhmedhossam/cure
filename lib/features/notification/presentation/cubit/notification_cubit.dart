import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/notification_model.dart';
import '../../domain/usecases/notification_usecase.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationUseCase notificationUseCase;

  NotificationCubit({required this.notificationUseCase})
      : super(NotificationInitial());

  Future<void> getNotifications() async {
    emit(NotificationLoading());

    final result = await notificationUseCase.getNotifications();

    result.fold(
          (failure) => emit(NotificationError(failure.message)),
          (data) => emit(
        NotificationSuccess(
          data.notifications ?? <NotificationDetail>[],
        ),
      ),
    );
  }

  Future<void> getUnreadNotifications() async {
    emit(NotificationLoading());

    final result = await notificationUseCase.getUnreadNotifications();

    result.fold(
          (failure) => emit(NotificationError(failure.message)),
          (data) => emit(
        UnreadNotificationSuccess(
          data.notifications ?? <NotificationDetail>[],
        ),
      ),
    );
  }
}