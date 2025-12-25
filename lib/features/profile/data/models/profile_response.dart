import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';

class ProfileResponse {
  final bool success;
  final String message;
  final UserModel user;

  ProfileResponse({
    required this.success,
    required this.message,
    required this.user,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: json['success'],
      message: json['message'],
      user: UserModel.fromJson(json['data']),
    );
  }
}
