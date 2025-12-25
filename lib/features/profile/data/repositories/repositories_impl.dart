import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/error_handler.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/network_info.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/sign_in_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/sign_in_param.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/datasources/profile_api_service.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/entities/entity.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/repositories/repo_interface.dart';

import '../../domain/entities/change_password_param.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApiService apiService;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl(this.apiService, this.networkInfo);

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await apiService.getProfile();

      return Right(data);
    } catch (e) {
      print(e.toString());
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changePassword(
    ChangePasswordParam param,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await apiService.changePassword(param);

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteAccount() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await apiService.deleteAccount();

      return Right(data);
      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<Failure, void>> logOut() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      return Right(await apiService.logOut());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getNotification() {
    // TODO: implement getNotification
    throw UnimplementedError();
  }

  // Future<Either<Failure, UserModel>> getNotification() async {
  //   if (!await networkInfo.isConnected) {
  //     return Left(NetworkFailure());
  //   }
  //   try {
  //     return Right(await apiService.getNotification());
  //   } catch (e) {
  //     return Left(ErrorHandler.handle(e));
  //   }
  // }
}
