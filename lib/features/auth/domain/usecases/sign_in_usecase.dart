import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/sign_in_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/sign_in_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failure.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  Future<Either<Failure, SignInModel>> signIn({
    required SignInParam param,
  }) async {
    return await repository.signIn(param: param);
  }
}