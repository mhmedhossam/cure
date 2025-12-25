import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Models/DoctorProfileDetails.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/UseCase/ProfileDetails_Use_Case.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit(this.profiledetailsUseCase)
    : super(ProfileDetailsInitial());
  final ProfiledetailsUseCase profiledetailsUseCase;
  getProfileDetails({required int idDoctor}) async {
    emit(ProfileDetailsLoading());
    var data = await profiledetailsUseCase.call(idDoctor: idDoctor);
    data.fold(
      (failure) => emit(ProfileDetailsFailure(emessage: failure.message)),
      (datamodels) => emit(ProfileDetailsSucess(detailsModels: datamodels)),
    );
  }
}
