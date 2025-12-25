import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';

import '../entities/change_password_param.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserModel>> getProfile();
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, UserModel>> getNotification();
  Future<Either<Failure, dynamic>> deleteAccount();
  Future<Either<Failure, dynamic>> changePassword(ChangePasswordParam param);
}
