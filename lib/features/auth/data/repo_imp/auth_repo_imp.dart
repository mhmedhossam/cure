import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/otp_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/register_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/sign_in_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/otp_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/register_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/sign_in_param.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/services/api/network/network_info.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote/auth_remote_data_source.dart';

class AuthRepoImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalAuth local;

  AuthRepoImp({required this.remoteDataSource, required this.networkInfo,required this.local});

  @override
  Future<Either<Failure, SignInModel>> signIn({
    required SignInParam param,
  }) async
  {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await remoteDataSource.signIn(param);
      local.setToken(token :data?.data?.token ?? '');
      return Right(data!);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register({
    required RegisterParam param,
  }) async
  {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await remoteDataSource.register(param);
      return Right(data!);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, OtpModel>> verifyOtp({
      required OtpParam param,
  }) async
  {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await remoteDataSource.verifyOtp(param);
      return Right(data!);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
  @override
  Future<Either<Failure, OtpModel>> resendOtp({
      required String phone,
  }) async
  {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final data = await remoteDataSource.resendOtp(phone);
      return Right(data!);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

}