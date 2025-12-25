import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/otp_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/usecases/otp_use_case.dart';


part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpUseCase useCase;

  VerifyOtpCubit(this.useCase) : super(VerifyOtpInitial());


  Future<void> verifyOtp({required OtpParam param}) async {
    emit(VerifyOtpLoading());

    final result = await useCase.verifyOtp(param: param);
    result.fold(
          (failure) {
        emit(VerifyOtpFailure(failure.message));
      },
          (data) {
        emit(VerifyOtpSuccess(data.message ?? 'Code Sent successful'));
      },
    );
  }

  Future<void> resendOtp({required String phone}) async {
    emit(ResendOtpLoading());

    final result = await useCase.resendOtp(phone: phone);

    result.fold(
          (failure) => emit(ResendOtpFailure(failure.message)),
          (data) => emit(ResendOtpSuccess(data.message ?? 'Code Resent')),
    );
  }
}
