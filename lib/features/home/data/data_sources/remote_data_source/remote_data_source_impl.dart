import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/home_endpoints/home_endpoints.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/datum.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/doctor_model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  String token = ServiceLocator.gi<LocalAuth>().getToken();
  @override
  Future<List<Datum>> getAllDoctors(
    String? searchName,
    String? searchLocation,
  ) async {
    var response = await DioProvider.get(
      HomeEndpoints.homeEndPoint,
      headers: {"Authorization": "Bearer $token"},
      queryParameters: {
        if (searchName != null) "search": searchName,
        // if (searchLocation != null) "location_query": searchLocation,
      },
    );

    if (response.data == null) {
      throw ServerFailure("Invalid response from server");
    }
    var doctorModel = DoctorModel.fromJson(response.data ?? {});
    List<Datum> DoctorsList = doctorModel.data ?? [];

    return DoctorsList;
  }

  @override
  Future<Map<String, dynamic>> addToFavourite(int id) async {
    var res = await DioProvider.post(
      "${HomeEndpoints.homeEndPoint}/$id/favorite",
      headres: {"Authorization": "Bearer $token"},
    );

    if (res.data == null) {
      throw ServerFailure("Invalid response from server");
    }
    var doctorModel = DoctorModel.fromJson(res.data ?? {});
    Map<String, dynamic> isFavourite = doctorModel.data as Map<String, dynamic>;
    print(isFavourite["is_favorite"]);
    return isFavourite;
  }
}
