import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/local/shared_pref.dart';

class LocalAuth extends SharedPref {
  Future? setToken({String? token}) {
    if (token == null) return null;

    return SharedPref().setData(AppKeys.TOKEN_KEY, token);
  }

  dynamic getToken() {
    return SharedPref().getData(AppKeys.TOKEN_KEY);
  }
  dynamic deleteToken() {
    return SharedPref().delete(AppKeys.TOKEN_KEY);
  }
}
