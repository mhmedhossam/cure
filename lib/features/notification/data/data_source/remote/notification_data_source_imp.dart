import 'dart:developer';

import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/notification/data/models/notification_model.dart';

import '../../../../../core/di/servies_locator.dart';
import '../../../../../core/services/api/network/dio_provider.dart';
import '../../../../auth/data/data_sources/local/local_auth.dart';
import '../../../../chat/data/endpoints.dart';
import 'notification_data_source.dart';

class NotificationRemoteDataSourceImp extends NotificationDataSource {
  final String token = ServiceLocator.gi<LocalAuth>().getToken();

  @override
  Future<NotificationsModel?> getNotification() async {
    final response = await DioProvider.get(
      Endpoints.notification,
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    log('getNotification response: ${response.toString()}');

    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return NotificationsModel.fromJson(data);
  }

  @override
  Future<NotificationsModel?> getUnreadNotification() async {
    final response = await DioProvider.get(
      Endpoints.unreadNotification,
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    log('getUnreadNotification response: ${response.toString()}');

    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return NotificationsModel.fromJson(data);
  }
}
