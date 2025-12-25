import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Models/DateModels.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/endpoints.dart';

abstract class Selectdateremote {
  Future<List<DateModels>> selectdate({required int idDoctor});
}

class SelectdateremoteImp extends Selectdateremote {
  final String token = ServiceLocator.gi<LocalAuth>().getToken();

  @override
  Future<List<DateModels>> selectdate({required int idDoctor}) async {
    final response = await DioProvider.get(
      "${Endpoints.getsingleDoctor}${idDoctor}/availability",

      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );
    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }
    List<DateModels> datamodels = [];
    for (var element in data['data']) {
      datamodels.add(DateModels.fromJson(element));
    }

    print(datamodels);
    return datamodels;
  }
}
