import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/datum.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Datum>>> getAllDoctors(
    String? searchName,
    String? searchLocation,
  );
  Future<Either<Failure, Map<String, dynamic>>> addToFavourite(int id);
}
