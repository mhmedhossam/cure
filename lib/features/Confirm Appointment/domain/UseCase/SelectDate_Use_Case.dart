
import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Models/DateModels.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/domain/Repos/SelectDateRepos.dart';

class SelectdateUseCase {
  final Selectdaterepos selectdaterepos;

  SelectdateUseCase({required this.selectdaterepos});

  Future<Either<Failure,List<DateModels> >> call(
    {required int idDoctor}
  ) async {
    return await selectdaterepos.SelectDate(idDoctor: idDoctor);
  }
}
