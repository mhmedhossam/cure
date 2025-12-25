class User {
  final String name;
  final String email;
  final String phone;
  final String? image;
  final String? address;
  final Birthdate? birthdate;

  User({
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.address,
    this.birthdate,
  });
}

class Birthdate {
  final int? day;
  final int? month;
  final int? year;

  Birthdate({this.day, this.month, this.year});
}
