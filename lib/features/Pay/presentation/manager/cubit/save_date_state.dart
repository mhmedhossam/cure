part of 'save_date_cubit.dart';

@immutable
sealed class SaveDateState {}

final class SaveDateInitial extends SaveDateState {}
final class SaveDateSucess extends SaveDateState {}
final class SaveDatefailure extends SaveDateState {}
