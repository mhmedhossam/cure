part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess(this.message);
}

final class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error);
}