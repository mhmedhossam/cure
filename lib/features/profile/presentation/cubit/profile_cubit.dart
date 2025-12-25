import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_keys.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/local_data_source/local_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/get_notification.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/log_out_use_case.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final LogOutUseCase logOutUseCase;
  List<UserModel> Notification = [];
  // final GetNotification getNotification;
  ProfileCubit({
    required this.getProfileUseCase,
    required this.logOutUseCase,
    // required this.getNotification,
  }) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    final user = await getProfileUseCase();
    user.fold(
      (failure) => emit(ProfileError(failure.message)),
      (conversation) => emit(ProfileLoaded(user: conversation)),
    );
  }

  Future<void> logOut() async {
    emit(ProfileLoading());

    final res = await logOutUseCase.call();

    res.fold((failure) => emit(ProfileError(failure.message)), (r) async {
      ServiceLocator.gi<LocalAuth>().delete(AppKeys.TOKEN_KEY);
      ServiceLocator.gi<LocalDataSource>().deleteLocation(); // متمسحهاش
      emit(ProfileLoaded());
    });
  }

  // Future<Either<Failure, UserModel>> getNotification() async {
  //   emit(ProfileLoading());

  //   final res = await getNotification.call();

  //   res.fold(
  //     (l) {
  //       emit(ProfileError(l.message));
  //     },
  //     (r) {
  //       Notification = r;
  //       emit(ProfileLoaded());
  //     },
  //   );
  // }
}
