import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/change_password_param.dart';
import '../repositories/repo_interface.dart';

class ChangePasswordUseCase {
  final ProfileRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure, dynamic>> call(ChangePasswordParam param) async {
    return await repository.changePassword(param);
  }
}