import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/register_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/register_param.dart';

import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<Either<Failure, RegisterModel>> register({
    required RegisterParam param,
  }) async {
    return await repository.register(param: param);
  }
}