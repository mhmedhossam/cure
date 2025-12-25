import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/error_handler.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/notification/data/models/notification_model.dart';

import '../../../../core/services/api/network/network_info.dart';
import '../../domain/repo/notification_repo.dart';
import '../data_source/remote/notification_data_source.dart';

class NotificationRepoImp implements NotificationRepository {
  final NotificationDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationRepoImp({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NotificationsModel>> getNotifications() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await remoteDataSource.getNotification();
      return Right(data!);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, NotificationsModel>> getUnreadNotifications() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await remoteDataSource.getUnreadNotification();
      return Right(data!);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
