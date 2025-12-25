import 'package:round_8_mobile_cure_team3/features/profile/data/models/birth_date_model.dart';

class ExtraDataModel {
  final BirthdateModel? birthdate;

  ExtraDataModel({this.birthdate});

  factory ExtraDataModel.fromJson(Map<String, dynamic> json) {
    return ExtraDataModel(
      birthdate: json['birthdate'] != null
          ? BirthdateModel.fromJson(json['birthdate'])
          : null,
    );
  }
}
