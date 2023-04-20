class LoginValidation {
  static bool emailValidation(String email) {
    var re = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return re.hasMatch(email);
  }

  static bool passwordValidation(String password) {
    var re = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return re.hasMatch(password);
  }
}
