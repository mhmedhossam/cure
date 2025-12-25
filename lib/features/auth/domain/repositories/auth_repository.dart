import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/otp_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/register_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/sign_in_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/register_param.dart';

import '../entities/otp_param.dart';
import '../entities/sign_in_param.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInModel>> signIn({required SignInParam param});
  Future<Either<Failure, RegisterModel>> register({required RegisterParam param});
  Future<Either<Failure, OtpModel>> verifyOtp({required OtpParam param});
  Future<Either<Failure, OtpModel>> resendOtp({required String phone});
}