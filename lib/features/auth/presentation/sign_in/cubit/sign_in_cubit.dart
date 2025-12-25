import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/sign_in_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/usecases/sign_in_usecase.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;

  SignInCubit(this.signInUseCase) : super(SignInInitial());

  Future<void> signIn({required SignInParam param}) async {
    emit(SignInLoading());

    final result = await signInUseCase.signIn(param: param);
    result.fold(
          (failure) {
        emit(SignInFailure(failure.message));
      },
          (signIn) {
        emit(SignInSuccess(signIn.message ?? 'Sign in successful'));
      },
    );
  }
}