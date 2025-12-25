import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/repositories/repo_interface.dart';

class LogOutUseCase {
  ProfileRepository profileRepository;
  LogOutUseCase({required this.profileRepository});
  Future<Either<Failure, void>> call() async {
    return await profileRepository.logOut();
  }
}
