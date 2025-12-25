import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;
  static const String ktoken = "token";
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static SharedPref get instance => SharedPref();

  //default setData
  setData(String key, dynamic value) {
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }

  //default getData
  getData(String key) {
    return prefs.get(key);
  }

  //default delete
  delete(String key) {
    return prefs.remove(key);
  }
}
