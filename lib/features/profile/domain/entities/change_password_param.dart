class ChangePasswordParam {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword ;

  ChangePasswordParam({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}