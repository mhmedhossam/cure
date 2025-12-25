// Doctor Model
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/location.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/specialty.dart';

class DoctorDetailsModels {
  final int id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? profilePhoto;
  final Specialty specialty;
  final String? licenseNumber;
  final String? bio;
  final double sessionPrice;
  final String? clinicAddress;
  final Location location;
  final int experienceYears;

  DoctorDetailsModels({
    required this.id,
    required this.name,
    required this.email,
    this.mobile,
    this.profilePhoto,
    required this.specialty,
    required this.licenseNumber,
    required this.bio,
    required this.sessionPrice,
    required this.clinicAddress,
    required this.location,
    required this.experienceYears,
  });

  factory DoctorDetailsModels.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsModels(
      id: json['id'] as int,
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      mobile: json['mobile'] as String? ?? "",
      profilePhoto: json['profile_photo'] as String? ?? "",
      specialty: Specialty.fromJson(json['specialty'] as Map<String, dynamic>),
      licenseNumber: json['license_number'] as String? ?? "",
      bio: json['bio'] as String? ?? "",
      sessionPrice: (json['session_price'] as num).toDouble(),
      clinicAddress: json['clinic_address'] as String? ?? "",
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      experienceYears: json['experience_years'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'profile_photo': profilePhoto,
      'specialty': specialty.toJson(),
      'license_number': licenseNumber,
      'bio': bio,
      'session_price': sessionPrice,
      'clinic_address': clinicAddress,
      'location': location.toJson(),
      'experience_years': experienceYears,
    };
  }
}
