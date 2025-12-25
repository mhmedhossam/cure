import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Models/DateModels.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/domain/UseCase/SelectDate_Use_Case.dart';

part 'select_date_state.dart';

class SelectDateCubit extends Cubit<SelectDateState> {
  SelectDateCubit(this.selectdateUseCase) : super(SelectDateInitial());
  final SelectdateUseCase selectdateUseCase;

  List<DateModels>? allDates; // حفظ كل التواريخ
  String ddd = DateFormat('yyyy-MM-dd').format(DateTime.now());
  selectDateMothed({required int idDoctor}) async {
    emit(SelectDateLoading());
    var data = await selectdateUseCase.call(idDoctor: idDoctor);
    data.fold((failure) => emit(SelectDatefailure(emessage: failure.message)), (
      datamodels,
    ) {
      allDates = datamodels; // حفظ البيانات
      getDateByDay(ddd);
      // emit(SelectDateSucess(dateModels: datamodels));
    });
  }

  // دالة لجلب بيانات يوم معين
  void getDateByDay(String date) {
    if (allDates == null || allDates!.isEmpty) {
      emit(SelectDatefailure(emessage: 'No dates available'));
      return;
    }

    // فلتر التواريخ حسب اليوم المطلوب
    final filteredDate = allDates!.where((dateModel) {
      return dateModel.date == date; // بافترض إن عندك property اسمه date
    }).toList();

    if (filteredDate.isEmpty) {
      emit(SelectDatefailure(emessage: 'No data found for this date'));
    } else {
      emit(SelectDateSucess(dateModels: filteredDate));
    }
  }
}
