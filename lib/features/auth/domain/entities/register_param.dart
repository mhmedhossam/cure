class RegisterParam {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? password_confirmation;

  RegisterParam({
    required this.password,
    required this.phone,
    required this.email,
    required this.name,
    required this.password_confirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'email': email,
      'password_confirmation': password_confirmation,
      'name': name,
    };
  }
}
