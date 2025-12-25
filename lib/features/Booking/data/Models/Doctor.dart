
class Doctor {
  int? id;
  String? name;
  String? speciality;
  String? image;
  String? address;

  Doctor({
    this.id,
    this.name,
    this.speciality,
    this.image,
    this.address,
  });

  factory Doctor.fromJson(dynamic json) {
    return Doctor(
      id: json['id'] as int?,
      name: json['name'] as String?,
      speciality: json['speciality'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
    );
  }

  dynamic toJson() => {
    'id': id,
    'name': name,
    'speciality': speciality,
    'image': image,
    'address': address,
  };
}