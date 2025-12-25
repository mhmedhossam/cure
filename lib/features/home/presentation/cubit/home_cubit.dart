import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/datum.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/add_to_favourite.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/get_all_doctors_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_states.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/model/specialties_model.dart';

import '../../../../core/di/servies_locator.dart';
import '../../data/data_sources/local_data_source/local_data_source.dart';

class HomeCubit extends Cubit<HomeState> {
  String? searchName;
  int? id;
  String? searchLocation;
  String? selectedString;
  String? specialtySearch;
  bool isFavourite = false;
  Map<String, GlobalKey> chipKeys = {};
  GetAllDoctorsUseCase getAllDoctorsUseCase;
  AddToFavouriteUseCase addToFavouriteUseCase;
  List<Datum> doctors = [];
  HomeCubit({
    required this.getAllDoctorsUseCase,
    required this.addToFavouriteUseCase,
    this.specialtySearch,
    this.searchName,
  }) : super(HomeInitialState());
  doctorScreenInit() {
    selectedString = specialtySearch ?? "All";
    chipKeys["All"] = GlobalKey();
    for (var specialty in specialtiesList) {
      chipKeys[specialty.text] = GlobalKey();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (selectedString != "All") {
        if (chipKeys[selectedString] == null) {
          Scrollable.ensureVisible(
            chipKeys["All"]!.currentContext!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          Scrollable.ensureVisible(
            chipKeys[selectedString]!.currentContext!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  getAllDoctors() async {
    emit(HomeLoadingState());
    searchLocation = ServiceLocator.gi<LocalDataSource>().location;
    var res = await getAllDoctorsUseCase.call(searchName, searchLocation);

    res.fold(
      (l) {
        emit(HomeFailureState(message: l.message));
      },
      (r) {
        doctors = r;
        emit(HomeSucceededState());
      },
    );
  }

  addtoFavourite() async {
    var res = await addToFavouriteUseCase.call(id ?? 0);

    res.fold(
      (l) {
        emit(HomeFailureState(message: l.message));
      },
      (r) {
        print(r["is_favorite"]);
        isFavourite = r["is_favorite"] as bool;
        emit(HomeSucceededState());
      },
    );
  }
}
