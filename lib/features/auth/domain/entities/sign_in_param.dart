class SignInParam {
  final String? phone;
  final String? password;

  SignInParam({required this.phone, this.password});

  Map<String, dynamic> toJson() {
    return {'phone': phone, 'password': password};
  }
}