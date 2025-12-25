import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/register_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/usecases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase useCase;

  RegisterCubit(this.useCase) : super(RegisterInitial());

  Future<void> register({required RegisterParam param}) async {
    log('🟢 REGISTER CUBIT METHOD STARTED');

    emit(RegisterLoading());
    log('🟢 LOADING EMITTED');
    log('🟡 CALLING REPOSITORY');

    final result = await useCase.register(param: param);
    log('🟢 REPOSITORY RETURNED');
    log('🟢 ${param.phone}');

    result.fold(
          (failure) {
        emit(RegisterFailure(failure.message));
        log('🔴 ERROR IN REGISTER');
        log('ERROR: ${failure.toString()}');
        log('STACK: ${failure.message}');
        log('STACK: ${failure.statusCode}');
          },
          (data) {
        emit(RegisterSuccess(data.message ?? 'Sign in successful'));
        log('🟢 SUCCESS EMITTED');

          },
    );
  }
}
