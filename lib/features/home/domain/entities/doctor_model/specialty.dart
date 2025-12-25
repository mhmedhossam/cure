class Specialty {
  int? id;
  String? name;
  String? image;

  Specialty({this.id, this.name, this.image});

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}
