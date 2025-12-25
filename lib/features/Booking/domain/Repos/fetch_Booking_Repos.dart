import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/BookingModels.dart';

abstract class BookingRepos {
  Future<Either<Failure,List<BookingModels> >> fetchBooking ();
}
