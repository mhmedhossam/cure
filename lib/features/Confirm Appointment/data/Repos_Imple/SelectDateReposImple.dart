
import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/error_handler.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/network_info.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Data_Source/SelectDateRemote.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Models/DateModels.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/domain/Repos/SelectDateRepos.dart';

class Selectdatereposimple implements Selectdaterepos {
  final Selectdateremote selectdateremote;
  final NetworkInfo networkInfo;

  Selectdatereposimple({
    required this.selectdateremote,
    required this.networkInfo,
  });


  @override
  Future<Either<Failure, List<DateModels>>> SelectDate({required int idDoctor}) async{
  if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final data = await selectdateremote.selectdate(
        idDoctor: idDoctor
      );
      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
