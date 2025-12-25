import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/entities/change_password_param.dart';

import '../../../../core/di/servies_locator.dart';
import '../../../auth/data/data_sources/local/local_auth.dart';
import '../../../chat/data/endpoints.dart';

class ProfileApiService {
  ProfileApiService();
  String token = ServiceLocator.gi<LocalAuth>().getToken();
  Future<UserModel> getProfile() async {
    final response = await DioProvider.get(
      "/profile",
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print(response.data);
    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return UserModel.fromJson(data);
  }

  ///settings
  Future<dynamic> changePassword(ChangePasswordParam param) async {
    final response = await DioProvider.put(
      Endpoints.changePassword,
      data: {
        'current_password': param.currentPassword,
        'new_password': param.newPassword,
        'new_password_confirmation': param.confirmPassword,
      },

      headres: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return data;
  }

  Future<dynamic> deleteAccount() async {
    final response = await DioProvider.delete(
      Endpoints.deleteAccount,
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final data = response.data;

    if (data == null) {
      throw ServerFailure('Invalid response from server');
    }

    return data;
  }

  Future<void> logOut() async {
    final res = await DioProvider.post(
      "/api/profile/logout",
      headres: {"Authorization": "Bearer $token"},
    );

    if (res.data == null) {
      throw ServerFailure('Invalid response from server');
    }
  }

  // Future<List<UserModel>> getNotification() async {
  //   final res = await DioProvider.get(
  //     "/api/profile/logout",

  //     headers: {"Authorization": "Bearer $token"},
  //   );

  //   if (res.data == null) {
  //     throw ServerFailure('Invalid response from server');
  //   }

  // UserModel user =   UserModel.fromJson(res.data as Map<String, dynamic>);
  //  var List<dynamic>notifactions =user.extraData;
  //  notifactions.map((e){})
  //  =  user.d ;
  // return;
  // }

  // Future<>
}
