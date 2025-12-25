part of 'profile_details_cubit.dart';

@immutable
sealed class ProfileDetailsState {}

final class ProfileDetailsInitial extends ProfileDetailsState {}

final class ProfileDetailsLoading extends ProfileDetailsState {}

final class ProfileDetailsSucess extends ProfileDetailsState {
  final DoctorDetailsModels detailsModels;

  ProfileDetailsSucess({required this.detailsModels});
}

final class ProfileDetailsFailure extends ProfileDetailsState {
  final String emessage;

  ProfileDetailsFailure({required this.emessage});
}
