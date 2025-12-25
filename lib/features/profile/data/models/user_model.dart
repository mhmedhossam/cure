import 'package:round_8_mobile_cure_team3/features/profile/data/models/extra_data_model.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String? image;
  final String? address;
  final ExtraDataModel? extraData;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.address,
    this.extraData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      address: json['address'],
      extraData: json['extra_data'] != null
          ? ExtraDataModel.fromJson(json['extra_data'])
          : null,
    );
  }
}
