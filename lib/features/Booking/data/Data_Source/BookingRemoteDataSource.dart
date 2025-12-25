import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/BookingModels.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/endpoints.dart';

abstract class Bookingremotedatasource {
  Future<List<BookingModels>> fetchBooking();
}

class BookingremotedatasourceImp extends Bookingremotedatasource {
  final String token = ServiceLocator.gi<LocalAuth>().getToken();
  @override
  Future<List<BookingModels>> fetchBooking() async {
    final response = await DioProvider.get(
      Endpoints.Booking,

      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );
    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }
    final List<BookingModels> datamodels = [];
    for (var element in data['data']) {
      datamodels.add(BookingModels.fromJson(element));
    }
    print(datamodels[0].doctor!.id);
    return datamodels;
  }
}
