import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Models/DoctorProfileDetails.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/endpoints.dart';

import '../../../../core/error/failure.dart';

abstract class Profiledatailsremote {
  Future<DoctorDetailsModels> fetchProfileDetails({required int idDoctor});
}

class ProfiledatailsremoteImp extends Profiledatailsremote {
  final String token = ServiceLocator.gi<LocalAuth>().getToken();
  @override
  Future<DoctorDetailsModels> fetchProfileDetails({
    required int idDoctor,
  }) async {
    final response = await DioProvider.get(
      "${Endpoints.getsingleDoctor}${idDoctor}",

      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );
    final data = response.data;
    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    final DoctorDetailsModels datamodels = DoctorDetailsModels.fromJson(
      data["data"],
    );
    return datamodels;
  }
}
