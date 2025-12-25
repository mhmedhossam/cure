import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Models/DoctorProfileDetails.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/Repos/ProfileRepos.dart';

class ProfiledetailsUseCase {
  final Profilerepos fetchprofiledetails;

  ProfiledetailsUseCase({required this.fetchprofiledetails});

  Future<Either<Failure,DoctorDetailsModels >> call(
    {required int idDoctor }
  ) async {
    return await fetchprofiledetails.fetchprofile(idDoctor:idDoctor );
  }
}