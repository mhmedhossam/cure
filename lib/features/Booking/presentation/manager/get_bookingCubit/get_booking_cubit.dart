import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/BookingModels.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/domain/UseCase/Fetch_booking_Use_Case.dart';

part 'get_booking_state.dart';

class GetBookingCubit extends Cubit<GetBookingState> {
  GetBookingCubit(this.fetchBookingUseCase) : super(GetBookingInitial());
  final FetchBookingUseCase fetchBookingUseCase;
  getBooking() async {
    emit(GetBookingLoading());
    var data = await fetchBookingUseCase.call();
    data.fold(
      (failure) => emit(GetBookingFailure(emessage: failure.message)),
      (booking) => emit(GetBookingSucess(bookingdata: booking)),
    );
  }
}
