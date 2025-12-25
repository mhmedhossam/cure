import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/error_handler.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/network_info.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Data_Source/profileDatailsRemote.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Models/DoctorProfileDetails.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/Repos/ProfileRepos.dart';

class Profiledetailsreposimle implements Profilerepos {
  final Profiledatailsremote profiledatailsremote;
  final NetworkInfo networkInfo;

  Profiledetailsreposimle({
    required this.profiledatailsremote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DoctorDetailsModels>> fetchprofile({
    required int idDoctor,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final data = await profiledatailsremote.fetchProfileDetails(
        idDoctor: idDoctor,
      );
      log("h");
      return Right(data);
    } catch (e) {
      print(e.toString());
      return Left(ErrorHandler.handle(e));
    }
  }
}
