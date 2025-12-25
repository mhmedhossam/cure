
import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Models/DoctorProfileDetails.dart';

abstract class Profilerepos {
  Future<Either<Failure,DoctorDetailsModels >>fetchprofile ({required int idDoctor });
}
