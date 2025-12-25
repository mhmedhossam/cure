import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/entities/entity.dart';

abstract class ProfileState {}

// Initial state
class ProfileInitial extends ProfileState {}

// Loading state
class ProfileLoading extends ProfileState {}

// Loaded state with User data
class ProfileLoaded extends ProfileState {
  final UserModel? user;
  ProfileLoaded({this.user});
}

// Error state with message
class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
