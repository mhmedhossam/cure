import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/repo_interface.dart';

class DeleteAccountUseCase {
  final ProfileRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<Either<Failure, dynamic>> call() async {
    return await repository.deleteAccount();
  }
}