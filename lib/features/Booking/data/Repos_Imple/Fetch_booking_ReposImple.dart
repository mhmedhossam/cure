import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/error_handler.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/network_info.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Data_Source/BookingRemoteDataSource.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/BookingModels.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/domain/Repos/fetch_Booking_Repos.dart';

class BookingReposimple implements BookingRepos {
  final Bookingremotedatasource bookingremotedatasource;
  final NetworkInfo networkInfo;

  BookingReposimple({
    required this.bookingremotedatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BookingModels>>> fetchBooking() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final data = await bookingremotedatasource.fetchBooking();
      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
