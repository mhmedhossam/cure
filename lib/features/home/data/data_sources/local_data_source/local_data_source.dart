import 'package:round_8_mobile_cure_team3/core/services/local/shared_pref.dart';

class LocalDataSource extends SharedPref {
  String kLocation = "kLocation";
  setLocation(String location) {
    setData(kLocation, location);
  }

  String? get location {
    return getData(kLocation);
  }

  deleteLocation() {
    delete(kLocation);
  }
}
