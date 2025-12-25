import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'save_date_state.dart';

class SaveDateCubit extends Cubit<SaveDateState> {
  SaveDateCubit() : super(SaveDateInitial());
  static String days = '';
  static String dates = '';
  static String totals = dates;

  Savemothed({ String? day,  String? date}) {
    days = day??"";
    dates = date??"";
  }
}

