import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Models/DateModels.dart';

abstract class Selectdaterepos {
  Future<Either<Failure,List<DateModels> >> SelectDate ({required int idDoctor});
}
