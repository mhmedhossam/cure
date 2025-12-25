part of 'get_booking_cubit.dart';

@immutable
sealed class GetBookingState {}

final class GetBookingInitial extends GetBookingState {}

final class GetBookingLoading extends GetBookingState {}

final class GetBookingSucess extends GetBookingState {
  final List<BookingModels> bookingdata;

  GetBookingSucess({required this.bookingdata});
}

final class GetBookingFailure extends GetBookingState {
  final String emessage;

  GetBookingFailure({required this.emessage});
}
