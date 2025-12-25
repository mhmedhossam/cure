import 'location.dart';
import 'specialty.dart';

class Datum {
  int? id;
  String? name;
  String? email;
  dynamic mobile;
  String? profilePhoto;
  Specialty? specialty;
  String? licenseNumber;
  String? bio;
  double? sessionPrice;
  String? clinicAddress;
  Location? location;
  int? experienceYears;

  Datum({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.profilePhoto,
    this.specialty,
    this.licenseNumber,
    this.bio,
    this.sessionPrice,
    this.clinicAddress,
    this.location,
    this.experienceYears,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    mobile: json['mobile'] as dynamic,
    profilePhoto: json['profile_photo'] as String?,
    specialty: json['specialty'] == null
        ? null
        : Specialty.fromJson(json['specialty'] as Map<String, dynamic>),
    licenseNumber: json['license_number'] as String?,
    bio: json['bio'] as String?,
    sessionPrice: (json['session_price'] as num?)?.toDouble(),
    clinicAddress: json['clinic_address'] as String?,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    experienceYears: json['experience_years'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'profile_photo': profilePhoto,
    'specialty': specialty?.toJson(),
    'license_number': licenseNumber,
    'bio': bio,
    'session_price': sessionPrice,
    'clinic_address': clinicAddress,
    'location': location?.toJson(),
    'experience_years': experienceYears,
  };
}
