import 'package:round_8_mobile_cure_team3/features/auth/data/models/register_model.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/models/sign_in_model.dart';

import '../../../domain/entities/otp_param.dart';
import '../../../domain/entities/register_param.dart';
import '../../../domain/entities/sign_in_param.dart';
import '../../models/otp_model.dart';

abstract class AuthRemoteDataSource {
  Future<SignInModel?> signIn(SignInParam param);

  Future<RegisterModel?> register(RegisterParam param);

  Future<OtpModel?> verifyOtp(OtpParam param);
  Future<OtpModel?> resendOtp(String phone);

  // Future<RegisterModel?> resendOtp(RegisterParam param);
  //
  // Future<RegisterModel?> forgetPassword(RegisterParam param);
  //
  // Future<RegisterModel?> resetPassword(RegisterParam param);
  //
  // Future<RegisterModel?> googleLogIn(RegisterParam param);
  //
  // Future<RegisterModel?> googleSignup(RegisterParam param);
}
