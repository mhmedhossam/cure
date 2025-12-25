import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/datum.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/repository/home_repository.dart';

class GetAllDoctorsUseCase {
  HomeRepository homeRepository;
  GetAllDoctorsUseCase({required this.homeRepository});
  Future<Either<Failure, List<Datum>>> call(
    String? searchName,
    String? searchLocation,
  ) async {
    print("Start Request");
    var res = await homeRepository.getAllDoctors(searchName, searchLocation);
    print("end Request");
    return res;
  }
}
