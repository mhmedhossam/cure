import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/otp_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/otp_param.dart';

import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase({required this.repository});

  Future<Either<Failure, OtpModel>> verifyOtp({
    required OtpParam param,
  }) async {
    return await repository.verifyOtp(param: param);
  }

  Future<Either<Failure, OtpModel>> resendOtp({
    required String phone,
  }) async {
    return await repository.resendOtp(phone: phone);
  }
}