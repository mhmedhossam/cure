
import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/BookingModels.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/domain/Repos/fetch_Booking_Repos.dart';

class FetchBookingUseCase {
  final BookingRepos bookingRepos;

  FetchBookingUseCase({required this.bookingRepos});

  Future<Either<Failure,List<BookingModels> >> call(
    
  ) async {
    return await bookingRepos.fetchBooking();
  }
}
