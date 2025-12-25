
// Specialty Model
class Specialty {
  final int id;
  final String name;
  final String image;

  Specialty({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}