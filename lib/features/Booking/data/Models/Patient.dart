
class Patient {
  int? id;
  String? name;
  String? image;

  Patient({
    this.id,
    this.name,
    this.image,
  });

  factory Patient.fromJson(dynamic json) {
    return Patient(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  dynamic toJson() => {
    'id': id,
    'name': name,
    'image': image,
  };
}