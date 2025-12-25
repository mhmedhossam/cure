import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/repositories/repo_interface.dart';

class GetNotification {
  final ProfileRepository repository;

  GetNotification({required this.repository});
  Future<Either<Failure, UserModel>> call() async {
    return await repository.getNotification();
  }
}
