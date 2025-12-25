bool isValidEmail(String email) {
  if (email.isEmpty) return false;

  // General email pattern
  final pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?"
      r"(?:\.[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?)*$";
  final regExp = RegExp(pattern);

  // Check general email format
  if (!regExp.hasMatch(email.trim())) return false;

  // Restrict to Gmail
  if (!email.trim().toLowerCase().endsWith('@gmail.com')) return false;

  return true;
}

//-----------------password--------------------//

bool validatePassword(String password) {
  return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(password);
}

//----------------name-------------------------//

bool isValidName(String name) {
  if (name.trim().isEmpty) return false;

  // Must be 3 characters or more and only letters + spaces
  final regex = RegExp(r"^[a-zA-Z\s]{3,}$");

  return regex.hasMatch(name.trim());
}

//========================phone number=====================//

String? validatePhone({required String? value}) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }

  // Only digits
  final RegExp phoneRegExp = RegExp(r'^[0-9]+$');
  if (!phoneRegExp.hasMatch(value)) {
    return 'Phone number must contain only digits';
  }

  // Check length (example: 10 digits)
  if (value.length != 11) {
    return 'Phone number must be 11 digits';
  }

  // Optional: check prefix for Egypt
  if (!value.startsWith('01')) {
    return 'Phone number must start with 01';
  }

  return null; // valid
}
