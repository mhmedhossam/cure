part of 'select_date_cubit.dart';

@immutable
sealed class SelectDateState {}

final class SelectDateInitial extends SelectDateState {}

final class SelectDateLoading extends SelectDateState {}

final class SelectDateSucess extends SelectDateState {
  final List<DateModels> dateModels;

  SelectDateSucess({required this.dateModels});
}

final class SelectDatefailure extends SelectDateState {
  final String emessage;

  SelectDatefailure({required this.emessage});
}
