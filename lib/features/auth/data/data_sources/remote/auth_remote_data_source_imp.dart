import 'dart:developer';

import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/register_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/sign_in_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/register_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/sign_in_param.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/services/api/network/dio_provider.dart';
import '../../../../chat/data/endpoints.dart';
import '../../../domain/entities/otp_param.dart';
import '../../models/otp_model.dart';

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  @override
  Future<SignInModel> signIn(SignInParam param) async {


    final response = await DioProvider.post(
      Endpoints.signIn,
      data: {
        "phone":'+20${param.phone.toString()}',
        "password": param.password.toString(),
      },
      headres: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    log('response ${response.toString()}');
    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return SignInModel.fromJson(data);
  }

  @override
  Future<RegisterModel> register(RegisterParam param) async {
    final response = await DioProvider.post(
      Endpoints.register,
      data: {
        "phone": param.phone.toString(),
        "password": param.password.toString(),
        "name": param.name.toString(),
        'email': param.email.toString(),
        'password_confirmation': param.password_confirmation.toString(),
      },
      headres: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    log("///////////////////");
    log('response ${response.toString()}');
    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return RegisterModel.fromJson(data);
  }

  @override
  Future<OtpModel?> verifyOtp(OtpParam param) async {
    final response = await DioProvider.post(
      Endpoints.verifyOtp,
      data: {"phone": param.phone.toString(), "otp": param.otpCode.toString()},
      headres: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    log("///////////////////");
    log('response ${response.toString()}');
    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return OtpModel.fromJson(data);
  }

  @override
  Future<OtpModel?> resendOtp(String phone) async {
    final response = await DioProvider.post(
      Endpoints.resendOtp,
      data: {"phone": phone},
      headres: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    log("///////////////////");
    log('response ${response.toString()}');
    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return OtpModel.fromJson(data);
  }
}
